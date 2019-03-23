using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Sign_In : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnMasuk_Click(object sender, EventArgs e)
    {

        MailAddress addr = new MailAddress(txtEmail.Text);
        string username = addr.User;

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("login_Customer", sqlCon);
        sqlCmd.Parameters.AddWithValue("@username", username);
        sqlCmd.Parameters.AddWithValue("@password", txtPassword.Text);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();

        if (reader.Read())
        {
            //DESIGNER
            if (reader[1].ToString() == "5" && reader[3].ToString() == "1")
            {
                Session["Username"] = reader[0].ToString(); //ID 
                Session["Rolename"] = reader[1].ToString();
                Session["Name"] = reader[2].ToString(); //NAMA
                Session["VerifExam"] = reader[4].ToString(); //STATUS EXAM
                if (reader[5].ToString() == "")
                {
                    Session["Urlpict"] = "./Template_User/Exam_First/avatar-default.png";
                }
                else
                {
                    Session["Urlpict"] = reader[5].ToString(); //Urlpict
                }

                Session["Status"] = "Login";
                Response.Redirect("Index.aspx");
            }
            //CLIENT
            else if (reader[1].ToString() == "6" && reader[3].ToString() == "1")
            {
                Session["Username"] = reader[0].ToString();
                Session["Rolename"] = reader[1].ToString();
                Session["Name"] = reader[2].ToString();//NAMA
                Session["Status"] = "Login";
                if (reader[4].ToString() == "")
                {
                    Session["Urlpict"] = "./Template_User/Exam_First/avatar-default.png";
                }
                else
                {
                    Session["Urlpict"] = reader[4].ToString(); //Urlpict
                }

                if (Convert.ToBoolean(Session["StatusOrderKontes"]))
                {
                    Response.Redirect("Client_Buat_Brief_Silver.aspx");

                }
                Response.Redirect("Index.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Anda belum melakukan konfirmasi melalui email.');", true);
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Login gagal username / password salah!');", true);
        }

        sqlCon.Close();
    }


}