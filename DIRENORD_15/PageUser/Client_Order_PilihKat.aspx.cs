using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_PageClient_Order_PilihKat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

  

    protected void btnLogo_Click(object sender, EventArgs e)
    {
        Session["IDKategori"] = "1";
        Response.Redirect("Client_Order_PilihPaket.aspx");

    }

    protected void btnKopSurat_Click(object sender, EventArgs e)
    {
        Session["IDKategori"] = "2";
        Response.Redirect("Client_Order_PilihPaket.aspx");

    }

    protected void btnBanner_Click(object sender, EventArgs e)
    {
        Session["IDKategori"] = "3";
        Response.Redirect("Client_Order_PilihPaket.aspx");

    }
}