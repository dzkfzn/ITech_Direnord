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

public partial class PageStaff_PageVerifier_Pengaturan_Akun : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string tampunggambar;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Rolename"].ToString() == "Admin")
            {
                Response.Redirect("/PageStaff/PageAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Super Admin")
            {
                Response.Redirect("/PageStaff/PageSuperAdmin/Dashboard.aspx");
            }
            else if (Session["Rolename"].ToString() == "Verifier")
            {
                kshidden.Attributes.Add("style", "display:none");
                view();
            }
            else if (Session["Rolename"].ToString() == "Manajer")
            {
                Response.Redirect("/PageStaff/PageManager/Dashboard.aspx");
            }
        }
        catch (NullReferenceException ex)
        {
            Response.Redirect("/PageStaff/Login_Staff.aspx");
        }
    }

    void view()
    {
        divKS.Visible = false;

        lblnamaprofil.Text = "Profil " + Session["Staffname"].ToString();
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_Staff_view_detail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@StaffUsername", Session["Username"].ToString());
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        tampunggambar = reader[6].ToString();
        dtlfoto.Text = "<img src = '" + reader[6].ToString() + "' alt = 'Preview' style=\"width:100%; height: 350px;\" align = 'center' />";
        dtlUsername.Text = reader[0].ToString();
        dtlJabatan.Text = reader[1].ToString();
        dtlNama.Text = reader[2].ToString();
        dtlEmail.Text = reader[3].ToString();
        dtlAdress.Text = reader[4].ToString();
        dtlNoHp.Text = reader[5].ToString();
        dtlNoHp.Text = System.Text.RegularExpressions.Regex.Replace(dtlNoHp.Text, ".{4}", "$0 ");

        if (reader[11].ToString() == "1")
        {
            dtlGender.Text = "Laki-Laki";
        }
        else
        {
            dtlGender.Text = "Perempuan";

        }

        dtlBirthdate.Text = reader[12].ToString();
        dtlBirthdate.Text = dtlBirthdate.Text.Substring(0, dtlBirthdate.Text.Length - 9);

        kshidden.Text = reader[13].ToString();

        sqlCon.Close();
    }

    protected void btnKembaliDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void btnUbahKS_Click(object sender, EventArgs e)
    {
        divKS.Visible = true;

    }

    protected void btnSimpanPerubahan_Click(object sender, EventArgs e)
    {
        if (Path.GetFileName(FileUpload1.FileName) != "" && txtKataSandiBaru.Text != "" && txtKataSandiBaruUlang.Text != "" && txtKataSandiLama.Text != "") //update gambar dan password
        {
            FileUpload1.SaveAs(Server.MapPath("~/img/img-Staff/") + Path.GetFileName(FileUpload1.FileName));
            String link = "/img/img-Staff/" + Path.GetFileName(FileUpload1.FileName);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_staff_ubah_profil", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Password", txtKataSandiBaru.Text);
            sqlCmd.Parameters.AddWithValue("@FotoBaru", link);
            sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());


            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Session["Urlpict"] = link;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Profil berhasil diubah');window.location ='Pengaturan_Akun.aspx';", true);
        }
        else if (Path.GetFileName(FileUpload1.FileName) != "" && txtKataSandiBaru.Text == "" && txtKataSandiBaruUlang.Text == "" && txtKataSandiLama.Text == "") //update gambar
        {
            FileUpload1.SaveAs(Server.MapPath("~/img/img-Staff/") + Path.GetFileName(FileUpload1.FileName));
            String link = "/img/img-Staff/" + Path.GetFileName(FileUpload1.FileName);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_staff_ubah_profil", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Password", kshidden.Text);
            sqlCmd.Parameters.AddWithValue("@FotoBaru", link);
            sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());



            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Session["Urlpict"] = link;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Profil berhasil diubah');window.location ='Pengaturan_Akun.aspx';", true);
        }
        else if (Path.GetFileName(FileUpload1.FileName) == "" && txtKataSandiBaru.Text != "" && txtKataSandiBaruUlang.Text != "" && txtKataSandiLama.Text != "") //update password
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_staff_ubah_profil", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Password", txtKataSandiBaru.Text);
            sqlCmd.Parameters.AddWithValue("@FotoBaru", tampunggambar);
            sqlCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());



            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Profil berhasil diubah');window.location ='Pengaturan_Akun.aspx';", true);
        }
    }
}