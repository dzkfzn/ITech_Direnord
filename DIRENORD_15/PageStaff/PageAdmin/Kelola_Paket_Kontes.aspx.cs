using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStaff_PageAdmin_Kelola_Paket_Kontes : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
    public static string tampunnggambar;
    DateTime today = DateTime.Now;
    private string ASCENDING = " ASC ";
    private string DESCENDING = " DESC ";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Rolename"].ToString() == "Admin")
            {
                if (!Page.IsPostBack)
                {
                    divView.Visible = true;
                    divInputForm.Visible = false;
                    divUpdateForm.Visible = false;
                    divDetail.Visible = false;
                    FillGrid();
                }
            }
            else if (Session["Rolename"].ToString() == "Super Admin")
            {
                Response.Redirect("/PageStaff/PageSuperAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Verifier")
            {
                Response.Redirect("/PageStaff/PageVerifier/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Manajer")
            {
                Response.Redirect("/PageStaff/PageManager/Dashboard.aspx");
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }


    }

    public int ToAngka(string rupiah)
    {
        return int.Parse(Regex.Replace(rupiah, @",.*|\D", ""));
    }

    public DataSet FillGrid()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_package_view", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvPaketKontes.DataSource = ds.Tables[0];
            gvPaketKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGridSearch(string Search)
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_package_search", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvPaketKontes.DataSource = ds.Tables[0];
            gvPaketKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    protected void btnAddView_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divInputForm.Visible = true;
        divUpdateForm.Visible = false;
        divDetail.Visible = false;
    }

    protected void btnUpdateView_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divInputForm.Visible = false;
        divUpdateForm.Visible = true;
        divDetail.Visible = false;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_package_view_update", sqlCon);
        sqlCmd.Parameters.AddWithValue("@PackageID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        txtUpd_NamaPaket.Text = reader[1].ToString();

        txtUpd_BiayaDesainer.Text = reader[2].ToString();
        txtUpd_BiayaDesainer.Text = txtUpd_BiayaDesainer.Text.Substring(0, txtUpd_BiayaDesainer.Text.Length - 5);
        txtUpd_BiayaDesainer.Text = String.Format("{0:n0}", Convert.ToInt64(txtUpd_BiayaDesainer.Text));

        txtUpd_BiayaAdministrasi.Text = reader[3].ToString();
        txtUpd_BiayaAdministrasi.Text = txtUpd_BiayaAdministrasi.Text.Substring(0, txtUpd_BiayaAdministrasi.Text.Length - 5);
        txtUpd_BiayaAdministrasi.Text = String.Format("{0:n0}", Convert.ToInt64(txtUpd_BiayaAdministrasi.Text));


        sqlCon.Close();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            LinkButton btn = (LinkButton)(sender);
            id = btn.CommandArgument;
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_package_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@PackageID", id);
            sqlCmd.Parameters.AddWithValue("@PackageModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@PackageModifiedDate", today);
            sqlCmd.Parameters.AddWithValue("@PackageActive", "0");

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Paket_Kontes.aspx';", true);
            FillGrid();
        }
    }

    protected void btnDeleteEnable_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            LinkButton btn = (LinkButton)(sender);
            id = btn.CommandArgument;
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_package_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@PackageID", id);
            sqlCmd.Parameters.AddWithValue("@PackageModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@PackageModifiedDate", today);
            sqlCmd.Parameters.AddWithValue("@PackageActive", "1");

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Paket_Kontes.aspx';", true);
            FillGrid();
        }
    }

    protected void btnSimpanInputForm_Click(object sender, EventArgs e)
    {
        int totalbiaya = 0;
        totalbiaya = ToAngka(txtInp_BiayaDesainer.Text) + ToAngka(txtInp_BiayaAdministrasi.Text);
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_package_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@PackageName", txtInp_NamaPaket.Text);
        sqlCmd.Parameters.AddWithValue("@PackageDesignerCost", ToAngka(txtInp_BiayaDesainer.Text));
        sqlCmd.Parameters.AddWithValue("@PackageAdminCost", ToAngka(txtInp_BiayaAdministrasi.Text));
        sqlCmd.Parameters.AddWithValue("@PackageTotalCost", totalbiaya);
        sqlCmd.Parameters.AddWithValue("@PackageCreatedBy", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@PackageCreatedDate", today);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        clearInputForm();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Data berhasil disimpan');window.location ='Kelola_Paket_Kontes.aspx';", true);


    }

    void clearInputForm()
    {
        txtInp_NamaPaket.Text = "";
        txtInp_BiayaDesainer.Text = "";
        txtInp_BiayaAdministrasi.Text = "";
    }


    protected void btnKembaliInputForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Paket_Kontes.aspx");
    }


    protected void btnSimpanUpdateForm_Click(object sender, EventArgs e)
    {
        int totalbiaya = 0;
        totalbiaya = ToAngka(txtUpd_BiayaDesainer.Text) + ToAngka(txtUpd_BiayaAdministrasi.Text);
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_package_update", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@PackageID", id);
        sqlCmd.Parameters.AddWithValue("@PackageName", txtUpd_NamaPaket.Text);
        sqlCmd.Parameters.AddWithValue("@PackageDesignerCost", ToAngka(txtUpd_BiayaDesainer.Text));
        sqlCmd.Parameters.AddWithValue("@PackageAdminCost", ToAngka(txtUpd_BiayaAdministrasi.Text));
        sqlCmd.Parameters.AddWithValue("@PackageTotalCost", totalbiaya);
        sqlCmd.Parameters.AddWithValue("@PackageModifiedBy", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@PackageModifiedDate", today);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        clearInputForm();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Data berhasil diperbarui');window.location ='Kelola_Paket_Kontes.aspx';", true);

    }


    void clearUpdateForm()
    {
        txtUpd_NamaPaket.Text = "";
        txtUpd_BiayaDesainer.Text = "";
        txtUpd_BiayaAdministrasi.Text = "";
    }


    protected void btnKembaliUpdateForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Paket_Kontes.aspx");
    }

    protected void gvPaketKontes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvPaketKontes.PageIndex = e.NewPageIndex;
        gvPaketKontes.DataBind();
    }

    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }
    protected void gvPaketKontes_OnSorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;
        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
        }
    }

    private void SortGridView(string sortExpression, string direction)
    {
        DataTable dt = FillGrid().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gvPaketKontes.DataSource = dv;
        gvPaketKontes.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGridSearch(txtSearch.Text);
    }

    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }


    public DataSet FillGridAktif()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_package_view_aktif", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvPaketKontes.DataSource = ds.Tables[0];
            gvPaketKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }
    protected void btnLihatAktif_Click(object sender, EventArgs e)
    {
        FillGridAktif();
    }

    protected void btnDetailView_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divInputForm.Visible = false;
        divUpdateForm.Visible = false;
        divDetail.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_package_view_detail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@PackageID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlPackageID.Text = reader[0].ToString();
        dtlPackageName.Text = reader[1].ToString();

        dtlDesignerCost.Text = reader[2].ToString();
        dtlDesignerCost.Text = dtlDesignerCost.Text.Substring(0, dtlDesignerCost.Text.Length - 5);
        dtlDesignerCost.Text = "Rp. "+String.Format("{0:n0}", Convert.ToInt64(dtlDesignerCost.Text));
        
        dtlAdminCost.Text = reader[3].ToString();
        dtlAdminCost.Text = dtlAdminCost.Text.Substring(0, dtlAdminCost.Text.Length - 5);
        dtlAdminCost.Text = "Rp. " + String.Format("{0:n0}", Convert.ToInt64(dtlAdminCost.Text));

        dtlTotalCost.Text = reader[4].ToString();
        dtlTotalCost.Text = dtlTotalCost.Text.Substring(0, dtlTotalCost.Text.Length - 5);
        dtlTotalCost.Text = "Rp. " + String.Format("{0:n0}", Convert.ToInt64(dtlTotalCost.Text));

        dtlCreatedBy.Text = reader[5].ToString(); 
        dtlCreatedDate.Text = reader[6].ToString();
        if (reader[7].ToString() == "")
        {
            dtlModifiedBy.Text = "-";
        }
        else
        {
            dtlModifiedBy.Text = reader[7].ToString();
        }


        if (reader[8].ToString() == "")
        {
            dtlModifiedDate.Text = "-";
        }
        else
        {
            dtlModifiedDate.Text = reader[8].ToString();
        }


        if (reader[9].ToString() == "1")
        {
            dtlAktif.Text = "Aktif";
        }
        else
        {
            dtlAktif.Text = "Tidak Aktif";
        }
    }

    protected void btnKembaliDetail_Click(object sender, EventArgs e)
    {
        divView.Visible = true;
        divInputForm.Visible = false;
        divUpdateForm.Visible = false;
        divDetail.Visible = false;
    }
}