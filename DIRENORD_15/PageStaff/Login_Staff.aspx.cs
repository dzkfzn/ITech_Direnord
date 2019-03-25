using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStaff_Login_Staff : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnMasuk_Click(object sender, EventArgs e)
    {
        bool ishas = false;
        string role = "";
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_session_staff", sqlCon);
        sqlCmd.Parameters.AddWithValue("@StaffUsername", txtInp_Username.Text);
        sqlCmd.Parameters.AddWithValue("@StaffPassword", txtInp_Password.Text);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();

        if (reader.Read())
        {
            Session["statusAdminLogin"] = true;
            Session["Username"] = reader[0].ToString();
            Session["Rolename"] = reader[1].ToString();
            Session["Staffname"] = reader[2].ToString();
            Session["Urlpict"] = reader[3].ToString();
            Session["Status"] = "Login";

            role = reader[1].ToString();
            ishas = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Login gagal username / password salah!');window.location ='Login_Staff.aspx';", true);
        }
        sqlCon.Close();

        if (ishas)
        {
            if (role == "Admin")
                Response.Redirect("PageAdmin/Dashboard.aspx");
            else if (role == "Super Admin")
                Response.Redirect("PageSuperAdmin/Dashboard.aspx");
            else if (role == "Verifier")
                Response.Redirect("PageVerifier/Dashboard.aspx");
            else if (role == "Manajer")
                Response.Redirect("PageManager/Dashboard.aspx");
        }
    }
}