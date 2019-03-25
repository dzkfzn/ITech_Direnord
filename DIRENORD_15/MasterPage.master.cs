using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null)
            {
                string lastLogin = "";

                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("sp_staff_get_data", sqlCon);
                sqlCmd.Parameters.AddWithValue("@username", Session["Username"].ToString());
                sqlCmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = sqlCmd.ExecuteReader();
                if (reader.Read())
                {
                    txtTopHeaderRole.Text = reader[1].ToString();
                    lbl_name.Text = reader[0].ToString();
                    try
                    {
                        lastLogin = "Login Terakhir: " + DateTime.Parse(reader[2].ToString()).ToString("dd MMMM yyyy, hh:mm") + " WIB";
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                        lastLogin = "";
                    }
                    //lbl_image.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = '...' class='img-circle profile_img' height='55' width='70' >";
                    //lbl_image2.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = ''>";
                }
                sqlCon.Close();

                if (lastLogin.Equals(""))
                {
                    lblLastLogin.Text = "Login Terakhir: " + DateTime.Now.ToString("dd MMMM yyyy, hh:mm") + " WIB";

                    sqlCon.Open();
                    SqlCommand sqlCmd2 = new SqlCommand("sp_staff_last_login", sqlCon);
                    sqlCmd2.Parameters.AddWithValue("@staffUsername", Session["Username"].ToString());
                    sqlCmd2.CommandType = CommandType.StoredProcedure;
                    sqlCmd2.ExecuteNonQuery();
                    sqlCon.Close();
                }
                else
                    lblLastLogin.Text = lastLogin;


                if (Session["Rolename"].ToString() == "Admin")
                {
                    txtCardHeaderDate.Text = DateTime.Now.ToLongDateString().ToString();
                    menu_admin.Visible = true;
                    menu_verifier.Visible = false;
                    menu_superadmin.Visible = false;
                    menu_manager.Visible = false;
                }
                else if (Session["Rolename"].ToString() == "Verifier")
                {
                    menu_admin.Visible = false;
                    menu_verifier.Visible = true;
                    menu_superadmin.Visible = false;
                    menu_manager.Visible = false;
                }
                else if (Session["Rolename"].ToString() == "Super Admin")
                {
                    txtCardHeaderDate.Text = DateTime.Now.ToLongDateString().ToString() + " | " + DateTime.Now.ToShortTimeString().ToString();
                    menu_admin.Visible = false;
                    menu_verifier.Visible = false;
                    menu_superadmin.Visible = true;
                    menu_manager.Visible = false;
                }
                else if (Session["Rolename"].ToString() == "Manajer")
                {
                    menu_admin.Visible = false;
                    menu_verifier.Visible = false;
                    menu_superadmin.Visible = false;
                    menu_manager.Visible = true;
                }
            }
            else
            {
                Response.Redirect("/PageStaff/Login_Staff.aspx");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }
    }
}
