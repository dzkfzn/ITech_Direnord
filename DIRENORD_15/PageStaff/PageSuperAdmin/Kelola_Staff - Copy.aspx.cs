using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStaff_PageSuperAdmin_Kelola_Staff : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["direnord"].ConnectionString);
    public static string id;
    public static string tampunnggambar;
    DateTime today = DateTime.Now;
    private string ASCENDING = " ASC ";
    private string DESCENDING = " DESC ";
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
                if (!Page.IsPostBack)
                {
                    divView.Visible = true;
                    divInputForm.Visible = false;
                    divUpdateForm.Visible = false;
                    divDetail.Visible = false;
                    FillGrid();
                }
            }
            else if (Session["Rolename"].ToString() == "Verifier")
            {
                Response.Redirect("/PageStaff/PageVerifier/Dashboard.aspx");
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

    public DataSet FillGrid()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_Staff_view", sqlCon);
            cmd.Parameters.AddWithValue("@StaffUsername", Session["Username"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvStaff.DataSource = ds.Tables[0];
            gvStaff.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGridSearch(string Search)
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_staff_search", sqlCon);
            cmd.Parameters.AddWithValue("@StaffUsername", Session["Username"].ToString());
            cmd.Parameters.AddWithValue("@Search", Search);
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvStaff.DataSource = ds.Tables[0];
            gvStaff.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    public DataSet FillGridAktif()
    {
        sqlCon.Open();
        DataSet ds = new DataSet();
        try
        {

            // insert command
            SqlCommand cmd = new SqlCommand("sp_staff_view_aktif", sqlCon);
            cmd.Parameters.AddWithValue("@StaffUsername", Session["Username"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;

            //create a DataAdapter
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);
            gvStaff.DataSource = ds.Tables[0];
            gvStaff.DataBind();
            sqlCon.Close();
        }
        catch (Exception)
        {
            sqlCon.Close();
        }
        return ds;
    }

    protected void btnAddView_Click(object sender, EventArgs e)
    {
        divInputForm.Visible = true;
        divUpdateForm.Visible = false;
        divView.Visible = false;
        divDetail.Visible = false;

        LoadSubjects();
    }

    protected void btnUpdateView_Click(object sender, EventArgs e)
    {
        divInputForm.Visible = false;
        divUpdateForm.Visible = true;
        divView.Visible = false;
        divDetail.Visible = false;


        LoadSubjectsUpd();

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();
        txtUpd_Username.Text = id;
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_Staff_view_update", sqlCon);
        sqlCmd.Parameters.AddWithValue("@StaffUsername", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        txtUpd_Username.Text = reader[0].ToString();
        ddlUpd.SelectedValue = reader[1].ToString();
        txtUpd_Nama.Text = reader[2].ToString();
        txtUpd_Email.Text = reader[3].ToString();
        txtUpd_Alamat.Text = reader[5].ToString();
        txtUpd_HP.Text = reader[6].ToString();
        lblPreiewFoto.Text = "<img id = 'blahea' src = '" + reader[7].ToString() + "' alt = '' width = 'auto' height = '100' />";
        tampunnggambar = reader[7].ToString();
        if (reader[8].ToString() == "1")
        {
            rbUpd_JenisKelamin.SelectedValue = "1";
        }
        else if (reader[8].ToString() == "0")
        {
            rbUpd_JenisKelamin.SelectedValue = "0";
        }
        txtUpd_TglLahir.Text = reader[9].ToString();
        txtUpd_TglLahir.Text = txtUpd_TglLahir.Text.Substring(0, txtUpd_TglLahir.Text.Length - 9);
        sqlCon.Close();

    }

    private void LoadSubjectsUpd()
    {

        DataTable subjectsUpd = new DataTable();

        try
        {
            SqlDataAdapter adapterUpd = new SqlDataAdapter("SELECT * from role WHERE RoleID != 5 AND RoleID != 6 ", sqlCon);
            adapterUpd.Fill(subjectsUpd);

            ddlUpd.DataSource = subjectsUpd;
            ddlUpd.DataTextField = "RoleName";
            ddlUpd.DataValueField = "RoleID";
            ddlUpd.DataBind();
        }
        catch (Exception ex)
        {
            // Handle the error
        }

        // Add the initial item - you can add this even if the options from the
        // db were not successfully loaded
        //ddlInp.Items.Insert(0, new ListItem("------ Select Role ------", ""));


    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            LinkButton btn = (LinkButton)(sender);
            id = btn.CommandArgument;
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_Staff_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@StaffUsername", id);
            sqlCmd.Parameters.AddWithValue("@StaffStatusActive", "0");
            sqlCmd.Parameters.AddWithValue("@StaffModifiedDate", today);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Staff.aspx';", true);
            FillGrid();
        }
    }

    protected void btnDeleteEnable_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            LinkButton btn = (LinkButton)(sender);
            id = btn.CommandArgument;
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_Staff_delete", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@StaffUsername", id);
            sqlCmd.Parameters.AddWithValue("@StaffStatusActive", "1");
            sqlCmd.Parameters.AddWithValue("@StaffModifiedDate", today);

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Berhasil');window.location ='Kelola_Staff.aspx';", true);
            FillGrid();
        }
    }

    protected void btnSimpanInputForm_Click(object sender, EventArgs e)
    {
        bool tesuername = CheckUserName(txtInp_Username.Text);
        if (tesuername)
        {
            FileUpload_Input.SaveAs(Server.MapPath("~/img/img-Staff/") + Path.GetFileName(FileUpload_Input.FileName));
            String link = "/img/img-Staff/" + Path.GetFileName(FileUpload_Input.FileName);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_Staff_input", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            sqlCmd.Parameters.AddWithValue("@StaffCreatedBy", Session["Username"].ToString());
            sqlCmd.Parameters.AddWithValue("@StaffCreatedDate", today);
            sqlCmd.Parameters.AddWithValue("@StaffPictureProfile", link);
            sqlCmd.Parameters.AddWithValue("@StaffUsername", txtInp_Username.Text);
            sqlCmd.Parameters.AddWithValue("@StaffName", txtInp_Nama.Text);
            sqlCmd.Parameters.AddWithValue("@StaffEmail", txtInp_Email.Text);
            sqlCmd.Parameters.AddWithValue("@StaffPassword", txtInp_Password.Text);
            sqlCmd.Parameters.AddWithValue("@StaffAddress", txtInp_Alamat.Text);
            sqlCmd.Parameters.AddWithValue("@StaffPhoneNumber", txtInp_HP.Text);
            sqlCmd.Parameters.AddWithValue("@StaffGender", rbJenisKelamin.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@StaffBirthDate", Convert.ToDateTime(txtInp_TglLahir.Text));
            sqlCmd.Parameters.AddWithValue("@RoleID", ddlInp.SelectedValue);



            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            clearInputForm();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Data berhasil disimpan');window.location ='Kelola_Staff.aspx';", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                   "alert('Username sudah terdaftar!');", true);
        }



    }
   
    public static bool CheckUserName(string username)
    {
        bool status = false;
        string constr = ConfigurationManager.ConnectionStrings["direnord"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("sp_Staff_cek_username", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaffUserName", username.Trim());
                conn.Open();
                status = Convert.ToBoolean(cmd.ExecuteScalar());
                conn.Close();
            }
        }
        return status;
    }


    private void LoadSubjects()
    {

        DataTable subjects = new DataTable();


        try
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * from role WHERE RoleID != 5 AND RoleID != 6 ", sqlCon);
            adapter.Fill(subjects);

            ddlInp.DataSource = subjects;
            ddlInp.DataTextField = "RoleName";
            ddlInp.DataValueField = "RoleID";
            ddlInp.DataBind();
        }
        catch (Exception ex)
        {
            // Handle the error
        }



        // Add the initial item - you can add this even if the options from the
        // db were not successfully loaded
        ddlInp.Items.Insert(0, new ListItem("------ Pilih Jabatan ------", ""));
        //ddlInp.Items.FindByText("Admin");

    }


    void clearInputForm()
    {
        txtInp_Nama.Text = "";
        txtInp_Username.Text = "";
        txtInp_Email.Text = "";
        txtInp_Password.Text = "";
        txtInp_Alamat.Text = "";
        txtInp_HP.Text = "";
        txtInp_TglLahir.Text = "";
        txtInp_PasswordUlang.Text = "";
        rbJenisKelamin.ClearSelection();

    }


    protected void btnKembaliInputForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Staff.aspx");
    }


    protected void btnSimpanUpdateForm_Click(object sender, EventArgs e)
    {

        if (Path.GetFileName(FileUpload_Update.FileName) == "")
        {
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_Staff_update", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@StaffUsername", txtUpd_Username.Text);
            sqlCmd.Parameters.AddWithValue("@StaffName", txtUpd_Nama.Text);
            sqlCmd.Parameters.AddWithValue("@StaffEmail", txtUpd_Email.Text);
            //  sqlCmd.Parameters.AddWithValue("@StaffPassword", txtUpd_Password.Text);
            sqlCmd.Parameters.AddWithValue("@StaffGender", rbUpd_JenisKelamin.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@StaffBirthDate", Convert.ToDateTime(txtUpd_TglLahir.Text));
            sqlCmd.Parameters.AddWithValue("@StaffAddress", txtUpd_Alamat.Text);
            sqlCmd.Parameters.AddWithValue("@StaffPhoneNumber", txtUpd_HP.Text);
            sqlCmd.Parameters.AddWithValue("@StaffPictureProfile", tampunnggambar);
            sqlCmd.Parameters.AddWithValue("@StaffRole", ddlUpd.SelectedValue);



            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            clearInputForm();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Data berhasil diperbarui');window.location ='Kelola_Staff.aspx';", true);
        }
        else
        {
            FileUpload_Update.SaveAs(Server.MapPath("~/img/img-Staff/") + Path.GetFileName(FileUpload_Update.FileName));
            String link = "/img/img-Staff/" + Path.GetFileName(FileUpload_Update.FileName);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("sp_Staff_update", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@StaffUsername", txtUpd_Username.Text);
            sqlCmd.Parameters.AddWithValue("@StaffName", txtUpd_Nama.Text);
            sqlCmd.Parameters.AddWithValue("@StaffEmail", txtUpd_Email.Text);
            //  sqlCmd.Parameters.AddWithValue("@StaffPassword", txtUpd_Password.Text);
            sqlCmd.Parameters.AddWithValue("@StaffAddress", txtUpd_Alamat.Text);
            sqlCmd.Parameters.AddWithValue("@StaffGender", rbUpd_JenisKelamin.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@StaffBirthDate", Convert.ToDateTime(txtUpd_TglLahir.Text));
            sqlCmd.Parameters.AddWithValue("@StaffPhoneNumber", txtUpd_HP.Text);

            sqlCmd.Parameters.AddWithValue("@StaffPictureProfile", link);


            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            clearInputForm();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Data berhasil diperbarui');window.location ='Kelola_Staff.aspx';", true);
        }


    }


    void clearUpdateForm()
    {
        txtUpd_Nama.Text = "";
        txtUpd_Username.Text = "";
        txtUpd_Email.Text = "";
        // txtUpd_Password.Text = "";
        txtUpd_Alamat.Text = "";
        txtUpd_HP.Text = "";
        txtUpd_TglLahir.Text = "";
        rbJenisKelamin.ClearSelection();
    }


    protected void btnKembaliUpdateForm_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Staff.aspx");
    }

    protected void gvStaff_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FillGrid();
        gvStaff.PageIndex = e.NewPageIndex;
        gvStaff.DataBind();
    }

    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }
    protected void gvStaff_OnSorting(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;
        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
        }
    }

    private void SortGridView(string sortExpression, string direction)
    {
        DataTable dt = FillGrid().Tables[0];

        DataView dv = new DataView(dt);
        dv.Sort = sortExpression + direction;

        gvStaff.DataSource = dv;
        gvStaff.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGridSearch(txtSearch.Text);
    }

    protected void btnLihatSemua_Click(object sender, EventArgs e)
    {
        FillGrid();
    }



    protected void btnDetailView_Click(object sender, EventArgs e)
    {
        divInputForm.Visible = false;
        divUpdateForm.Visible = false;
        divView.Visible = false;
        divDetail.Visible = true;

        LinkButton btn = (LinkButton)(sender);
        string[] commandArgs = btn.CommandArgument.ToString().Split(new char[] { '|' });
        id = commandArgs[0].ToString();
        txtUpd_Username.Text = id;
        sqlCon.Open();
        SqlCommand sqlCmd = new SqlCommand("sp_Staff_view_detail", sqlCon);
        sqlCmd.Parameters.AddWithValue("@StaffUsername", id);
        sqlCmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader = sqlCmd.ExecuteReader();
        reader.Read();

        dtlfoto.Text = "<img src = '" + reader[6].ToString() + "' class='rounded img-thumbnail img-fluid' alt = 'Preview' style=\"width:100%; height: 350px;\" align = 'center' />";
        dtlUsername.Text = reader[0].ToString();
        dtlJabatan.Text = reader[1].ToString();
        dtlNama.Text = reader[2].ToString();
        dtlHeaderNama.Text = reader[2].ToString();
        
        dtlEmail.Text = reader[3].ToString();
        dtlAdress.Text = reader[4].ToString();
        dtlNoHp.Text = reader[5].ToString();
        dtlNoHp.Text = System.Text.RegularExpressions.Regex.Replace(dtlNoHp.Text, ".{4}", "$0-");
        dtlDibuatOleh.Text = reader[7].ToString();
        dtlDibuatTanggal.Text = reader[8].ToString();
        dtlDimodifikasiTanggal.Text = reader[9].ToString();

        if (reader[10].ToString() == "1")
        {
            dtlAktif.Text = "Aktif";
        }
        else
        {
            dtlAktif.Text = "Tidak Aktif";

        }

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

        sqlCon.Close();
    }

    protected void btnKembaliDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kelola_Staff.aspx");
    }

    protected void btnLihatAktif_Click(object sender, EventArgs e)
    {
        FillGridAktif();
    }
}