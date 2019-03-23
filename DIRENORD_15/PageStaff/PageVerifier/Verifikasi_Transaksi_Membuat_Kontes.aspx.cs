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
using System.Web.UI.WebControls;

public partial class PageStaff_PageVerifier_Verifikasi_Transaksi_Membuat_Kontes : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
    public static string email;
    public static string id_kontes;
    public static string clientID;
    private string ASCENDING = " ASC ";
    private string DESCENDING = " DESC ";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            divView.Visible = true;
            divVerifikasi.Visible = false;

            FillGrid();
        }
    }

    protected void btnVerifikasi_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divVerifikasi.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_order_view_one", sqlCon);
        sqlCmd.Parameters.AddWithValue("@OrderID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlID.Text = reader[0].ToString();
        dtlClientID.Text = reader[7].ToString();
        clientID = reader[7].ToString();
        email = reader[14].ToString();
        id_kontes = reader[15].ToString();
        if (reader[10].ToString() == "")
        {
            dtlfoto.ImageUrl = "/img/default.png";
        }
        else
        {
            dtlfoto.ImageUrl = "/img/img-KonfirmasiTransfer/"+ reader[10].ToString();
            
        }
        dtlAtasNama.Text = reader[11].ToString();
        //dtlNorek.Text = reader[3].ToString();
        dtlBankClient.Text = reader[12].ToString();
        dtlBankDituju.Text = reader[6].ToString();
        dtlTotalTransfer.Text = reader[13].ToString();
        dtlTotalTransfer.Text = dtlTotalTransfer.Text.Substring(0, dtlTotalTransfer.Text.Length - 5);
        dtlTotalTransfer.Text = "Rp. " + String.Format("{0:n0}", Convert.ToInt64(dtlTotalTransfer.Text));


        dtlTypeDesign.Text = reader[8].ToString();

        dtlOrderDate.Text = reader[1].ToString();
        if (reader[3].ToString() == "0")
        {
            dtlOrderStatus.Text = "Belum Terverifikasi";
        }
        else
        {
            dtlOrderStatus.Text = "Terverifikasi";


        }

        dtlJudulKontes.Text = reader[5].ToString();
        dtlPaket.Text = reader[4].ToString();
        dtlIndustri.Text = reader[9].ToString();



    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGridSearch(txtSearch.Text);
    }

    public DataSet FillGridSearch(string Search)
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_exam_search_notverified", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Search", Search);

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvOrder.DataSource = ds.Tables[0];
            gvOrder.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGrid()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_order_view_notverified", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvOrder.DataSource = ds.Tables[0];
            gvOrder.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    protected void gvOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvOrder.PageIndex = e.NewPageIndex;
        gvOrder.DataBind();
    }

    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }
    protected void gvOrder_OnSorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;
        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
        }
    }

    private void SortGridView(string sortExpression, string direction)
    {
        DataTable dt = FillGrid().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gvOrder.DataSource = dv;
        gvOrder.DataBind();
    }

    protected void btnTerimaVerifikasi_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {

            //Response.Write("<script>alert('Data berhasil disimpan');</script>");
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
            MailMessage mm = new MailMessage();
            mm.To.Add(email);
            mm.From = new MailAddress("direnord.information@gmail.com");
            mm.Subject = "Selamat! Kontes Anda Sudah Dimulai";
            mm.Body = CreateBody1(clientID, "/PageUser/Client_Lihat_Kontes.aspx");
            mm.IsBodyHtml = true;
            smtp.Send(mm);
            //Response.Write("<script>alert('Data berhasil disimpan');</script>");

            sqlCon.Open();
            SqlCommand sqlCmd1 = new SqlCommand("sp_order_terima", sqlCon);
            sqlCmd1.CommandType = CommandType.StoredProcedure;

            sqlCmd1.Parameters.AddWithValue("@OrderID", id);
            sqlCmd1.Parameters.AddWithValue("@ContestID", id_kontes);

            sqlCmd1.ExecuteNonQuery();
            sqlCon.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "alert('Verifikasi berhasil dilakukan');window.location ='Verifikasi_Transaksi_Membuat_Kontes.aspx';", true);
        }
    }

    protected void btnKembali_Click(object sender, EventArgs e)
    {
        Response.Redirect("Verifikasi_Transaksi_Membuat_Kontes.aspx");
    }

    protected void btnTolakVerifikasi_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            //Response.Write("<script>alert('Data berhasil disimpan');</script>");
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
            MailMessage mm = new MailMessage();
            mm.To.Add(email);
            mm.From = new MailAddress("direnord.information@gmail.com");
            mm.Subject = "Bukti Pembayaran Anda Tidak Valid!";
            mm.Body = CreateBody(clientID, "/PageUser/Client_Lihat_Order.aspx");
            mm.IsBodyHtml = true;
            smtp.Send(mm);
            //Response.Write("<script>alert('Data berhasil disimpan');</script>");

            sqlCon.Open();
            SqlCommand sqlCmd1 = new SqlCommand("sp_order_tolak", sqlCon);
            sqlCmd1.CommandType = CommandType.StoredProcedure;
            sqlCmd1.Parameters.AddWithValue("@OrderID", id);
            sqlCmd1.Parameters.AddWithValue("@ContestID", id_kontes);

            sqlCmd1.ExecuteNonQuery();
            sqlCon.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "alert('Verifikasi berhasil dilakukan');window.location ='Verifikasi_Transaksi_Membuat_Kontes.aspx';", true);
        }
    }

    protected void btnTolak_Click(object sender, EventArgs e)
    {
        
    }

    private string CreateBody(string id,string link)
    {
        string body = string.Empty;
        string linkQ = "http://localhost:50891" + link;

        using (StreamReader reader = new StreamReader(Server.MapPath("./Tolak_Order.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{ClientID}", id);
        body = body.Replace("{linkPembayaran}", linkQ);
        return body;
    }

    private string CreateBody1(string id, string link)
    {
        string body = string.Empty;
        string linkQ = "http://localhost:50891" + link;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Terima_Order.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{ClientID}", id);
        body = body.Replace("{linkPembayaran}", linkQ);
        return body;
    }



    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
}