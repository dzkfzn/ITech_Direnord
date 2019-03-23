using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "Admin")
            {
                //lbl_image.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = '...' class='img-circle profile_img' height='55' width='70'   >";
                //lbl_image2.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = ''>";
                txtTopHeaderRole.Text = "Admin";
                lbl_name.Text = Session["Staffname"].ToString();

                txtCardHeaderDate.Text = DateTime.Now.ToLongDateString().ToString();

                menu_admin.Visible = true;
                menu_verifier.Visible = false;
                menu_superadmin.Visible = false;
                menu_manager.Visible = false;
            }
            else if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "Verifier")
            {
                //lbl_image.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = '...' class='img-circle profile_img' height='55' width='70' >";
                //lbl_image2.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = ''>";
                lbl_name.Text = Session["Staffname"].ToString();
                txtTopHeaderRole.Text = "Verifier";

                menu_admin.Visible = false;
                menu_verifier.Visible = true;
                menu_superadmin.Visible = false;
                menu_manager.Visible = false;

            }
            else if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "Super Admin")
            {
                //lbl_image.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = '...' class='img-circle profile_img' height='55' width='70' >";
                //lbl_image2.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = ''>";
                lbl_name.Text = Session["Staffname"].ToString();
                txtCardHeaderDate.Text = DateTime.Now.ToLongDateString().ToString() + " | " + DateTime.Now.ToShortTimeString().ToString(); 

                txtTopHeaderRole.Text = "Super Admin";
                menu_admin.Visible = false;
                menu_verifier.Visible = false;
                menu_superadmin.Visible = true;
                menu_manager.Visible = false;

            }
            else if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "Manajer")
            {
                //lbl_image.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = '...' class='img-circle profile_img' height='55' width='70' >";
                //lbl_image2.Text = "<img src='" + Session["Urlpict"].ToString() + "'alt = ''>";
                lbl_name.Text = Session["Staffname"].ToString();
                txtTopHeaderRole.Text = "Manajer";
                menu_admin.Visible = false;
                menu_verifier.Visible = false;
                menu_superadmin.Visible = false;
                menu_manager.Visible = true;

            }
            else
            {
                Response.Redirect("/PageStaff/Login_Staff.aspx");
            }

        }
        catch
        {
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }

    }

   
}
