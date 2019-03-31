using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;

public partial class PageUser_ForgotPassword : System.Web.UI.Page
{
    public static string hash;
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnMasuk_Click(object sender, EventArgs e)
    {
        try
        {
            hash = RandomString(8);
            sqlCon.Open();
            bool status = CheckEmail(txtEmail.Text);

            if (status == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Email tidak Terdaftar!!');", true);
                return;
            }
            else
            {
                //Response.Write("<script>alert('Data berhasil disimpan');</script>");
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
                MailMessage mm = new MailMessage();
                mm.To.Add(txtEmail.Text);
                mm.From = new MailAddress("alvinamartya10@gmail.com");
                mm.Subject = "Lupa Password";
                mm.Body = CreateBody();
                mm.IsBodyHtml = true;
                smtp.Send(mm);
                //Response.Write("<script>alert('Data berhasil disimpan');</script>");

                MailAddress addr = new MailAddress(txtEmail.Text);
                string username = addr.User;

                SqlCommand sqlCmd = new SqlCommand("change_password", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@username", username);
                sqlCmd.Parameters.AddWithValue("@password", hash);

                sqlCmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Password baru anda telah dikirim ke email anda.');", true);
            }
        }
        catch (Exception ex)
        {
            Response.Write("Ganti Password Gagal" + ex.Message);
        }
        finally
        {
            sqlCon.Close();
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

    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    private string CreateBody()
    {
        MailAddress addr = new MailAddress(txtEmail.Text);
        string username = addr.User;
        
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Forgot_Password_User.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{Email}", txtEmail.Text);
        body = body.Replace("{Password}", hash);
        return body;
    }
}