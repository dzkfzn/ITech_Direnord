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

public partial class Dashboard : System.Web.UI.Page
{

    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    string variabel1;
    public string Data1 { get { return variabel1; } }
    string variabel2;
    public string Data2 { get { return variabel2; } }

    public static string valLogo;
    public static string valKartuNama;
    public static string valBanner;

    public static string valBronze;
    public static string valSilver;
    public static string valGold;

    public static string valClient;
    public static string valDesigner;
    public static string valTotalCD;

    public static int tahun;


    public static string cl;
    public static string ds;

    protected void Page_Load(object sender, EventArgs e)
    {


        loadChart();
        loadChart2();
        loadChart3();
        loadChart4();
        loadChart5();
        loadChart5_2();
        loadChart5_3();
        loadChart6();
        loadChart6_2();

        tahun = 2019;

    }
    public void loadChart6()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_hitung_designer_perbulan", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp2 += dt.Rows[0][i].ToString() + ",";
        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        ds = temp2;

        sqlCon.Close();
    }
    public void loadChart6_2()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("[sp_report_hitung_client_perbulan]", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp2 += dt.Rows[0][i].ToString() + ",";
        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        cl = temp2;

        sqlCon.Close();
    }
    public void loadChart()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_order_perbulan", sqlCon);
        sqlCmd.Parameters.AddWithValue("@tahun", 2019);


        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp2 += dt.Rows[0][i].ToString() + ",";
        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        variabel2 = temp2;

        sqlCon.Close();
    }

    public void loadChart4()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_keuntungan_perbulan", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";
        string temp1 = "";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp1 = dt.Rows[0][i].ToString();
            temp1 = temp1.Substring(0, temp1.Length - 5);
            temp2 += temp1 + ",";

        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        variabel1 = temp2;

        sqlCon.Close();
    }

    public void loadChart2()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_contest_perkategori", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i == 0)
            {
                valLogo = dt.Rows[i][1].ToString();
            }
            else if (i == 1)
            {
                valKartuNama = dt.Rows[i][1].ToString();

            }
            else if (i == 2)
            {
                valBanner = dt.Rows[i][1].ToString();

            }
        }
        //temp2 = temp2.Substring(0, temp2.Length - 1);


        sqlCon.Close();
    }

    public void loadChart3()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_contest_perpaket", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i == 0)
            {
                valBronze = dt.Rows[i][1].ToString();
            }
            else if (i == 1)
            {
                valSilver = dt.Rows[i][1].ToString();

            }
            else if (i == 2)
            {
                valGold = dt.Rows[i][1].ToString();

            }
        }
        //temp2 = temp2.Substring(0, temp2.Length - 1);


        sqlCon.Close();
    }

    public void loadChart5()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_designer_perbulan", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp2 += dt.Rows[0][i].ToString() + ",";
        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        valClient = temp2;

        sqlCon.Close();
    }
    public void loadChart5_2()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_client_perbulan", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp2 += dt.Rows[0][i].ToString() + ",";
        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        valDesigner = temp2;

        sqlCon.Close();
    }
    public void loadChart5_3()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_user_perbulan", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);
        string temp2 = "data: [";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            temp2 += dt.Rows[0][i].ToString() + ",";
        }

        temp2 = temp2.Substring(0, temp2.Length - 1);
        temp2 += "]";

        valTotalCD = temp2;

        sqlCon.Close();
    }


}