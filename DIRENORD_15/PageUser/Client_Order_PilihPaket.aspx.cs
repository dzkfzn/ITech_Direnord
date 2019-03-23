using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_PageClient_Order_PilihPaket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGold_Click(object sender, EventArgs e)
    {
        Session["IDPaket"] = "3";

        Response.Redirect("Client_Buat_Brief_Silver.aspx");

    }

    protected void btnSilver_Click(object sender, EventArgs e)
    {
        Session["IDPaket"] = "2";
        Response.Redirect("Client_Buat_Brief_Silver.aspx");

    }

    protected void btnBronze_Click(object sender, EventArgs e)
    {
        Session["IDPaket"] = "1";
        Response.Redirect("Client_Buat_Brief_Silver.aspx");

    }
}