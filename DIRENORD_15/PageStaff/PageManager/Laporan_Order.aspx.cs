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
public partial class PageStaff_PageManager_Laporan_Order : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            int tahun = DateTime.Now.Year;
            for (int x = 2018; x <= tahun; x++)
            {
                ddlTahun.Items.Add(x.ToString());
            }
        }


    }
    protected void ddlTahun_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadChart();

        tahun = Convert.ToString(ddlTahun.SelectedValue);
    }


    public void loadChart()
    {
        //try
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_report_jumlah_order_perbulan", sqlCon);
        sqlCmd.Parameters.Add("@tahun", SqlDbType.Int).Value = Convert.ToInt32(ddlTahun.SelectedValue);


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

}