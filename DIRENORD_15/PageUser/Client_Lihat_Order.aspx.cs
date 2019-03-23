using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Client_Lihat_Order : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Username"].ToString() != null)
            {
            }
        }
        catch
        {
            Response.Redirect("Sign_In.aspx");
        }
        dataOrderBind();
    }

    public void dataOrderBind()
    {

        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {
            // insert command
            SqlCommand cmd = new SqlCommand("sp_order_view_client", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ClientID", Session["Username"].ToString());

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        catch (Exception)
        {

        }
        finally
        {
            sqlCon.Close();
        }

    }



    protected void btnDetailOrder_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string commandArgs = btn.CommandArgument.ToString();
        Session["OrderID"] = commandArgs;
        Response.Redirect("Client_Konfirmasi_Pemesanan.aspx");

    }
}