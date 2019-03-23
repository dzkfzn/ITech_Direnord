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

public partial class MasterPage_User : System.Web.UI.MasterPage
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        checkKontesExpired();

        if (Convert.ToBoolean(Session["statusAdminLogin"]))
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("/PageUser/Index.aspx");
        }

        try
        {


            if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "5") //designer
            {
                if (Session["VerifExam"].ToString() == "0")
                {
                    divLoginClient.Visible = false;
                    divBelumLogin.Visible = false;
                    divLoginDesainerSedangTes.Visible = false;
                    divLoginDesainerLolosTes.Visible = false;
                    divLoginDesainerBelumLolosTes.Visible = true;
                    lblUsernameDesainerBelomLolosTes.Text = Session["Username"].ToString(); //belum ikut tes
                    lblimguserblt.Text = "<img class='img-circle fc-navbar__avatar' src='" + Session["Urlpict"] + "' alt='Avatar default' width='33' height='33'>";
                }
                else if (Session["VerifExam"].ToString() == "1")
                {
                    divLoginClient.Visible = false;
                    divBelumLogin.Visible = false;
                    divLoginDesainerSedangTes.Visible = true;
                    divLoginDesainerLolosTes.Visible = false;
                    divLoginDesainerBelumLolosTes.Visible = false;
                    lblUsernameDesainerSedangTes.Text = Session["Username"].ToString(); //menunggu hasil ujian
                    lblimguserst.Text = "<img class='img-circle fc-navbar__avatar' src='" + Session["Urlpict"] + "' alt='Avatar default' width='33' height='33'>";

                }
                else if (Session["VerifExam"].ToString() == "2")
                {
                    divLoginClient.Visible = false;
                    divBelumLogin.Visible = false;
                    divLoginDesainerSedangTes.Visible = false;
                    divLoginDesainerLolosTes.Visible = true;
                    divLoginDesainerBelumLolosTes.Visible = false;
                    lblUsernameDesainerLolosTes.Text = Session["Username"].ToString(); //lolos ujian
                    lblimguserslt.Text = "<img class='img-circle fc-navbar__avatar' src='" + Session["Urlpict"] + "' alt='Avatar default' width='33' height='33'>";

                }
            }
            else if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "6") //client
            {
                //lbl_nama.Text = Session["Username"].ToString();
                divBelumLogin.Visible = false;
                divLoginClient.Visible = true;
                divLoginDesainerSedangTes.Visible = false;
                divLoginDesainerLolosTes.Visible = false;
                divLoginDesainerBelumLolosTes.Visible = false;
                lblimgclient.Text = "<img class='img-circle fc-navbar__avatar' src='" + Session["Urlpict"] + "' alt='Avatar default' width='33' height='33'>";

            }


        }
        catch
        {
            divBelumLogin.Visible = true;
            divLoginDesainerSedangTes.Visible = false;
            divLoginDesainerLolosTes.Visible = false;
            divLoginClient.Visible = false;
            divLoginDesainerBelumLolosTes.Visible = false;
        }
    }

    public void checkKontesExpired()
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_contest_check_expired", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();
    }
    protected void btnLogoutBelumLolosTes_Click(object sender, EventArgs e)
    {
        Session.Clear();
        FormsAuthentication.SignOut();
        Response.Redirect("/PageUser/Index.aspx");
    }

    protected void btnLogoutSedangTes_Click(object sender, EventArgs e)
    {
        Session.Clear();
        FormsAuthentication.SignOut();
        Response.Redirect("/PageUser/Index.aspx");
    }

    protected void btnLogOutLolosTes_Click(object sender, EventArgs e)
    {
        Session.Clear();
        FormsAuthentication.SignOut();
        Response.Redirect("/PageUser/Index.aspx");
    }

    protected void btnLogoutClient_Click(object sender, EventArgs e)
    {
        Session.Clear();
        FormsAuthentication.SignOut();
        Response.Redirect("/PageUser/Index.aspx");
    }
}
