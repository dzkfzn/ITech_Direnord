using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.IO;

public partial class PageUser_Sign_Up : System.Web.UI.Page
{
    public static string hash;
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        ValidasiRB.Visible = false;

        if (!Page.IsPostBack)
        {

        }
    }



    protected void btnDaftar_Click(object sender, EventArgs e)
    {


        if (Design.Checked == false && Client.Checked == false)
        {
            ValidasiRB.Visible = true;
            sqlCon.Close();
            return;
        }

        hash = RandomString(16);
        sqlCon.Open();


        bool status = CheckEmail(txtEmail.Text);

        if (status == false)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Email Sudah Terdaftar!!');", true);
            return;
        }

       
        else if (Client.Checked == true)
        {

            try
            {
                //Response.Write("<script>alert('Data berhasil disimpan');</script>");
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
                MailMessage mm = new MailMessage();
                mm.To.Add(txtEmail.Text);
                mm.From = new MailAddress("direnord.information@gmail.com");
                mm.Subject = "Verifikasi Akun Anda";
                mm.Body = CreateBody();
                mm.IsBodyHtml = true;
                smtp.Send(mm);
                //Response.Write("<script>alert('Data berhasil disimpan');</script>");

                MailAddress addr = new MailAddress(txtEmail.Text);
                string username = addr.User;

                SqlCommand sqlCmd = new SqlCommand("sp_client_regis", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@ClientID", username.ToString().ToUpper());
                sqlCmd.Parameters.AddWithValue("@ClientName", txtNama.Text.ToString().ToUpper());
                sqlCmd.Parameters.AddWithValue("@ClientEmail", txtEmail.Text);
                sqlCmd.Parameters.AddWithValue("@ClientPhoneNumber", txtTelp.Text);
                sqlCmd.Parameters.AddWithValue("@ClientUsername", username);
                sqlCmd.Parameters.AddWithValue("@ClientPassword", txtPassword.Text);
                sqlCmd.Parameters.AddWithValue("@ClientHash", hash);

                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                   "alert('Anda berhasil mendaftar silahkan konfirmasi melalui email');window.location ='Sign_In.aspx';", true);
            }
            catch (Exception ex)
            {
                Response.Write("Pendaftaran Gagal" + ex.Message);
            }

        }
        else if (Design.Checked == true)
        {
            try
            {
                //Response.Write("<script>alert('Data berhasil disimpan');</script>");
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
                MailMessage mm = new MailMessage();
                mm.To.Add(txtEmail.Text);
                mm.From = new MailAddress("direnord.information@gmail.com");
                mm.Subject = "Verifikasi Akun Anda";
                mm.Body = CreateBody();
                mm.IsBodyHtml = true;
                smtp.Send(mm);
                //Response.Write("<script>alert('Data berhasil disimpan');</script>");


                MailAddress addr = new MailAddress(txtEmail.Text);
                string username = addr.User;

                SqlCommand sqlCmd = new SqlCommand("sp_designer_regis", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@DesignerID", username.ToString().ToUpper());
                sqlCmd.Parameters.AddWithValue("@DesignerName", txtNama.Text.ToString().ToUpper());
                sqlCmd.Parameters.AddWithValue("@DesignerEmail", txtEmail.Text);
                sqlCmd.Parameters.AddWithValue("@DesignerPhoneNumber", txtTelp.Text);
                sqlCmd.Parameters.AddWithValue("@DesignerUsername", username);
                sqlCmd.Parameters.AddWithValue("@DesignerPassword", txtPassword.Text);
                sqlCmd.Parameters.AddWithValue("@DesignerHash", hash);

                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();


                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                   "alert('Anda berhasil mendaftar silahkan konfirmasi melalui email');window.location ='Sign_In.aspx';", true);
            }
            catch (Exception ex)
            {
                Response.Write("Pendaftaran Gagal" + ex.Message);
            }
        }

    }

    public bool CheckEmail(string email)
    {
        bool status = false;

        SqlCommand sqlCmd = new SqlCommand("CheckEmailAvailability", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlCmd.Parameters.AddWithValue("@Email", email);

        status = Convert.ToBoolean(sqlCmd.ExecuteScalar());


        return status;
    }


    private string CreateBody()
    {
        MailAddress addr = new MailAddress(txtEmail.Text);
        string username = addr.User;

        string link = "http://localhost:50891/PageUser/Verify.aspx?username="+username+"&hash="+hash;
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Verifikasi_Email_User.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{Email}", txtEmail.Text);
        body = body.Replace("{linkverifikasi}", link);
        return body;
    }


    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }



    protected void Unnamed_Click(object sender, EventArgs e)
    {

    }

}