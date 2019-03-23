using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStaff_PageVerifier_Riwayat_Ujian_Desainer : System.Web.UI.Page
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
                Response.Redirect("/PageStaff/PageSuperAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Verifier")
            {
                if (!Page.IsPostBack)
                {
                    divView.Visible = true;
                    divVerifikasi.Visible = false;

                    FillGrid();
                }
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

    protected void btnVerifikasi_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divVerifikasi.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_exam_view_one", sqlCon);
        sqlCmd.Parameters.AddWithValue("@ExID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlID.Text = reader[0].ToString();
        dtlDesainerID.Text = reader[1].ToString();
        dtlfoto.Text = "<img src = '" + reader[2].ToString() + "' alt = 'Preview' width = '235' height = '170' align = 'center' />";
        dtlDescription.Text = reader[3].ToString();
        dtlTypeDesign.Text = reader[4].ToString();
        dtlDate.Text = reader[5].ToString();
        if (reader[6].ToString() == "0")
        {
            dtlStatus.Text = "Belum Diverifikasi";
        }
        else if (reader[6].ToString() == "1")
        {
            dtlStatus.Text = "Ditolak";
        }
        else if (reader[6].ToString() == "2")
        {
            dtlStatus.Text = "Diterima";
        }

        if (reader[7].ToString() == "")
        {
            dtlAlasan.Text = "-";
        }
        else
        {
            dtlAlasan.Text = reader[7].ToString();

        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGridSearch(txtSearch.Text);
    }

    public DataSet FillGridSearch(string Search)
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_exam_search_verified", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvUjian.DataSource = ds.Tables[0];
            gvUjian.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGrid()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_exam_view_verified", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvUjian.DataSource = ds.Tables[0];
            gvUjian.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    protected void gvUjian_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvUjian.PageIndex = e.NewPageIndex;
        gvUjian.DataBind();
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
    protected void gvUjian_OnSorting(object sender, GridViewSortEventArgs e)
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

        gvUjian.DataSource = dv;
        gvUjian.DataBind();
    }



    protected void btnKembali_Click(object sender, EventArgs e)
    {
        Response.Redirect("Riwayat_Ujian_Desainer.aspx");
    }

    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
}