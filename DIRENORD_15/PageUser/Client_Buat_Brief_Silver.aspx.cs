using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class PageUser_PageClient_Buat_Brief_Silver : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        hiddenDDLDurasi();
        getEmail();


        if (Session["IDKategori"].ToString() == "1")
        {

            divLogo.Visible = true;
        }
        else if (Session["IDKategori"].ToString() == "2")
        {
            divKopSurat.Visible = true;

        }
        else if (Session["IDKategori"].ToString() == "3")
        {
            divBanner.Visible = true;

        }

        try
        {
            if (Session["Username"].ToString() != null)
            {

            }

            if (Session["IDPaket"].ToString() == "1")
            {
                ddlBronze.Visible = true;
                RequiredFieldValidator4.Enabled = true;
            }
            else if (Session["IDPaket"].ToString() == "2")
            {
                ddlSilver.Visible = true;
                RequiredFieldValidator5.Enabled = true;

            }
            else if (Session["IDPaket"].ToString() == "3")
            {
                ddlGold.Visible = true;
                RequiredFieldValidator6.Enabled = true;

            }


        }
        catch
        {
            Session["StatusOrderKontes"] = true;
            Response.Redirect("/PageUser/Sign_In.aspx");
        }
    }
    public void hiddenDDLDurasi()
    {
        ddlBronze.Visible = false;
        ddlSilver.Visible = false;
        ddlGold.Visible = false;
    }
    public static string email;
    public static string namaPaket;
    public static string OrderTotal;

    public void getEmail()
    {
        try
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_exam_getemail_client", sqlCon);
            sqlCmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = sqlCmd.ExecuteReader();
            reader.Read();
            email = reader[0].ToString();
            sqlCon.Close();
        }
        catch
        {
            Session["StatusOrderKontes"] = "True";
            Response.Redirect("/PageUser/Sign_In.aspx");
        }
    }

    public void clearInputForm()
    {

    }
    protected void btnSimpan_Click(object sender, EventArgs e)
    {
        String id = "KT-" + DateTime.Now.ToString("ddMMyyyy-HHmmss");
        String id_order = "ORD-" + Session["Username"].ToString() + "-" + DateTime.Now.ToString("ddMMyyyy-HHmmss");

        Session["OrderID"] = id_order;
        Session["ContestID"] = id;

        string style="";
        if (Session["IDKategori"].ToString() == "1")
        {
            
            String logo = "";
            for (int i = 1; i <= 8; i++)
            {
                HtmlInputCheckBox check = (HtmlInputCheckBox)divLogo.FindControl("logo" + i);
                if (check.Checked == true)
                {
                    logo = logo + "," + check.Value;
                }

            }
            style = logo;
        }
        else if (Session["IDKategori"].ToString() == "2")
        {
            String stat = "";
            for (int i = 1; i <= 5; i++)
            {
                HtmlInputCheckBox check = (HtmlInputCheckBox)divKopSurat.FindControl("stat" + i);
                if (check.Checked == true)
                {
                    stat = stat + "," + check.Value;
                }

            }
            style = stat;
        }
        else if (Session["IDKategori"].ToString() == "3")
        {
             style = rbBanner.SelectedValue;
        }


        String warna = "";
        for (int i = 1; i <= 12; i++)
        {
            HtmlInputCheckBox check = (HtmlInputCheckBox)warnaDesaign.FindControl("warna" + i);
            if (check.Checked == true)
            {
                warna = warna + "," + check.Value;
            }

        }

        
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_contest_input", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@ContestID", id);
        sqlCmd.Parameters.AddWithValue("@IndustryID", industry_id.SelectedValue);
        sqlCmd.Parameters.AddWithValue("@ContestNameDesign", txtNamaDesaign.Text);
        sqlCmd.Parameters.AddWithValue("@ContestDescClient", txtDescPerusahaan.Text);
        sqlCmd.Parameters.AddWithValue("@ContestColour", warna);
        sqlCmd.Parameters.AddWithValue("@ContestDescDesign", txtDescDesaign.Text);
        sqlCmd.Parameters.AddWithValue("@ContestTitle", txtTitle.Text);
        sqlCmd.Parameters.AddWithValue("@ContestStyle", style.ToUpper());

        string durasi = null;
        if (Session["IDPaket"].ToString() == "1")
        {
            durasi = ddlBronzeDurasi.SelectedValue;
            namaPaket = "Bronze";
            OrderTotal = " 1.100.000";

        }
        else if (Session["IDPaket"].ToString() == "2")
        {
            durasi = ddlSilverDurasi.SelectedValue;
            namaPaket = "Silver";
            OrderTotal = " 2.200.000";

        }
        else if (Session["IDPaket"].ToString() == "3")
        {
            durasi = ddlGoldDurasi.SelectedValue;
            namaPaket = "Gold";
            OrderTotal = " 4.250.000";

        }

        sqlCmd.Parameters.AddWithValue("@ContestDuration", durasi);
        sqlCmd.Parameters.AddWithValue("@CategoryID", Session["IDKategori"].ToString());
        sqlCmd.Parameters.AddWithValue("@PackageID", Session["IDPaket"].ToString());
        sqlCmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@OrderID", id_order);


        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
        MailMessage mm = new MailMessage();
        mm.To.Add(email);
        mm.From = new MailAddress("direnord.information@gmail.com");
        mm.Subject = "Sribu - Invoice kontes " + txtTitle.Text;
        mm.Body = bodyEmailCreateOrder(
             Session["Username"].ToString().ToLower(),
             txtTitle.Text,
             id_order,
             DateTime.Now.ToString(),
             namaPaket,
             OrderTotal
            );
        mm.IsBodyHtml = true;
        smtp.Send(mm);


        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();

        if (fuReferensi.HasFiles)
        {
            foreach (HttpPostedFile uploadedFile in fuReferensi.PostedFiles)
            {
                String Name = DateTime.Now.ToString("ddMMyyyyHHmmss") + uploadedFile.FileName;
                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/img/img-RefrenceContest"), Name));
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("sp_picture_refer_input", sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Contes", id);
                cmd.Parameters.AddWithValue("@image", Name);

                cmd.ExecuteNonQuery();
                sqlCon.Close();
            }
        }
        clearInputForm();
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
        //        "alert('Data berhasil disimpan');", true);
        Response.Redirect("Client_Konfirmasi_Pemesanan.aspx");

    }

    private string bodyEmailCreateOrder(
        string ClientID,
        string judulKontes,
        string OrderID,
        string OrderDate,
        string PaketNama,
        string OrderTotal

        )
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Buat_Order.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{ClientID}", ClientID);
        body = body.Replace("{judulKontes}", judulKontes);
        body = body.Replace("{OrderID}", OrderID);
        body = body.Replace("{OrderDate}", OrderDate);
        body = body.Replace("{PaketNama}", PaketNama);
        body = body.Replace("{OrderTotal}", OrderTotal);
        return body;
    }

}