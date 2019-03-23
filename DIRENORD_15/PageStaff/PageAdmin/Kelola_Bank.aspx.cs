using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStaff_PageAdmin_Kelola_Bank : System.Web.UI.Page
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

    public DataSet FillGrid()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_bank_view", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvBank.DataSource = ds.Tables[0];
            gvBank.DataBind();
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
            SqlCommand cmd = new SqlCommand("sp_bank_search", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvBank.DataSource = ds.Tables[0];
            gvBank.DataBind();
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
        divInputForm.Visible = true;
        divUpdateForm.Visible = false;
        divView.Visible = false;
        divDetail.Visible = false;

    }

    protected void btnUpdateView_Click(object sender, EventArgs e)
    {
        divInputForm.Visible = false;
        divUpdateForm.Visible = true;
        divView.Visible = false;
        divDetail.Visible = false;


        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_bank_view_update", sqlCon);
        sqlCmd.Parameters.AddWithValue("@BankID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        lblPreiewFoto.Text = "<img id = 'blahea' src = '" + reader[4].ToString() + "' alt = '' width = 'auto' height = '100' />";
        txtUpd_NamaBank.Text = reader[1].ToString();
        txtUpd_NoRek.Text = reader[2].ToString();
        txtUpd_AtasNama.Text = reader[3].ToString();
        tampunnggambar = reader[4].ToString();
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
            SqlCommand sqlCmd = new SqlCommand("sp_bank_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@BankID", id);
            sqlCmd.Parameters.AddWithValue("@BankModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@BankStatusActive", "0");
            sqlCmd.Parameters.AddWithValue("@BankModifiedDate", today);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Bank.aspx';", true);
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
            SqlCommand sqlCmd = new SqlCommand("sp_bank_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@BankID", id);
            sqlCmd.Parameters.AddWithValue("@BankModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@BankStatusActive", "1");
            sqlCmd.Parameters.AddWithValue("@BankModifiedDate", today);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Bank.aspx';", true);
            FillGrid();
        }
    }

    protected void btnSimpanInputForm_Click(object sender, EventArgs e)
    {
        FileUpload_Input.SaveAs(Server.MapPath("~/img/img-bank/") + Path.GetFileName(FileUpload_Input.FileName));
        String link = "/img/img-bank/" + Path.GetFileName(FileUpload_Input.FileName);
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_bank_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@BankName", txtInp_NamaBank.Text);
        sqlCmd.Parameters.AddWithValue("@BankNoRek", txtInp_NoRek.Text);
        sqlCmd.Parameters.AddWithValue("@BankAtasNama", txtInp_AtasNama.Text);
        sqlCmd.Parameters.AddWithValue("@BankCreatedBy", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@BankCreatedDate", today);
        sqlCmd.Parameters.AddWithValue("@BankImage", link);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        clearInputForm();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Data berhasil disimpan');window.location ='Kelola_Bank.aspx';", true);


    }

    void clearInputForm()
    {
        txtInp_NamaBank.Text = "";
        txtInp_NoRek.Text = "";
        txtInp_AtasNama.Text = "";
        
    }


    protected void btnKembaliInputForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Bank.aspx");
    }


    protected void btnSimpanUpdateForm_Click(object sender, EventArgs e)
    {

        if (Path.GetFileName(FileUpload_Update.FileName) == "")
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_bank_update", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@BankName", txtUpd_NamaBank.Text);
            sqlCmd.Parameters.AddWithValue("@BankNoRek", txtUpd_NoRek.Text);
            sqlCmd.Parameters.AddWithValue("@BankAtasNama", txtUpd_AtasNama.Text);
            sqlCmd.Parameters.AddWithValue("@BankID", id);
            sqlCmd.Parameters.AddWithValue("@BankImage", tampunnggambar);
            sqlCmd.Parameters.AddWithValue("@BankModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@BankModifiedDate", today);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            clearInputForm();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Data berhasil diperbarui');window.location ='Kelola_Bank.aspx';", true);
        }
        else
        {
            FileUpload_Update.SaveAs(Server.MapPath("~/img/img-bank/") + Path.GetFileName(FileUpload_Update.FileName));
            String link = "/img/img-bank/" + Path.GetFileName(FileUpload_Update.FileName);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_bank_update", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@BankName", txtUpd_NamaBank.Text);
            sqlCmd.Parameters.AddWithValue("@BankNoRek", txtUpd_NoRek.Text);
            sqlCmd.Parameters.AddWithValue("@BankAtasNama", txtUpd_AtasNama.Text);
            sqlCmd.Parameters.AddWithValue("@BankID", id);
            sqlCmd.Parameters.AddWithValue("@BankImage", link);
            sqlCmd.Parameters.AddWithValue("@BankModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@BankModifiedDate", today);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            clearInputForm();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Data berhasil diperbarui');window.location ='Kelola_Bank.aspx';", true);
        }


    }


    void clearUpdateForm()
    {
        txtUpd_NamaBank.Text = "";
        txtUpd_NoRek.Text = "";
        txtUpd_AtasNama.Text = "";

    }


    protected void btnKembaliUpdateForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Bank.aspx");
    }

    protected void gvBank_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvBank.PageIndex = e.NewPageIndex;
        gvBank.DataBind();
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
    protected void gvBank_OnSorting(object sender, GridViewSortEventArgs e)
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

        gvBank.DataSource = dv;
        gvBank.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGridSearch(txtSearch.Text);
    }

    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }


    protected void btnKembaliDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Bank.aspx");
    }

    protected void btnDetailView_Click(object sender, EventArgs e)
    {
        divInputForm.Visible = false;
        divUpdateForm.Visible = false;
        divView.Visible = false;
        divDetail.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_bank_view_update", sqlCon);
        sqlCmd.Parameters.AddWithValue("@BankID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlfoto.Text = "<img src = '" + reader[4].ToString() + "' alt = 'Preview' width = 'auto' height = '250' align = 'center' />";
        dtlBankID.Text = reader[0].ToString();
        dtlBankName.Text = reader[1].ToString();
        dtlNomorRekening.Text = reader[2].ToString();
        dtlAtasNama.Text = reader[3].ToString();
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
            dtlModifiedDate.Text = reader[7].ToString();
        }


        if (reader[8].ToString() == "1")
        {
            dtlAktif.Text = "Aktif";
        }
        else
        {
            dtlAktif.Text = "Tidak Aktif";
        }

        sqlCon.Close();
    }


    public DataSet FillGridAktif()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_bank_view_aktif", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvBank.DataSource = ds.Tables[0];
            gvBank.DataBind();
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

}