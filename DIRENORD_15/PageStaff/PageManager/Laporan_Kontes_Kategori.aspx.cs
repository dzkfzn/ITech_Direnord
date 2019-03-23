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
public partial class PageStaff_PageManager_Laporan_Kontes_Kategori : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    string variabel1;
    public string Data1 { get { return variabel1; } }
    string variabel2;
    public string Data2 { get { return variabel2; } }

    public static string valLogo;
    public static string valKartuNama;
    public static string valBanner;

    public static string valLogo1;
    public static string valKartuNama1;
    public static string valBanner1;

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
        loadChart5();
    }


   
    public void loadChart4()
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
    public void loadChart5()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_contest_perkategori_jumlah", sqlCon);

        sqlCmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        DataTable dt = new DataTable();
        sqlDa.Fill(dt);

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if (i == 0)
            {
                valLogo1 = dt.Rows[0][i].ToString();
            }
            else if (i == 1)
            {
                valKartuNama1 = dt.Rows[0][i].ToString();

            }
            else if (i == 2)
            {
                valBanner1 = dt.Rows[0][i].ToString();

            }
        }
        //temp2 = temp2.Substring(0, temp2.Length - 1);


        sqlCon.Close();
    }


}