using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Client_Lihat_Kontes : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Username"].ToString() != null)
            {
            }
        }
        catch
        {
            Response.Redirect("Sign_In.aspx");
        }
        dataOrderBindAll();
    }

    public void defaultSemua()
    {
        //divKontesBatal.Visible = false;
        //divKontesBerjalan.Visible = false;
        //divKontesSelesai.Visible = false;
        //divNoRecord.Visible = false;
        //divSemuaKontes.Visible = false;

        liKontesBatal.Attributes.Clear();
        liKontesBerjalan.Attributes.Clear();
        liSemuaKontes.Attributes.Clear();
        liKontesSelesai.Attributes.Clear();

        //("Class", "");
        //liKontesBerjalan.Attributes.Add("Class", "");
        //liKontesSelesai.Attributes.Add("Class", "");
        //liSemuaKontes.Attributes.Add("Class", "");
    }

    public void dataOrderBindAll()
    {

        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand cmd = new SqlCommand("sp_contest_view_client", sqlCon);
            cmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            lvSemuaKontes.DataSource = ds;
            lvSemuaKontes.DataBind();
        }
        catch (Exception)
        {

        }
        finally
        {
            sqlCon.Close();
        }

    }
    public void dataOrderBindAllBerjalan()
    {

        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand cmd = new SqlCommand("sp_contest_view_client_contest_berjalan", sqlCon);
            cmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            lvSemuaKontes.DataSource = ds;
            lvSemuaKontes.DataBind();
        }
        catch (Exception)
        {

        }
        finally
        {
            sqlCon.Close();
        }

    }
    public void dataOrderBindAllSelesai()
    {

        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand cmd = new SqlCommand("sp_contest_view_client_contest_selesai", sqlCon);
            cmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            lvSemuaKontes.DataSource = ds;
            lvSemuaKontes.DataBind();
        }
        catch (Exception)
        {

        }
        finally
        {
            sqlCon.Close();
        }

    }
    public void dataOrderBindAllPending()
    {

        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand cmd = new SqlCommand("sp_contest_view_client_contest_batal", sqlCon);
            cmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            lvSemuaKontes.DataSource = ds;
            lvSemuaKontes.DataBind();
        }
        catch (Exception)
        {

        }
        finally
        {
            sqlCon.Close();
        }

    }
    protected void btnKontesBatal_Click(object sender, EventArgs e)
    {
        defaultSemua();
        divKontesBatal.Visible = true;
        liKontesBatal.Attributes.Add("Class", "active");
        labelTitle.InnerHtml = "Daftar kontes yang pending.";

        dataOrderBindAllPending();

    }

    protected void btnKontesSelesai_Click(object sender, EventArgs e)
    {
        defaultSemua();
        liKontesSelesai.Attributes.Add("Class", "active");
        labelTitle.InnerHtml = "Daftar kontes yang sudah selesai.";
        dataOrderBindAllSelesai();

    }

    protected void btnKontesBerjalan_Click(object sender, EventArgs e)
    {
        defaultSemua();
        liKontesBerjalan.Attributes.Add("Class", "active");
        labelTitle.InnerHtml = "Daftar kontes yang sedang berjalan.";
        dataOrderBindAllBerjalan();

    }

    protected void btnSemuaKontes_Click(object sender, EventArgs e)
    {
        defaultSemua();
        liSemuaKontes.Attributes.Add("Class", "active");
        labelTitle.InnerHtml = "Daftar kontes yang pernah dibuat.";

    }

    protected void btnDetailTrans_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string commandArgs = btn.CommandArgument.ToString();
        Session["OrderID"] = commandArgs;
        Response.Redirect("Client_Konfirmasi_Pemesanan.aspx");
    }

    protected void btnDetailKontes_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        string ContestID = commandArgs[0].ToString();

        Response.Redirect("/PageUser/Client_Detail_Kontes.aspx?contest=" + ContestID);
    }

    protected void btnRiwayat_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        string ContestID = commandArgs[0].ToString();

        Response.Redirect("/PageUser/Client_Detail_ContestSelesai.aspx?contest=" + ContestID);
    }

    protected void btnLihatProfileDesigner_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        string designerID = commandArgs[0].ToString();
        Session["lihatProfDesign"] = designerID;

        Response.Redirect("Designer_Lihat_Profil.aspx");
    }
}