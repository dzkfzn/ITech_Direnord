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

public partial class PageUser_Designer_Detail_Contest : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null)
            {
                FillGrid();
            }
            else
            {

            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("/PageUser/Sign_In.aspx");
        }
    }

    public void fillPemenang()
    {
        DataSet ds = new DataSet();

        sqlCon.Open();
        SqlCommand sqlCmdPemenang = new SqlCommand("sp_client_view_contest_winner", sqlCon);
        sqlCmdPemenang.Parameters.AddWithValue("@ContestID", contestID);
        sqlCmdPemenang.CommandType = CommandType.StoredProcedure;
        //create a DataAdapter
        SqlDataAdapter dataAdapterPemenang = new SqlDataAdapter(sqlCmdPemenang);
        dataAdapterPemenang.Fill(ds);
        dlPemenang.DataSource = ds.Tables[0];
        dlPemenang.DataBind();
        sqlCon.Close();

    }
    public static string contestID;
    public void FillGrid()
    {
        divDesain.Visible = true;
        divBrief.Visible = false;
        liDesain.Attributes.Add("Class", "active");
        liBrief.Attributes.Add("Class", "");

        if (!String.IsNullOrEmpty(Request.QueryString["contest"]))
        {
            // Query string value is there so now use it
            string conid = Request.QueryString["contest"].ToString();
            contestID = Request.QueryString["contest"].ToString();

            DataSet ds = new DataSet();
            try
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("sp_designer_view_contest_alldesain", sqlCon);
                sqlCmd.Parameters.AddWithValue("@ContestID", conid);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                //create a DataAdapter
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd);
                dataAdapter.Fill(ds);
                dlgambardesain.DataSource = ds.Tables[0];
                DataList1.DataSource = ds.Tables[0];

                dlgambardesain.DataBind();
                DataList1.DataBind();

                sqlCon.Close();

                fillPemenang();

                sqlCon.Open();
                SqlCommand sqlCmd1 = new SqlCommand("sp_designer_view_contest_detail", sqlCon);
                sqlCmd1.Parameters.AddWithValue("@ID", conid);
                sqlCmd1.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = sqlCmd1.ExecuteReader();
                reader.Read();
                lbljudulkontes.Text = reader[0].ToString();
                judulKontes= reader[0].ToString();
                lblusername.Text = "@" + reader[1].ToString();
                lbltglberakhir.Text = reader[2].ToString();
                lbljumlahentri.Text = reader[3].ToString();
                lblhadiahpemenang.Text = reader[4].ToString();
                lblhadiahpemenang.Text = lblhadiahpemenang.Text.Substring(0, lblhadiahpemenang.Text.Length - 5);
                lblhadiahpemenang.Text = "Rp. " + String.Format("{0:n0}", Convert.ToInt64(lblhadiahpemenang.Text));
                hadiahKontes = lblhadiahpemenang.Text;

                lblnamapaket.Text = reader[5].ToString();
                lblkategori.Text = reader[6].ToString();
                lblindsutri.Text = reader[7].ToString();

                lblBriefJudul.Text = reader[0].ToString();
                lblBriefDescDesain.Text = reader[11].ToString();
                lblBriefWarna.Text = reader[10].ToString();
                lblBriefIndustri.Text = reader[7].ToString();
                lblBriefDescKlien.Text = reader[9].ToString();
                lblBriefNamaDesain.Text = reader[8].ToString();

                sqlCon.Close();
            }
            catch (Exception)
            {
                sqlCon.Close();
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
               "alert('Request gagal!');window.location ='Designer_Lihat_Kontes.aspx';", true);
        }

    }

    protected void btnDesain_Click(object sender, EventArgs e)
    {
        FillGrid();
    }


    protected void btnBrief_Click(object sender, EventArgs e)
    {
        divDesain.Visible = false;
        divBrief.Visible = true;
        liDesain.Attributes.Add("Class", "");
        liBrief.Attributes.Add("Class", "active");

        if (!String.IsNullOrEmpty(Request.QueryString["contest"]))
        {
            // Query string value is there so now use it
            string conid = Request.QueryString["contest"].ToString();

            sqlCon.Open();
            DataSet ds = new DataSet();

            // insert command
            SqlCommand sqlCmd = new SqlCommand("sp_designer_view_contest_reference", sqlCon);
            sqlCmd.Parameters.AddWithValue("@ID", conid);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd);
            dataAdapter.Fill(ds);
            dlBriefReference.DataSource = ds.Tables[0];
            dlBriefReference.DataBind();
            sqlCon.Close();
        }


        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
               "alert('Request gagal!');window.location ='Designer_Lihat_Kontes.aspx';", true);
        }
    }



    protected void btnUploadDesain_Click(object sender, EventArgs e)
    {
        string conid = Request.QueryString["contest"].ToString();

        string PDID = Session["Username"].ToString() + "-" + conid;
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_designer_input_design", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd.Parameters.AddWithValue("@ContestID", conid);
        sqlCmd.Parameters.AddWithValue("@PDID", PDID);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();


        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Upload desain berhasil, Goodluck!');window.location ='Designer_Lihat_Kontes.aspx';", true);
    }

    public static string DesignerID;
    public static string judulKontes;
    public static string hadiahKontes;
    
    protected void btnPemenang_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string commandArgs = btn.CommandArgument.ToString();
        DesignerID = btn.CommandArgument.ToString();
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_client_set_contest_winner", sqlCon);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.AddWithValue("@DesignerID", commandArgs);
        sqlCmd.Parameters.AddWithValue("@ContestID", contestID);

        sqlCmd.ExecuteNonQuery();
        sqlCon.Close();



        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
        MailMessage mm = new MailMessage();
        mm.To.Add(getEmailDesigner());
        mm.From = new MailAddress("direnord.information@gmail.com");
        mm.Subject = "Sribu - Selamat! Anda memenangkan Kontes " + judulKontes +"! ";
        mm.Body = bodyEmailCreateOrder();


        mm.IsBodyHtml = true;
        smtp.Send(mm);


        Response.Redirect("/PageUser/Client_Detail_TransferFile.aspx?contest=" + contestID);
    }

    public string getEmailDesigner()
    {
        string email;
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_exam_getemail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@DesignerID", DesignerID);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        email = reader[0].ToString();
        sqlCon.Close();

        return email;
    }
    public string bodyEmailCreateOrder()
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Designer_Winner.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{DesignerID}", DesignerID);
        body = body.Replace("{judulKontes}", judulKontes);
        body = body.Replace("{hadiahKontes}", hadiahKontes);
        return body;
    }

}