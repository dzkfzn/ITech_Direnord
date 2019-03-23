using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_PageDesigner_Exam_Success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("2") && Session["Rolename"].ToString() == "5")
            {
                Response.Redirect("/PageUser/Designer_Lihat_Kontes.aspx");
            }
            else if (Session["Status"].ToString() != null && Session["VerifExam"].ToString().Equals("1") && Session["Rolename"].ToString() == "5")
            {
                //nothing
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
}