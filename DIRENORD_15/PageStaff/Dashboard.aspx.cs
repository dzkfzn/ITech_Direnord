using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class PageStaff_Dashboard : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Username"].ToString() != null)
        {
            sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("sp_staff_get_data", sqlCon);
            sqlcmd.Parameters.AddWithValue("@username", Session["Username"].ToString());
            sqlcmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = sqlcmd.ExecuteReader();
            if (reader.Read())
            {
                lblName.Text = reader[0].ToString() + "(" + reader[1].ToString() + ")";
                lblLastLogin.Text = "LOgin Terakhir " + DateTime.Parse(reader[2].ToString()).ToString("dd MMMM yyyy hh:mm:ss");
            }

            sqlCon.Close();
        }
    }
}