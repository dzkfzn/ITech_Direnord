using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class PageStaff_Sign_Out_Staff : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Username"].ToString() != null)
            {
                sqlCon.Open();
                SqlCommand sqlCmd2 = new SqlCommand("sp_staff_last_login", sqlCon);
                sqlCmd2.Parameters.AddWithValue("@staffUsername", Session["Username"].ToString());
                sqlCmd2.CommandType = CommandType.StoredProcedure;
                sqlCmd2.ExecuteNonQuery();
                sqlCon.Close();
            }

            Session.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }
        catch
        {
            Response.Redirect("/PageStaff/Login_Staff.aspx");

        }

    }
}