using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Rolename"].ToString() == "Admin")
            {
                Response.Redirect("/PageStaff/PageAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Super Admin")
            {
                filldashboard();
            }
            else if (Session["Rolename"].ToString() == "Verifier")
            {
                Response.Redirect("/PageStaff/PageVerifier/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Manajer")
            {
                Response.Redirect("/PageStaff/PageManager/Dashboard.aspx");
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }
    }

    public void filldashboard()
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_superadmin_dashboard", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        lblTotalKaryawan.Text = reader[0].ToString() + " Karyawan";
        lblTotalKaryawanAktif.Text = (Convert.ToInt16(reader[1]) ).ToString() + " Karyawan";
        lblTotalKaryawanTidakAktif.Text = reader[2].ToString() + " Karyawan";
        lblSuperAdmin.Text = reader[3].ToString() + " Super Admin";
        lblAdmin.Text = reader[4].ToString() + " Admin";
        lblVerifier.Text = reader[5].ToString() + " Verifier";
        lblManajemen.Text = reader[6].ToString() + " Manajer";
        lblTotalDesainer.Text = reader[7].ToString() + " Desainer";
        lblTotalDesainerLolos.Text = reader[8].ToString() + " Desainer";
        lblTotalDesainerBelumLolos.Text = reader[9].ToString() + " Desainer";
        lblTotalKlien.Text = reader[10].ToString() + " Klien";
        sqlCon.Close();
    }
}