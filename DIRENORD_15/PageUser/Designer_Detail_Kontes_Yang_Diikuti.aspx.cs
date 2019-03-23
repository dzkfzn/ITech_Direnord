using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Designer_Detail_Kontes_Yang_Diikuti : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("2") && Session["Rolename"].ToString() == "5")
            {
                FillGrid();
            }
            else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("1") && Session["Rolename"].ToString() == "5")
            {
                Response.Redirect("/PageUser/Designer_Exam_Success.aspx");
            }
            else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("0") && Session["Rolename"].ToString() == "5")
            {
                Response.Redirect("/PageUser/Designer_Exam.aspx");
            }
            else
            {
                Response.Redirect("/PageUser/Sign_In.aspx");
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("/PageUser/Sign_In.aspx");
        }
    }

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
                dlgambardesain.DataBind();
                sqlCon.Close();

                sqlCon.Open();
                SqlCommand sqlCmd1 = new SqlCommand("sp_designer_view_contest_detail", sqlCon);
                sqlCmd1.Parameters.AddWithValue("@ID", conid);
                sqlCmd1.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = sqlCmd1.ExecuteReader();
                reader.Read();
                lbljudulkontes.Text = reader[0].ToString();
                lblusername.Text = "@" + reader[1].ToString();
                lbltglberakhir.Text = reader[2].ToString();
                lbljumlahentri.Text = reader[3].ToString();
                lblhadiahpemenang.Text = reader[4].ToString();
                lblhadiahpemenang.Text = lblhadiahpemenang.Text.Substring(0, lblhadiahpemenang.Text.Length - 5);
                lblhadiahpemenang.Text = "Rp. " + String.Format("{0:n0}", Convert.ToInt64(lblhadiahpemenang.Text));
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
               "alert('Request gagal!');window.location ='Designer_Lihat_Kontes_Yang_Diikuti.aspx';", true);
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
               "alert('Request gagal!');window.location ='Designer_Lihat_Kontes_Yang_Diikuti.aspx';", true);
        }
    }




}