<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pengaturan_Akun.aspx.cs" Inherits="PageStaff_PageSuperAdmin_Pengaturan_Akun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Pengaturan Akun - Super Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="right_col" role="main">
        <div class="">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <div id="divDetail" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3 style="color: black"><b>
                                        <asp:Label runat="server" ID="lblnamaprofil"></asp:Label></b></h3>
                                </div>
                                <br />
                                <br />


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

                                <%-- Kata Sandi --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label1" Text="Kata Sandi" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:LinkButton Text="Ubah Kata Sandi" ID="btnUbahKS" CausesValidation="false" runat="server" OnClick="btnUbahKS_Click" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                                    <br />
                                    <br />
                                    <div id="divKS" runat="server">
                                        <asp:Label ID="Label3" Text="Kata Sandi Lama" runat="server" Font-Bold="true" Font-Size="Large" /><span style="color:red">*</span><asp:RequiredFieldValidator ID="val1" ControlToValidate="txtKataSandiLama" Text="(Harus diisi)"
                                            Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server"
                                                ControlToValidate="kshidden"
                                                Display="Dynamic"
                                                CssClass="ValidationError"
                                                ControlToCompare="txtKataSandiLama"
                                                ErrorMessage="(Kata sandi tidak sesuai)"
                                                ValidationGroup="valgroup"
                                                ToolTip="Password must be the same" />
                                        <asp:TextBox TextMode="Password" ID="txtKataSandiLama" CssClass="form-control" runat="server" placeholder="Isi kata sandi lama anda"></asp:TextBox>
                                        <br />


                                        <asp:Label ID="Label5" Text="Kata Sandi Baru" runat="server" Font-Bold="true" Font-Size="Large" /><span style="color:red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtKataSandiBaru" Text="(Harus diisi)"
                                            Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                        <asp:RegularExpressionValidator ID="valPassword" runat="server"
                                            ControlToValidate="txtKataSandiBaru"
                                            ErrorMessage="(Minimal kata sandi 6 karakter)"
                                            ValidationGroup="valgroup"
                                            ValidationExpression=".{6}.*" />
                                        <asp:TextBox TextMode="Password" ID="txtKataSandiBaru" CssClass="form-control" runat="server" placeholder="Minimal 6 karakter"></asp:TextBox>
                                        <br />


                                        <asp:Label ID="Label6" Text="Ulangi Kata Sandi" runat="server" Font-Bold="true" Font-Size="Large" /><span style="color:red">*</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtKataSandiBaruUlang" Text="(Harus diisi)"
                                            Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                        &nbsp;
                                        <asp:CompareValidator ID="CompareValidator2" runat="server"
                                            ControlToValidate="txtKataSandiBaruUlang"
                                            Display="Dynamic"
                                            CssClass="ValidationError"
                                            ControlToCompare="txtKataSandiBaru"
                                            ErrorMessage="(Kata sandi tidak sesuai)"
                                            ValidationGroup="valgroup"
                                            ToolTip="Password must be the same" />
                                        <asp:TextBox TextMode="Password" ID="txtKataSandiBaruUlang" CssClass="form-control" runat="server" placeholder="Harus sesuai"></asp:TextBox>



                                        <asp:TextBox ID="kshidden" CssClass="form-control" runat="server"></asp:TextBox>


                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                </div>

                                <%-- Foto Profil --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label4" Text="Unggah Foto Profil Baru?" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:FileUpload ID="FileUpload1" accept=".png,.jpg,.jpeg,.gif" runat="server" onchange="readURLFoto(this)"></asp:FileUpload>
                                    <br />
                                    <img id="inifoto" src="#" alt="" width="160" height="250" />
                                    <br />
                                    <br />
                                </div>



                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>
                                <div>
                                    <br />
                                    <asp:LinkButton Text="Simpan Perubahan" ID="btnSimpanPerubahan" ValidationGroup="valgroup" runat="server" OnClick="btnSimpanPerubahan_Click" CssClass="btn btn-success"></asp:LinkButton>&nbsp;
                                    <asp:LinkButton Text="Kembali" ID="btnKembaliDetail" CausesValidation="false" runat="server" OnClick="btnKembaliDetail_Click" CssClass="btn btn-danger"></asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function readURLFoto(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#inifoto').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#filePhoto").change(function () {
            readURL(this);
        });
    </script>
</asp:Content>


