using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Lihat_Kontes : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("2") && Session["Rolename"].ToString() == "5")
                {
                    FillGrid();
                    divContests.Visible = true;
                }
                else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("1") && Session["Rolename"].ToString() == "5")
                {
                    Response.Redirect("/PageUser/Designer_Exam_Success.aspx");
                }
                else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("0") && Session["Rolename"].ToString() == "5")
                {
                    Response.Redirect("/PageUser/Designer_Exam.aspx");
                }
                else
                {
                    Response.Redirect("/PageUser/Sign_In.aspx");
                }
            }
            catch (NullReferenceException ex)
            {
                Response.Redirect("/PageUser/Sign_In.aspx");
            }
        }
    }

    public DataSet FillGrid()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand sqlCmd = new SqlCommand("sp_designer_view_contest", sqlCon);
            sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
            sqlCmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd);
            dataAdapter.Fill(ds);
            dlContest.DataSource = ds.Tables[0];
            dlContest.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillSearch()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand sqlCmd = new SqlCommand("sp_designer_view_contest_search", sqlCon);
            sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@Search", txtSearch.Text);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd);
            dataAdapter.Fill(ds);
            dlContest.DataSource = ds.Tables[0];
            dlContest.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    protected void btnDetailView_Click(object sender, EventArgs e)
    {
        //divContests.Visible = false;
        //divDetail.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        Response.Redirect("/PageUser/Designer_Detail_Kontes.aspx?contest=" + id);

    }

    //protected void btnUnggah_Desain_Click(object sender, EventArgs e)
    //{
    //    string PDID = Session["Username"].ToString() + "-" + id;
    //    sqlCon.Open();
    //    SqlCommand sqlCmd = new SqlCommand("sp_designer_input_design", sqlCon);
    //    sqlCmd.CommandType = CommandType.StoredProcedure;
    //    sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
    //    sqlCmd.Parameters.AddWithValue("@ContestID", id);
    //    sqlCmd.Parameters.AddWithValue("@PDID", PDID);

    //    sqlCmd.ExecuteNonQuery();
    //    sqlCon.Close();

    //    if (fuReferensi.HasFiles)
    //    {
    //        foreach (HttpPostedFile uploadedFile in fuReferensi.PostedFiles)
    //        {
    //            String Name = DateTime.Now.ToString("ddMMyyyyHHmmss") + uploadedFile.FileName;
    //            uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/img/"), Name));
    //            sqlCon.Open();
    //            SqlCommand cmd = new SqlCommand("sp_designer_input_desain_reference", sqlCon);
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.Parameters.AddWithValue("@PDID", PDID);
    //            cmd.Parameters.AddWithValue("@ImagePath", Name);

    //            cmd.ExecuteNonQuery();
    //            sqlCon.Close();
    //        }
    //    }

    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
    //                "alert('Upload desain berhasil, Goodluck!');window.location ='Designer_Lihat_Kontes.aspx';", true);
    //}

    //protected void btnKembali_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("/PageUser/Designer_Lihat_Kontes.aspx");
    //}

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillSearch();
    }

    protected void btnall_Click(object sender, EventArgs e)
    {
        FillGrid();
    }

}