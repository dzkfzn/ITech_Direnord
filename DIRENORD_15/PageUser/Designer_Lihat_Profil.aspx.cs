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

public partial class PageUser_Designer_Lihat_Profil : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    public static string idDesigner;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["lihatProfDesign"] == null)
        {
            idDesigner = Session["Username"].ToString();
            try
            {
                if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("2") && Session["Rolename"].ToString() == "5")
                {
                    FillGrid();
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
        else
        {
            idDesigner = Session["lihatProfDesign"].ToString();

            FillGrid();
        }

        
    }

    public void FillGrid()
    {


        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_designer_getprofil", sqlCon);
        sqlCmd.Parameters.AddWithValue("@Username", idDesigner);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        lblUsername.Text = "@"+reader[0].ToString();
        lblNama.Text = reader[1].ToString();

        if(reader[2].ToString() == "")
        {
            lblBio.Text = "Profil Anda belum lengkap, silakan lengkapi profil Anda di halaman Pengaturan";
        }
        else
        {
            lblBio.Text = reader[2].ToString();
        }

        if (reader[3].ToString() == "")
        {
            lblHtmlGambarProfil.Text = "<img class='img-responsive' src='https://cdn.sribu.com/assets/media/avatar/avatar-default.png' alt='Avatar default'>";
        }
        else
        {
            lblHtmlGambarProfil.Text = "<img class='img-responsive' src='" + reader[3].ToString() + "' alt='Avatar default'>";
        }

        lblMenangKontes.Text = reader[4].ToString();


        sqlCon.Close();



        sqlCon.Open();
        DataSet ds = new DataSet();

        // insert command
        SqlCommand sqlCmd1 = new SqlCommand("sp_designer_view_alldesain", sqlCon);
        sqlCmd1.Parameters.AddWithValue("@DesignerID", idDesigner);
        sqlCmd1.CommandType = CommandType.StoredProcedure;

        //create a DataAdapter
        SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd1);
        dataAdapter.Fill(ds);
        dlPortfolio.DataSource = ds.Tables[0];
        dlPortfolio.DataBind();
        sqlCon.Close();
    }

    protected void btnUbahFotoProfil_Click(object sender, EventArgs e)
    {
        if (Path.GetFileName(FileUpload1.FileName) != "" ) //update gambar dan password
        {
            FileUpload1.SaveAs(Server.MapPath("~/img/img-User/") + Path.GetFileName(FileUpload1.FileName));
            String link = "/img/img-User/" + Path.GetFileName(FileUpload1.FileName);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_designer_avatarchange", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@PathFoto", link);
            sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());


            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Session["Urlpict"] = link;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Profil berhasil diubah');window.location ='Designer_Lihat_Profil.aspx';", true);
        }
    }
}