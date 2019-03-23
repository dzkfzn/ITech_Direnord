using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class PageUser_Client_Pengaturan : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (Session["Username"].ToString() != null)
            {
                kshidden.Attributes.Add("style", "display:none");
                profil();
            }
        }
        catch
        {
            Response.Redirect("Sign_In.aspx");
        }
    }

    public void profil()
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_client_getprofil", sqlCon);
        sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        liPassword.Attributes.Add("Class", "");
        liProfil.Attributes.Add("Class", "active");
        divProfil.Visible = true;
        divPassword.Visible = false;
        txtUsername.Text = Session["Username"].ToString();
        txtNamaLengkap.Text = Session["Name"].ToString();
        txtBiodata.Text = reader[2].ToString();
        sqlCon.Close();
    }

    protected void btnProfil_Click(object sender, EventArgs e)
    {
        profil();
    }

    protected void btnPassword_Click(object sender, EventArgs e)
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_client_getpass", sqlCon);
        sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        kshidden.Text = reader[0].ToString();
        liProfil.Attributes.Add("Class", "");
        liPassword.Attributes.Add("Class", "active");
        divProfil.Visible = false;
        divPassword.Visible = true;
    }

    protected void btnSimpanProfil_Click(object sender, EventArgs e)
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_client_biochange", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@Bio", txtBiodata.Text);


        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
    }

    protected void btnSimpanPassword_Click(object sender, EventArgs e)
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_client_passchange", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@Pass", txtPasswordBaru.Text);
        kshidden.Text = txtPasswordBaru.Text;

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
    }
}