﻿using System;
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

public partial class PageStaff_PageSuperAdmin_Daftar_Desainer : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("sp_admin_view_designer", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvDesainer.DataSource = ds.Tables[0];
            gvDesainer.DataBind();
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
            SqlCommand cmd = new SqlCommand("sp_admin_view_designer_search", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvDesainer.DataSource = ds.Tables[0];
            gvDesainer.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }


    protected void gvDesainer_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvDesainer.PageIndex = e.NewPageIndex;
        gvDesainer.DataBind();
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
    protected void gvDesainer_OnSorting(object sender, GridViewSortEventArgs e)
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

        gvDesainer.DataSource = dv;
        gvDesainer.DataBind();
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
        SqlCommand sqlCmd = new SqlCommand("sp_admin_view_designer_detail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@DesignerID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlDesignerID.Text = reader[0].ToString();
        dtlDesignerName.Text = reader[1].ToString();
        dtlDesignerEmail.Text = reader[2].ToString();
        dtlDesignerPhoneNumber.Text = reader[3].ToString();

        if (reader[4].ToString() == "")
        {
            dtlDesignerBiodata.Text = "-";

        }
        else
        {
            dtlDesignerBiodata.Text = reader[4].ToString();
        }

        if (reader[5].ToString() == "")
        {
            dtlfoto.Text = "<img src = 'https://cdn.sribu.com/assets/media/avatar/avatar-default.png' alt = 'Preview' style=\"width:100%; height: 350px;\" align = 'center' />";
            
        }
        else
        {
            dtlfoto.Text = "<img src = '" + reader[5].ToString() + "' alt = 'Preview' style=\"width:100%; height: 350px;\" align = 'center' />";
        }
        
        dtlDesignerWallet.Text = reader[6].ToString();
        dtlDesignerWallet.Text = dtlDesignerWallet.Text.Substring(0, dtlDesignerWallet.Text.Length - 5);
        dtlDesignerWallet.Text = "Rp. " +String.Format("{0:n0}", Convert.ToInt64(dtlDesignerWallet.Text));
        dtlStatusUjian.Text = reader[7].ToString();
        dtlStatusVerif.Text = reader[8].ToString();
        dtlStatusAktif.Text = reader[9].ToString();
        dtlMenangKontes.Text = reader[10].ToString()+" Kontes";

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

    protected void btnDelete_Click(object sender, EventArgs e)
    {

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            LinkButton btn = (LinkButton)(sender);
            id = btn.CommandArgument;
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_designer_disable_enable", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@DesignerID", id);
            sqlCmd.Parameters.AddWithValue("@DesignerActive", "0");

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Daftar_Desainer.aspx';", true);
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
            SqlCommand sqlCmd = new SqlCommand("sp_designer_disable_enable", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@DesignerID", id);
            sqlCmd.Parameters.AddWithValue("@DesignerActive", "1");

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Daftar_Desainer.aspx';", true);
            FillGrid();
        }
    }
}