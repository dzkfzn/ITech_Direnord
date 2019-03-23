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
                Response.Redirect("/PageStaff/PageSuperAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Verifier")
            {
                filldashboard();
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
        SqlCommand sqlCmd = new SqlCommand("sp_verifier_dashboard", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        lblUjianBelum.Text = reader[0].ToString() + " Ujian";
        lblUjianUdah.Text = reader[3].ToString() + " Ujian";
        lblUjianDiterima.Text = reader[2].ToString() + " Ujian";
        lblUjianDitolak.Text = reader[1].ToString() + " Ujian";
        lblTotalUjian.Text = reader[4].ToString() + " Ujian";

        lblBelumDiverifikasi.Text = reader[5].ToString() + " Order";
        lblSudahDiverifikasi.Text = reader[6].ToString() + " Order";
        lblTransaksiDitolak.Text = reader[7].ToString() + " Order";
        lblTransaksiDiterima.Text = reader[8].ToString() + " Order";
        lblTotalTransaksi.Text = reader[9].ToString() + " Order";
        sqlCon.Close();
    }
}