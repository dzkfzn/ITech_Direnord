using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "5") //designer
            {
                if (Session["VerifExam"].ToString() == "0")
                {
                    divLihatKon0.Visible = true;
                    divLihatKon1.Visible = false;
                    divLihatKon2.Visible = false;
                    divTranOrd.Visible = false;
                }
                else if (Session["VerifExam"].ToString() == "1")
                {
                    divLihatKon0.Visible = false;
                    divLihatKon1.Visible = true;
                    divLihatKon2.Visible = false;
                    divTranOrd.Visible = false;
                }
                else if (Session["VerifExam"].ToString() == "2")
                {
                    divLihatKon0.Visible = false;
                    divLihatKon1.Visible = false;
                    divLihatKon2.Visible = true;
                    divTranOrd.Visible = false;
                }
            }
            else if (Session["Status"].ToString() != null && Session["Rolename"].ToString() == "6") //client
            {
                divLihatKon0.Visible = false;
                divLihatKon1.Visible = false;
                divLihatKon2.Visible = false;
                divTranOrd.Visible = true;
            }

        }
        catch
        {
            divLihatKon0.Visible = false;
            divLihatKon1.Visible = false;
            divLihatKon2.Visible = false;
            divTranOrd.Visible = true;
        }
    }
}