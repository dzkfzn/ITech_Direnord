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
                fillBank();
            }
            else if (Session["Rolename"].ToString() == "Super Admin")
            {
                Response.Redirect("/PageStaff/PageSuperAdmin/Dashboard.aspx");
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
        catch(NullReferenceException ex)
        {
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }
        
    }

    public void fillBank()
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_admin_dashboard", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        lblTotalBank.Text = reader[0].ToString() + " Bank";
        lblTotalBankAktif.Text = reader[1].ToString() + " Bank";
        lblTotalBankTidakAktif.Text = reader[2].ToString() + " Bank";
        lblTotalIndustri.Text = reader[3].ToString() + " Industri";
        lblTotalIndustriAktif.Text = reader[4].ToString() + " Industri";
        lblTotalIndustriTidakAktif.Text = reader[5].ToString() + " Industri";
        lblTotalPaket.Text = reader[6].ToString() + " Paket Kontes";
        lblTotalPaketAktif.Text = reader[7].ToString() + " Paket Kontes";
        lblTotalPaketTidakAktif.Text = reader[8].ToString() + " Paket Kontes";
        sqlCon.Close();
    }
}