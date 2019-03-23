using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStaff_PageAdmin_Kelola_Industry : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
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
        //SqlDataAdapter da = new SqlDataAdapter("sp_view_prodi", sqlCon);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //gvIndustry.DataSource = dt;
        //gvIndustry.DataBind();

        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_Industry_view", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvIndustry.DataSource = ds.Tables[0];
            gvIndustry.DataBind();
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
            SqlCommand cmd = new SqlCommand("sp_industry_search", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvIndustry.DataSource = ds.Tables[0];
            gvIndustry.DataBind();
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
    }

    protected void btnUpdateView_Click(object sender, EventArgs e)
    {
        divInputForm.Visible = false;
        divUpdateForm.Visible = true;
        divView.Visible = false;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_Industry_view_update", sqlCon);
        sqlCmd.Parameters.AddWithValue("@IndustryID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        txtUpd_NamaIndustry.Text = reader[1].ToString();
        //  txtUpd_NoRek.Text = reader[2].ToString();
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
            SqlCommand sqlCmd = new SqlCommand("sp_Industry_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@IndustryID", id);
            sqlCmd.Parameters.AddWithValue("@IndustryModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@IndustryModifiedDate", today);
            sqlCmd.Parameters.AddWithValue("@IndustryStatusActive", "0");

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Industri.aspx';", true);
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
            SqlCommand sqlCmd = new SqlCommand("sp_Industry_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@IndustryID", id);
            sqlCmd.Parameters.AddWithValue("@IndustryModifiedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@IndustryModifiedDate", today);
            sqlCmd.Parameters.AddWithValue("@IndustryStatusActive", "1");

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Industri.aspx';", true);
            FillGrid();
        }
    }

    protected void btnSimpanInputForm_Click(object sender, EventArgs e)
    {

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_Industry_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@IndustryName", txtInp_NamaIndustry.Text);
        sqlCmd.Parameters.AddWithValue("@IndustryCreatedBy", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@IndustryCreatedDate", today);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        clearInputForm();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Berhasil');window.location ='Kelola_Industri.aspx';", true);


    }

    void clearInputForm()
    {
        txtInp_NamaIndustry.Text = "";
        //  txtInp_NoRek.Text = "";
    }


    protected void btnKembaliInputForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Industri.aspx");
    }


    protected void btnSimpanUpdateForm_Click(object sender, EventArgs e)
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_Industry_update", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@IndustryName", txtUpd_NamaIndustry.Text);
        //sqlCmd.Parameters.AddWithValue("@IndustryNoRek", txtUpd_NoRek.Text);
        sqlCmd.Parameters.AddWithValue("@IndustryID", id);
        sqlCmd.Parameters.AddWithValue("@IndustryModifiedBy", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@IndustryModifiedDate", today);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        clearInputForm();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Data berhasil diperbarui');window.location ='Kelola_Industri.aspx';", true);
    }


    void clearUpdateForm()
    {
        txtUpd_NamaIndustry.Text = "";
        // txtUpd_NoRek.Text = "";
    }


    protected void btnKembaliUpdateForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Industri.aspx");
    }

    protected void gvIndustry_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvIndustry.PageIndex = e.NewPageIndex;
        gvIndustry.DataBind();
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
    protected void gvIndustry_OnSorting(object sender, GridViewSortEventArgs e)
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

        gvIndustry.DataSource = dv;
        gvIndustry.DataBind();
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
            SqlCommand cmd = new SqlCommand("sp_industry_view_aktif", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvIndustry.DataSource = ds.Tables[0];
            gvIndustry.DataBind();
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