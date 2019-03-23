using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Designer_Saldo : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("2") && Session["Rolename"].ToString() == "5")
            {
                fill();
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

    public void fill()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();

        // insert command
        SqlCommand sqlCmd1 = new SqlCommand("sp_designer_saldotabel", sqlCon);
        sqlCmd1.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd1.CommandType = CommandType.StoredProcedure;

        //create a DataAdapter
        SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd1);
        dataAdapter.Fill(ds);
        dltabel.DataSource = ds.Tables[0];
        dltabel.DataBind();
        sqlCon.Close();


        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_designer_total_saldo", sqlCon);
        sqlCmd.Parameters.AddWithValue("@DesignerID", Session["Username"].ToString());
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        lblsaldo.Text = reader[0].ToString();

        lblsaldo.Text = lblsaldo.Text.Substring(0, lblsaldo.Text.Length - 5);
        lblsaldo.Text = "Rp. " + String.Format("{0:n0}", Convert.ToDouble(lblsaldo.Text));
        sqlCon.Close();
    }
}