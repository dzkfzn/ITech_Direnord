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

public partial class PageStaff_PageManager_Laporan_Profit : System.Web.UI.Page
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

    public static string tahun;
    protected void Page_Load(object sender, EventArgs e)
    {
        loadChart4();
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

}