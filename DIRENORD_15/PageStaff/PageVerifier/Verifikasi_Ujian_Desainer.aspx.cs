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

public partial class PageStaff_PageVerifier_Verifikasi_Ujian_Desainer : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
    public static string email;
    private string ASCENDING = " ASC ";
    private string DESCENDING = " DESC ";
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
                if (!Page.IsPostBack)
                {
                    divView.Visible = true;
                    divVerifikasi.Visible = false;
                    divPenolakan.Visible = false;

                    FillGrid();
                }
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

    protected void btnVerifikasi_Click(object sender, EventArgs e)
    {
        divView.Visible = false;
        divVerifikasi.Visible = true;
        divPenolakan.Visible = false;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();

        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_exam_view_one", sqlCon);
        sqlCmd.Parameters.AddWithValue("@ExID", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();
        dtlID.Text = reader[0].ToString();
        dtlDesainerID.Text = reader[1].ToString();
        dtlfoto.Text = "<img src = '" + reader[2].ToString() + "' alt = 'Preview' width = '235' height = '170' align = 'center' />";
        dtlDescription.Text = reader[3].ToString();
        dtlTypeDesign.Text = reader[4].ToString();
        dtlDate.Text = reader[5].ToString();
        if (reader[6].ToString() == "0")
        {
            dtlStatus.Text = "Belum Diverifikasi";
        }
        else
        {
            dtlStatus.Text = "Sudah Diverifikasi";
        }
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
            gvUjian.DataSource = ds.Tables[0];
            gvUjian.DataBind();
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
            SqlCommand cmd = new SqlCommand("sp_exam_view_notverified", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvUjian.DataSource = ds.Tables[0];
            gvUjian.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    protected void gvUjian_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvUjian.PageIndex = e.NewPageIndex;
        gvUjian.DataBind();
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
    protected void gvUjian_OnSorting(object sender, GridViewSortEventArgs e)
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

        gvUjian.DataSource = dv;
        gvUjian.DataBind();
    }

    protected void btnTerimaVerifikasi_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_exam_getemail", sqlCon);
            sqlCmd.Parameters.AddWithValue("@DesignerID", dtlDesainerID.Text);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = sqlCmd.ExecuteReader();
            reader.Read();
            email = reader[0].ToString();
            sqlCon.Close();



            //Response.Write("<script>alert('Data berhasil disimpan');</script>");
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
            MailMessage mm = new MailMessage();
            mm.To.Add(email);
            mm.From = new MailAddress("direnord.information@gmail.com");
            mm.Subject = "Yay! Desain Anda Dinyatakan Lolos!";
            mm.Body = CreateBody1();
            mm.IsBodyHtml = true;
            smtp.Send(mm);
            //Response.Write("<script>alert('Data berhasil disimpan');</script>");

            sqlCon.Open();
            SqlCommand sqlCmd1 = new SqlCommand("sp_exam_terima", sqlCon);
            sqlCmd1.CommandType = CommandType.StoredProcedure;

            sqlCmd1.Parameters.AddWithValue("@DesignerID", dtlDesainerID.Text);
            sqlCmd1.Parameters.AddWithValue("@ExID", id);

            sqlCmd1.ExecuteNonQuery();
            sqlCon.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "alert('Verifikasi berhasil dilakukan');window.location ='Verifikasi_Ujian_Desainer.aspx';", true);
        }
    }

    protected void btnKembali_Click(object sender, EventArgs e)
    {
        Response.Redirect("Verifikasi_Ujian_Desainer.aspx");
    }

    protected void btnTolakVerifikasi_Click(object sender, EventArgs e)
    {
        divPenolakan.Visible = true;
    }

    protected void btnTolak_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_exam_getemail", sqlCon);
            sqlCmd.Parameters.AddWithValue("@DesignerID", dtlDesainerID.Text);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = sqlCmd.ExecuteReader();
            reader.Read();
            email = reader[0].ToString();
            sqlCon.Close();



            //Response.Write("<script>alert('Data berhasil disimpan');</script>");
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("direnord.information@gmail.com", "ketikaja");
            MailMessage mm = new MailMessage();
            mm.To.Add(email);
            mm.From = new MailAddress("direnord.information@gmail.com");
            mm.Subject = "Mohon Maaf Desain Anda Belum Lolos :(";
            mm.Body = CreateBody();
            mm.IsBodyHtml = true;
            smtp.Send(mm);
            //Response.Write("<script>alert('Data berhasil disimpan');</script>");

            sqlCon.Open();
            SqlCommand sqlCmd1 = new SqlCommand("sp_exam_tolak", sqlCon);
            sqlCmd1.CommandType = CommandType.StoredProcedure;

            sqlCmd1.Parameters.AddWithValue("@DesignerID", dtlDesainerID.Text);
            sqlCmd1.Parameters.AddWithValue("@ExID", id);
            sqlCmd1.Parameters.AddWithValue("@Alasan", txtAlasanPenolakan.Text);

            sqlCmd1.ExecuteNonQuery();
            sqlCon.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                       "alert('Verifikasi berhasil dilakukan');window.location ='Verifikasi_Ujian_Desainer.aspx';", true);
        }
    }

    private string CreateBody()
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Tolak_Ujian.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{designerid}", dtlDesainerID.Text);
        body = body.Replace("{penolakan}", txtAlasanPenolakan.Text);
        return body;
    }

    private string CreateBody1()
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("./Terima_Ujian.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{designerid}", dtlDesainerID.Text);
        return body;
    }



    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
}