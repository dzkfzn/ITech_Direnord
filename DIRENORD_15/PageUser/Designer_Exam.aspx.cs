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

public partial class PageUser_PageDesigner_Exam : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("2") && Session["Rolename"].ToString() == "5")
            {
                Response.Redirect("/PageUser/Designer_Lihat_Kontes.aspx");
            }
            else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("1") && Session["Rolename"].ToString() == "5")
            {
                Response.Redirect("/PageUser/Designer_Exam_Success.aspx");
            }
            else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("0") && Session["Rolename"].ToString() == "5")
            {
                //nothing
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

    protected void btnUnggah_DesainLogo_Click(object sender, EventArgs e)
    {
        txtDesainLogo_FileUpload.SaveAs(Server.MapPath("~/img/img-Exam/") + Path.GetFileName(txtDesainLogo_FileUpload.FileName));
        String link = "/img/img-Exam/" + Path.GetFileName(txtDesainLogo_FileUpload.FileName);
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_exam_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@ExImagePath", link);
        sqlCmd.Parameters.AddWithValue("@ExDesc", txtDesainLogo_Deskripsi.Text);
        sqlCmd.Parameters.AddWithValue("@ExDesignType", "Desain Logo");
        Session["VerifExam"] = "1";

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Desain berhasil diunggah');window.location ='Designer_Exam_Success.aspx';", true);
    }

    protected void btnUnggah_DesainBanner_Click(object sender, EventArgs e)
    {
        txtDesainBanner_FileUpload.SaveAs(Server.MapPath("~/img/img-Exam/") + Path.GetFileName(txtDesainBanner_FileUpload.FileName));
        String link = "/img/img-Exam/" + Path.GetFileName(txtDesainBanner_FileUpload.FileName);
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_exam_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@ExImagePath", link);
        sqlCmd.Parameters.AddWithValue("@ExDesc", txtDesainBanner_Deskripsi.Text);
        sqlCmd.Parameters.AddWithValue("@ExDesignType", "Desain Banner");
        Session["VerifExam"] = "1";

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Desain berhasil diunggah');window.location ='Designer_Exam_Success.aspx';", true);
    }

    protected void btnUnggah_DesainKartuNama_Click(object sender, EventArgs e)
    {
        txtDesainKartuNama_FileUpload.SaveAs(Server.MapPath("~/img/img-Exam/") + Path.GetFileName(txtDesainKartuNama_FileUpload.FileName));
        String link = "/img/img-Exam/" + Path.GetFileName(txtDesainKartuNama_FileUpload.FileName);
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_exam_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@ExImagePath", link);
        sqlCmd.Parameters.AddWithValue("@ExDesc", txtDesainKartuNama_Deskripsi.Text);
        sqlCmd.Parameters.AddWithValue("@ExDesignType", "Desain Kartu Nama");
        Session["VerifExam"] = "1";


        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Desain berhasil diunggah');window.location ='Designer_Exam_Success.aspx';", true);
    }
}