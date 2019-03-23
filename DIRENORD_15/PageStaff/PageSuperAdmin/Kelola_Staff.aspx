<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kelola_Staff.aspx.cs" Inherits="PageStaff_PageSuperAdmin_Kelola_Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Kelola Staff - Super Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="right_col" role="main">
        <div class="">
            <%--<div class="page-title">
                <div class="title_left">
                    <h3>Staff</h3>
                </div>
            </div>
            <div class="clearfix"></div>--%>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">

                            <div id="divView" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Tabel Data Staff</h3>
                                </div>
                                <br />

                                <div class="title_right">
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-left top_search">
                                        <asp:LinkButton ID="btnAddView" runat="server" CssClass="btn btn-primary" OnClick="btnAddView_Click">
                                        <span class="fa fa-plus">&nbsp;</span>Tambah Data
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-secondary" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fa fa-search"></i>&nbsp;Cari</asp:LinkButton>
                                            </span>

                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-primary" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click"><i class="fa fa-eye"></i>&nbsp; Lihat Semua</asp:LinkButton>
                                            </span>
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="btnLihatAktif" OnClick="btnLihatAktif_Click">Lihat Aktif</asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <asp:GridView
                                    ID="gvStaff"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvStaff_OnSorting"
                                    DataKeyNames="StaffUsername"
                                    OnPageIndexChanging="gvStaff_PageIndexChanging" PageSize="10">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>


                                        <asp:TemplateField HeaderText="NO">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="StaffName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="StaffName" />
                                        <asp:BoundField DataField="StaffUsername" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA PENGGUNA" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="StaffUsername" />
                                        <asp:BoundField DataField="RoleName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="JABATAN" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="RoleName" />

                                        <asp:BoundField DataField="StaffPhoneNumber" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NO HP" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="StaffPhoneNumber" />
                                        <asp:BoundField DataField="StaffEmail" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="EMAIL" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="StaffEmail" />

                                        <asp:TemplateField HeaderText="STATUS" HeaderStyle-Font-Size="Medium" ItemStyle-HorizontalAlign="Center" SortExpression="StaffStatusActive">
                                            <ItemTemplate>

                                                <%--if IsLunch == true image is visible--%>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("StaffStatusActive"))=="Enable"  %>' OnClick="btnDelete_Click" CssClass="btn btn-success" ID="LinkButton1" OnClientClick="ConfirmDisabled()" CommandArgument='<%# Eval("StaffUsername") %>' runat="server">
                                                    <span></span>Aktif
                                                </asp:LinkButton>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("StaffStatusActive"))=="Disabled"  %>' OnClick="btnDeleteEnable_Click" CssClass="btn btn-danger" ID="LinkButton2" OnClientClick="ConfirmEnabled()" CommandArgument='<%# Eval("StaffUsername") %>' runat="server">
                                                    <span></span>Nonaktif
                                                </asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AKSI" HeaderStyle-Font-Size="Medium" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton CssClass="btn btn-warning" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("StaffUsername")%>'>
                                                    <span class="fa fa-info">&nbsp;</span>
                                                </asp:LinkButton>

                                                <asp:LinkButton CssClass="btn btn-primary" ID="btnUpdateView" OnClick="btnUpdateView_Click" runat="server"
                                                    CommandArgument='<%# Eval("StaffUsername")%>'>
                                                    <span class="fa fa-edit"></span>
                                                </asp:LinkButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Image ImageAlign="Middle" ID="NoDataImage"
                                            ImageUrl="~/img/nodatafound.png"
                                            AlternateText="No Image"
                                            runat="server" />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>

                            <div id="divInputForm" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Tambah Data Staff</h3>
                                </div>
                                <%-- NAMA --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblInp_Nama" AssociatedControlID="txtInp_Nama"
                                        Text="Nama" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_Nama" ControlToValidate="txtInp_Nama" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="(Harus alphabet)"
                                        ControlToValidate="txtInp_Nama" ValidationExpression="^^[a-zA-Z ]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtInp_Nama" CssClass="form-control" onkeypress="return alphaOnly(event)" MaxLength="30" runat="server" placeholder="Isi nama lengkap" />
                                </div>


                                <%-- Email --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblInp_Email" AssociatedControlID="txtInp_Email"
                                        Text="Email" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_Email1" ControlToValidate="txtInp_Email" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="valInp_Email2" ControlToValidate="txtInp_Email" Text="(Format Email Salah)"
                                        Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox ID="txtInp_Email" TextMode="Email" CssClass="form-control" runat="server" placeholder="Isi email sesuai format. Contoh : example@gmail.com" />
                                </div>

                                <%-- USERNAME --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblInp_Username" AssociatedControlID="txtInp_Username"
                                        Text="Nama Pengguna" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_Username1" ControlToValidate="txtInp_Username" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="valInp_Username2" ControlToValidate="txtInp_Username" Text="(Tidak boleh menggunakan spasi dan minimal 5 karakter)"
                                        Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_]{5,255}$" />
                                    <asp:TextBox ID="txtInp_Username" CssClass="form-control" runat="server" placeholder="Isi nama pengguna tanpa spasi. Contoh : example20" MaxLength="15" />
                                </div>

                                <%-- PASSWORD --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblInp_Password" AssociatedControlID="txtInp_Password"
                                        Text="Kata Sandi" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_Password" ControlToValidate="txtInp_Password" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="valPassword" runat="server"
                                        ControlToValidate="txtInp_Password"
                                        ErrorMessage="(Minimal kata sandi 6 karakter)"
                                        ValidationExpression=".{6}.*" />
                                    <asp:TextBox ID="txtInp_Password" TextMode="Password" CssClass="form-control" runat="server" placeholder="Minimal kata sandi 6 karakter" />
                                </div>


                                <%-- NO HP --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblInp_HP" AssociatedControlID="txtInp_HP"
                                        Text="No HP" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valTelpInp" ControlToValidate="txtInp_HP" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="valInp_HP" ControlToValidate="txtInp_HP" ErrorMessage="(Hanya Angka)"
                                        Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\d+" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="txtInp_HP"
                                        ErrorMessage="(Minimal 10 karakter)"
                                        ValidationExpression=".{10}.*" />
                                    <asp:TextBox ID="txtInp_HP" TextMode="Phone" MaxLength="13" CssClass="form-control" onkeypress="return isNumber(event)" runat="server" placeholder="Isi no handphone " />
                                </div>

                                <%-- PASSWORD ULANG --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label2" AssociatedControlID="txtInp_PasswordUlang"
                                        Text="Ulangi Kata Sandi" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtInp_PasswordUlang" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" /><asp:CompareValidator ID="CompareValidator1" runat="server"
                                            ControlToValidate="txtInp_PasswordUlang"
                                            CssClass="ValidationError"
                                            ControlToCompare="txtInp_Password"
                                            ErrorMessage="(Kata sandi harus sesuai)"
                                            ToolTip="Password must be the same" />
                                    <asp:TextBox ID="txtInp_PasswordUlang" TextMode="Password" CssClass="form-control" runat="server" placeholder="Harus sesuai kata sandi" />

                                </div>

                                <%-- Role --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="label10" AssociatedControlID="txtUpd_Nama"
                                        Text="Pilih Jabatan" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ddlInp" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:DropDownList ID="ddlInp" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                </div>

                                <%-- TANGGAL --%>

                                <div class="form-group col-lg-6">
                                    <asp:Label ID="label4" AssociatedControlID="txtInp_TglLahir"
                                        Text="Tanggal Lahir" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtInp_TglLahir" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <div class="input-group date" id="myDatepicker2">
                                        <asp:TextBox ID="txtInp_TglLahir" CssClass="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>

                                <%-- Jenis Kelamin --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label3" AssociatedControlID="rbJenisKelamin"
                                        Text="Jenis Kelamin" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="rbJenisKelamin" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RadioButtonList ID="rbJenisKelamin" runat="server">
                                        <asp:ListItem Text=" Laki-Laki" Value="1" />
                                        <asp:ListItem Text=" Perempuan" Value="0" />
                                    </asp:RadioButtonList>
                                </div>



                                <%-- Alamat --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblInp_Alamat" AssociatedControlID="txtInp_Alamat"
                                        Text="Alamat" runat="server" />
                                    <asp:TextBox ID="txtInp_Alamat" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Isi alamat lengkap" />
                                </div>

                                <%-- Staff GAMBAR --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="label5" AssociatedControlID="FileUpload_Input"
                                        Text="Pass Foto (MAX 2 MB)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FileUpload_Input" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <br />
                                    <asp:FileUpload ID="FileUpload_Input" accept=".png,.jpg,.jpeg,.gif" CssClass="form-control" runat="server" onchange="readURL(this)" />
                                    <br />
                                    <img id="blah" src="#" alt="" width="auto" height="100" />
                                    <br />

                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>

                                <div>
                                    <br>


                                    <asp:LinkButton ID="btnSimpanInputForm" runat="server" OnClick="btnSimpanInputForm_Click" CssClass="btn btn-success">
                                        Simpan
                                    </asp:LinkButton>&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnKembaliInputForm" CausesValidation="false" runat="server" OnClick="btnKembaliInputForm_Click" CssClass="btn btn-danger">
                                         Batal
                                        </asp:LinkButton>
                                </div>
                            </div>


                            <div id="divUpdateForm" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Edit Data Staff</h3>
                                </div>

                                <%-- USERNAME --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblUpd_Username" AssociatedControlID="txtUpd_Username"
                                        Text="Nama Pengguna" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_Username" ControlToValidate="txtUpd_Username" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_Username" ReadOnly="true" CssClass="form-control" runat="server" />
                                </div>

                                <%-- NAMA --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblUpd_Nama" AssociatedControlID="txtUpd_Nama"
                                        Text="Nama" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_Nama" ControlToValidate="txtUpd_Nama" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="(Harus alphabet)" Display="Dynamic"
                                        ControlToValidate="txtUpd_Nama" ValidationExpression="^[a-zA-Z ]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtUpd_Nama" CssClass="form-control" onkeypress="return alphaOnly(event)" MaxLength="30" runat="server" placeholder="Isi nama lengkap" />
                                </div>

                                <%-- Email --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblUpd_Email" AssociatedControlID="txtUpd_Email"
                                        Text="Email" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_Email1" ControlToValidate="txtUpd_Email" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="valUpd_Email2" ControlToValidate="txtUpd_Email" Text="(Format Email Salah)"
                                        Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox ID="txtUpd_Email" CssClass="form-control" runat="server" placeholder="Isi email sesuai format. Contoh : example@gmail.com" />
                                </div>

                                <%-- PASSWORD --%>
                                <%--<div class="form-group">
                                    <asp:Label ID="lblUpd_Password" AssociatedControlID="txtUpd_Password"
                                        Text="Kata Sandi" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_Password" ControlToValidate="txtUpd_Password" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_Password" TextMode="Password" CssClass="form-control" runat="server" />
                                </div>--%>

                                <%-- NO HP --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblUpd_HP" AssociatedControlID="txtUpd_HP"
                                        Text="No HP" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_HP1" ControlToValidate="txtUpd_HP" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="valUpd_HP2" ControlToValidate="txtUpd_HP" ErrorMessage="(Hanya Angka)"
                                        Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\d+" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                        ControlToValidate="txtUpd_HP"
                                        ErrorMessage="(Minimal 10 karakter)"
                                        ValidationExpression=".{10}.*" />
                                    <asp:TextBox ID="txtUpd_HP" TextMode="Phone" MaxLength="13" CssClass="form-control" onkeypress="return isNumber(event)" runat="server" placeholder="Isi no handphone " />
                                </div>


                                <%-- Role --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="label1" AssociatedControlID="txtUpd_Nama"
                                        Text="Jabatan" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlUpd" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:DropDownList ID="ddlUpd" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                </div>

                                <%-- TANGGAL --%>

                                <div class="form-group col-lg-6">
                                    <asp:Label ID="label7" AssociatedControlID="txtUpd_TglLahir"
                                        Text="Tanggal Lahir" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtUpd_TglLahir" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <div class='input-group date' id='myDatepicker3'>
                                        <asp:TextBox ID="txtUpd_TglLahir" CssClass="form-control" runat="server" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>

                                <%-- Jenis Kelamin --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label8" AssociatedControlID="rbUpd_JenisKelamin"
                                        Text="Jenis Kelamin" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="rbUpd_JenisKelamin" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:RadioButtonList ID="rbUpd_JenisKelamin" runat="server">
                                        <asp:ListItem Text=" Laki-Laki" Value="1" />
                                        <asp:ListItem Text=" Perempuan" Value="0" />
                                    </asp:RadioButtonList>
                                </div>


                                <%-- Alamat --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="lblUpd_Alamat" AssociatedControlID="txtUpd_Alamat"
                                        Text="Alamat" runat="server" />
                                    <asp:TextBox ID="txtUpd_Alamat" TextMode="MultiLine" CssClass="form-control" runat="server" />
                                </div>

                                <%-- Staff GAMBAR --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="label6" AssociatedControlID="FileUpload_Update"
                                        Text="Pass Foto (Maks. 2 MB)" runat="server" />
                                    <br />
                                    <asp:Label ID="lblPreiewFoto" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:FileUpload ID="FileUpload_Update" accept=".png,.jpg,.jpeg,.gif" runat="server" onchange="readURL1(this)" />
                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>

                                <div>
                                    <br>

                                    <asp:LinkButton ID="btnSimpanUpdate" runat="server" OnClick="btnSimpanUpdateForm_Click" CssClass="btn btn-success">
                                        Simpan
                                    </asp:LinkButton>&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnKembaliUpdate" CausesValidation="false" runat="server" OnClick="btnKembaliUpdateForm_Click" CssClass="btn btn-danger">
                                        Batal
                                        </asp:LinkButton>
                                </div>
                            </div>


                            <div id="divDetail" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Detil Data Staff</h3>
                                </div>

                                <div class="form-group col-lg-4">
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                <asp:Label ID="dtlfoto" runat="server"></asp:Label>
                                </div>

                                <%-- USERNAME --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label19" Text="Nama Pengguna" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlUsername" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- NAMA --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label9" Text="Nama Lengkap" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />

                                    <asp:Label ID="dtlNama" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Jabatan --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label12" Text="Jabatan" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlJabatan" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Gender --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Jenis Kelamin" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlGender" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Birthdate --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label23" Text="Tanggal Lahir" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlBirthdate" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Email --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label14" Text="Email" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlEmail" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Phone Number --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label18" Text="Nomor Handphone" Font-Bold="true" runat="server" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlNoHp" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Address --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label16" Text="Alamat" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAdress" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Aktif --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label11" Text="Status Aktif" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAktif" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- Dibuat Oleh --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label25" Text="Dibuat Oleh" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDibuatOleh" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Dibuat Tanggal --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label27" Text="Dibuat Tanggal" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDibuatTanggal" Text="" runat="server" Font-Size="Medium" />
                                </div>

                                <%-- Dimodifikasi Tanggal --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label29" Text="Dimodifikasi Tanggal" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDimodifikasiTanggal" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>
                                <div>
                                    <asp:LinkButton ID="btnKembaliDetail" CausesValidation="false" runat="server" OnClick="btnKembaliDetail_Click" CssClass="btn btn-danger">
                                        Kembali
                                    </asp:LinkButton>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

