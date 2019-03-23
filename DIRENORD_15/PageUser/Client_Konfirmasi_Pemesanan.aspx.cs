using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
public partial class PageUser_PageClient_Konfirmasi_Pemesanan : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {
            if (Session["OrderID"].ToString() != null)
            {
            }
        }
        catch
        {
            Response.Redirect("Sign_In.aspx");
        }
        if (!this.IsPostBack)
        {
            this.RepeterData();
            fillOrder();
            fillFirstBank();
        }

    }


    public void fillOrder()
    {
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_order_view", sqlCon);
        sqlCmd.Parameters.AddWithValue("@OrderID", Session["OrderID"].ToString());
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        txtOrderID.Text = reader[0].ToString();
        txtJudulKontes.Text = reader[1].ToString();
        txtDurasiKontes.Text = reader[2].ToString();

        string biaya = reader[3].ToString();
        txtBiayaDesigner.InnerText = biaya.Substring(0, biaya.Length - 5);
        txtBiayaDesigner.InnerText = "Rp. " + String.Format("{0:n0}", Convert.ToDouble(biaya));

        biaya = reader[4].ToString();
        txtBiayaAdmin.InnerText = biaya.Substring(0, biaya.Length - 5);
        txtBiayaAdmin.InnerText = "Rp. " + String.Format("{0:n0}", Convert.ToDouble(biaya));

        biaya = reader[5].ToString();
        txtBiayaTotal.InnerText = biaya.Substring(0, biaya.Length - 5);
        txtBiayaTotal.InnerText = "Rp. " + String.Format("{0:n0}", Convert.ToDouble(biaya));
        txtTotalTransfer.InnerText = "Rp. " + String.Format("{0:n0}", Convert.ToDouble(biaya));
        sqlCon.Close();

    }

    public void fillFirstBank()
    {
        sqlCon.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM [Direnord].[dbo].[Bank] where BankID = 1", sqlCon);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        Session["idBank"] = "1";
        bankTitle.InnerText = "Pembayaran melalui transfer Bank " + reader[1].ToString(); 
        gambarBank.ImageUrl= reader[3].ToString();
        txtNorek.InnerText = System.Text.RegularExpressions.Regex.Replace(reader[2].ToString(), ".{4}", "$0 ");
        sqlCon.Close();
    }


    protected void btnBCA_Click(object sender, EventArgs e)
    {

       
    }

    public void RepeterData()
    {
        sqlCon.Open();

        using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Direnord].[dbo].[Bank]", sqlCon))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptMenuSamping.DataSource = dt;
                //rptKonten.DataSource = dt;
                rptMenuSamping.DataBind();
                //rptKonten.DataBind();
            }
        }
        sqlCon.Close();

    }
    protected void btnMenu_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string commandArgs = btn.CommandArgument.ToString();
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_bank_view_detail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@BankID", commandArgs);
        Session["idBank"] = commandArgs;
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        bankTitle.InnerText = "Pembayaran melalui transfer Bank " + reader[1].ToString();
        gambarBank.ImageUrl = reader[3].ToString();
        txtNorek.InnerText = System.Text.RegularExpressions.Regex.Replace(reader[2].ToString(), ".{4}", "$0 ");
        sqlCon.Close();

    }


    protected void btnMenu_Command(object sender, CommandEventArgs e)
    {
        //tabMandiri.Visible = false;

    }

    protected void btnKonfirmasiPembayaran_Click(object sender, EventArgs e)
    {
        if (fuReferensi.HasFiles)
        {
            foreach (HttpPostedFile uploadedFile in fuReferensi.PostedFiles)
            {
                String Name = DateTime.Now.ToString("ddMMyyyyHHmmss") + uploadedFile.FileName;
                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/img/img-KonfirmasiTransfer"), Name));
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("sp_order_konfirmasi", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SenderName", txtSenderName.Text);
                cmd.Parameters.AddWithValue("@SenderTotalTransfer", txtJumlah.Text);
                cmd.Parameters.AddWithValue("@SenderBankName", txtBankName.Text);
                cmd.Parameters.AddWithValue("@OrderID", Session["OrderID"].ToString());
                cmd.Parameters.AddWithValue("@BankID", Session["idBank"].ToString());
                cmd.Parameters.AddWithValue("@image", Name);

                cmd.ExecuteNonQuery();
                sqlCon.Close();
            }
        }
        else
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand("sp_order_konfirmasi", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SenderName", txtSenderName.Text);
            cmd.Parameters.AddWithValue("@SenderTotalTransfer", txtJumlah.Text);
            cmd.Parameters.AddWithValue("@SenderBankName", txtBankName.Text);
            cmd.Parameters.AddWithValue("@OrderID", Session["OrderID"].ToString());
            cmd.Parameters.AddWithValue("@BankID", Session["idBank"].ToString());

            cmd.ExecuteNonQuery();
            sqlCon.Close();
        }
        Response.Redirect("Client_Order_Complete.aspx");

    }
}