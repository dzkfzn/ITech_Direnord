using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Verify : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["username"]) && !String.IsNullOrEmpty(Request.QueryString["hash"]))
        {
            // Query string value is there so now use it
            string username = Request.QueryString["username"].ToString();
            string hash = Request.QueryString["hash"].ToString();


            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("verifikasi_user", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            sqlCmd.Parameters.AddWithValue("@username", username);
            sqlCmd.Parameters.AddWithValue("@hash", hash);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
               "alert('Verifikasi berhasil!');window.location ='Sign_In.aspx';", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
               "alert('Request gagal!');window.location ='Sign_In.aspx';", true);
        }
    }
}