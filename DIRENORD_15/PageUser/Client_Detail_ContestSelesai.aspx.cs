using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Ionic.Zip;

public partial class PageUser_Client_Detail_ContestSelesai : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null)
            {
                FillGrid();
            }
            else
            {

            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("/PageUser/Sign_In.aspx");
        }

    }

    public void fillPemenang()
    {
        DataSet ds = new DataSet();

        sqlCon.Open();
        SqlCommand sqlCmdPemenang = new SqlCommand("sp_client_view_contest_winner", sqlCon);
        sqlCmdPemenang.Parameters.AddWithValue("@ContestID", contestID);
        sqlCmdPemenang.CommandType = CommandType.StoredProcedure;
        //create a DataAdapter
        SqlDataAdapter dataAdapterPemenang = new SqlDataAdapter(sqlCmdPemenang);
        dataAdapterPemenang.Fill(ds);
        dlPemenang.DataSource = ds.Tables[0];
        dlPemenang.DataBind();
        sqlCon.Close();
    }

    public void fillSemua()
    {
        DataSet ds = new DataSet();

        sqlCon.Open();
        SqlCommand sqlCmdPemenang = new SqlCommand("sp_designer_view_contest_alldesain", sqlCon);
        sqlCmdPemenang.Parameters.AddWithValue("@ContestID", contestID);
        sqlCmdPemenang.CommandType = CommandType.StoredProcedure;
        //create a DataAdapter
        SqlDataAdapter dataAdapterPemenang = new SqlDataAdapter(sqlCmdPemenang);
        dataAdapterPemenang.Fill(ds);
        DataList1.DataSource = ds.Tables[0];
        DataList1.DataBind();
        sqlCon.Close();
    }
    public static string contestID;
    public void FillGrid()
    {
        divDesain.Visible = true;
        divBrief.Visible = false;

        if (!String.IsNullOrEmpty(Request.QueryString["contest"]))
        {
            // Query string value is there so now use it
            string conid = Request.QueryString["contest"].ToString();
            contestID = Request.QueryString["contest"].ToString();

            DataSet ds = new DataSet();
            try
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("sp_client_view_contest_alldesain_onlywinner", sqlCon);
                sqlCmd.Parameters.AddWithValue("@ContestID", conid);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                //create a DataAdapter
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd);
                dataAdapter.Fill(ds);
                dlgambardesain.DataSource = ds.Tables[0];
                viewDetail.DataSource = ds.Tables[0];

                dlgambardesain.DataBind();
                viewDetail.DataBind();

                sqlCon.Close();

                fillSemua();

                sqlCon.Open();
                SqlCommand sqlCmd1 = new SqlCommand("sp_designer_view_contest_detail", sqlCon);
                sqlCmd1.Parameters.AddWithValue("@ID", conid);
                sqlCmd1.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = sqlCmd1.ExecuteReader();
                reader.Read();
                lbljudulkontes.Text = reader[0].ToString();
                lblusername.Text = "@" + reader[1].ToString();
                lbltglberakhir.Text = reader[2].ToString();
                lbljumlahentri.Text = reader[3].ToString();
                lblhadiahpemenang.Text = reader[4].ToString();
                lblhadiahpemenang.Text = lblhadiahpemenang.Text.Substring(0, lblhadiahpemenang.Text.Length - 5);
                lblhadiahpemenang.Text = "Rp. " + String.Format("{0:n0}", Convert.ToInt64(lblhadiahpemenang.Text));
                lblnamapaket.Text = reader[5].ToString();
                lblkategori.Text = reader[6].ToString();
                lblindsutri.Text = reader[7].ToString();


                sqlCon.Close();
            }
            catch (Exception)
            {
                sqlCon.Close();
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
               "alert('Request gagal!');window.location ='Designer_Lihat_Kontes.aspx';", true);
        }

    }

    protected void btnDesain_Click(object sender, EventArgs e)
    {
        FillGrid();
    }


    protected void btnBrief_Click(object sender, EventArgs e)
    {
        divDesain.Visible = false;
        divBrief.Visible = true;

        if (!String.IsNullOrEmpty(Request.QueryString["contest"]))
        {
            // Query string value is there so now use it
            string conid = Request.QueryString["contest"].ToString();

            sqlCon.Open();
            DataSet ds = new DataSet();

            // insert command
            SqlCommand sqlCmd = new SqlCommand("sp_designer_view_contest_reference", sqlCon);
            sqlCmd.Parameters.AddWithValue("@ID", conid);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd);
            dataAdapter.Fill(ds);
            sqlCon.Close();
        }


        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
               "alert('Request gagal!');window.location ='Designer_Lihat_Kontes.aspx';", true);
        }
    }



    protected void btnUploadDesain_Click(object sender, EventArgs e)
    {
        string conid = Request.QueryString["contest"].ToString();

        string PDID = Session["Username"].ToString() + "-" + conid;
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_designer_input_design", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@ContestID", conid);
        sqlCmd.Parameters.AddWithValue("@PDID", PDID);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();


        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Upload desain berhasil, Goodluck!');window.location ='Designer_Lihat_Kontes.aspx';", true);
    }

    protected void btnPemenang_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string commandArgs = btn.CommandArgument.ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_client_set_contest_winner", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@DesignerID", commandArgs);
        sqlCmd.Parameters.AddWithValue("@ContestID", contestID);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Pemenang Berhasil dipilih');window.location ='Client_Lihat_Kontes.aspx';", true);
    }



    protected void btnDownload_Click(object sender, EventArgs e)
    {

        using (ZipFile zip = new ZipFile())
        {
            zip.AlternateEncodingUsage = ZipOption.AsNecessary;
            zip.AddDirectoryByName("Files");
            foreach (GridViewRow row in dlgambardesain.Rows)
            {
                {
                    string filePath = (row.FindControl("lblFilePath") as Label).Text.Replace("~", "D:/KULIAH/SEMESTER 3/PRG4/PROJECT/PROG_19_01_25/FARI/DIRENORD_25012019_1157/DIRENORD_15/");
                    filePath.Replace("\\", "/");
                    zip.AddFile(filePath, "Files");
                }
            }
            Response.Clear();
            Response.BufferOutput = false;
            string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
            Response.ContentType = "application/zip";
            Response.AddHeader("content-disposition", "attachment; filename=" + zipName);

            zip.Save(Response.OutputStream);

        }
        Response.Redirect("/PageUser/Client_Detail_Kontes.aspx?contest=" + contestID);

    }

    protected void btnAkhiri_Click(object sender, EventArgs e)
    {
        Response.Redirect("/PageUser/Client_Lihat_Kontes.aspx");

    }
}