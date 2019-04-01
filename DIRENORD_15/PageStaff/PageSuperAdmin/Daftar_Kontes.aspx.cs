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

public partial class PageStaff_PageAdmin_Daftar_Kontes : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
    private string ASCENDING = " ASC ";
    private string DESCENDING = " DESC ";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Rolename"].ToString() == "Admin")
            {
                Response.Redirect("/PageStaff/PageAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Super Admin")
            {
                if (!Page.IsPostBack)
                {
                    divView.Visible = true;
                    divDetail.Visible = false;
                    FillGrid();
                }
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
            SqlCommand cmd = new SqlCommand("sp_admin_view_contest", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvKontes.DataSource = ds.Tables[0];
            gvKontes.DataBind();
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
            SqlCommand cmd = new SqlCommand("sp_admin_view_contest_search", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvKontes.DataSource = ds.Tables[0];
            gvKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }


    protected void gvKontes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvKontes.PageIndex = e.NewPageIndex;
        gvKontes.DataBind();
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
    protected void gvKontes_OnSorting(object sender, GridViewSortEventArgs e)
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

        gvKontes.DataSource = dv;
        gvKontes.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGridSearch(txtSearch.Text);
    }

    

    protected void btnDetailView_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divDetail.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_admin_view_contest_detail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@ContestID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlContestID.Text = reader[0].ToString();
        dtlContestTitle.Text = reader[1].ToString();
        dtlClientID.Text = reader[2].ToString();
        dtlCategory.Text = reader[3].ToString();
        dtlPackage.Text = reader[4].ToString();
        dtlIndustry.Text = reader[5].ToString();
        dtlStatusContest.Text = reader[6].ToString();
        dtlContestDuration.Text = reader[8].ToString()+" Hari";


        if (reader[9].ToString() == "")
        {
            dtlDateVerification.Text = "-";
        }
        else
        {
            dtlDateVerification.Text = reader[9].ToString();
        }

       

        if (reader[7].ToString() == "")
        {
            dtlWinner.Text = "-";
        }
        else
        {
            dtlWinner.Text = reader[7].ToString();
        }

    }

    protected void btnKembaliDetail_Click(object sender, EventArgs e)
    {
        divView.Visible = true;
        divDetail.Visible = false;
    }

    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }

    protected void gvKontes_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            string result = e.Row.Cells[5].Text.ToString();
            if (result == "Sedang Berjalan")
            {
                e.Row.Cells[0].BackColor = System.Drawing.Color.Orange;
                e.Row.Cells[1].BackColor = System.Drawing.Color.Orange;
                e.Row.Cells[2].BackColor = System.Drawing.Color.Orange;
                e.Row.Cells[3].BackColor = System.Drawing.Color.Orange;
                e.Row.Cells[4].BackColor = System.Drawing.Color.Orange;
                e.Row.Cells[5].BackColor = System.Drawing.Color.Orange;
                e.Row.Cells[6].BackColor = System.Drawing.Color.Orange;
            }
            else if (result == "Belum Berjalan")
            {
                e.Row.Cells[0].BackColor = System.Drawing.Color.Firebrick;
                e.Row.Cells[1].BackColor = System.Drawing.Color.Firebrick;
                e.Row.Cells[2].BackColor = System.Drawing.Color.Firebrick;
                e.Row.Cells[3].BackColor = System.Drawing.Color.Firebrick;
                e.Row.Cells[4].BackColor = System.Drawing.Color.Firebrick;
                e.Row.Cells[5].BackColor = System.Drawing.Color.Firebrick;
                e.Row.Cells[6].BackColor = System.Drawing.Color.Firebrick;
            }
            else if (result == "Selesai")
            {
                e.Row.Cells[0].BackColor = System.Drawing.Color.Green;
                e.Row.Cells[1].BackColor = System.Drawing.Color.Green;
                e.Row.Cells[2].BackColor = System.Drawing.Color.Green;
                e.Row.Cells[3].BackColor = System.Drawing.Color.Green;
                e.Row.Cells[4].BackColor = System.Drawing.Color.Green;
                e.Row.Cells[5].BackColor = System.Drawing.Color.Green;
                e.Row.Cells[6].BackColor = System.Drawing.Color.Green;
            }
        }
    }

    protected void btnKontesSelesai_Click(object sender, EventArgs e)
    {
        FillGridSelesai();
    }

    protected void btnKontesBerjalan_Click(object sender, EventArgs e)
    {
        FillGridSedangBerjalan();
    }

    protected void btnKontesBelumBerjalan_Click(object sender, EventArgs e)
    {
        FillGridBelumBerjalan();
    }

    public DataSet FillGridSelesai()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_admin_view_contest_selesai", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvKontes.DataSource = ds.Tables[0];
            gvKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGridSedangBerjalan()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_admin_view_contest_sedangberjalan", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvKontes.DataSource = ds.Tables[0];
            gvKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGridBelumBerjalan()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_admin_view_contest_belumberjalan", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvKontes.DataSource = ds.Tables[0];
            gvKontes.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }
}