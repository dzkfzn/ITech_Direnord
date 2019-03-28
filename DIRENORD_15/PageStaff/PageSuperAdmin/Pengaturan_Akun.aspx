<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pengaturan_Akun.aspx.cs" Inherits="PageStaff_PageSuperAdmin_Pengaturan_Akun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Pengaturan Akun - Super Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    <asp:Label runat="server" ID="lblnamaprofil"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

        <div class="">
        <div id="divDetail" runat="server">
            <div class="x_title">
                <div class="clearfix"></div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <asp:Label ID="dtlfoto" runat="server"></asp:Label>
                    <div class="polman-adjust4"></div>
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;">Nama Pengguna</label><br>
                                <span id="MainContent_detailNama">
                                    <asp:Label ID="dtlUsername" Text="" runat="server" Font-Size="Medium" />
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailNIM">Nama Lengkap</label><br>
                                <span id="MainContent_detailNIM">
                                    <asp:Label ID="dtlNama" Text="" runat="server" Font-Size="Medium" />

                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailProdi">Jabatan</label><br>
                                <span>
                                    <asp:Label ID="dtlJabatan" Text="" runat="server" Font-Size="Medium" />
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailSemester">Jenis Kelamin</label><br>
                                <span id="MainContent_detailSemester">
                                    <asp:Label ID="dtlGender" Text="" runat="server" Font-Size="Medium" />
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailStatusMahasiswa">Alamat</label><br>
                                <span>
                                    <asp:Label ID="dtlAdress" Text="" runat="server" Font-Size="Medium" />

                                </span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailStatusBeasiswa">Tanggal Lahir</label><br>
                                <span>
                                    <asp:Label ID="dtlBirthdate" Text="" runat="server" Font-Size="Medium" />
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailStatusMahasiswa">Email</label><br>
                                <span>
                                    <asp:Label ID="dtlEmail" Text="" runat="server" Font-Size="Medium" />
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailStatusMahasiswa">Nomor Handphone</label><br>
                                <span>
                                    <asp:Label ID="dtlNoHp" Text="" runat="server" Font-Size="Medium" />

                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label style="font-weight: bold;" for="detailStatusMahasiswa">Kata Sandi</label><br>
                                <span>
                                    <asp:LinkButton Text="Ubah Kata Sandi" ID="btnUbahKS" CausesValidation="false" runat="server" OnClick="btnUbahKS_Click" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div id="divKS" runat="server">
            <div class="card">
                <div class="card-header">
                    Ubah Password dan Profile Image
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-lg-4">
                            <img id="inifoto" src="/img/default_thumb_editpro.jpg" style="width: 100%; height: 350px;" />
                            <label style="font-weight: bold;" for="detailStatusMahasiswa">Ubah Foto Profil</label><br />
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURLFoto(this)"></asp:FileUpload>
                            <div class="polman-adjust4"></div>
                        </div>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label style="font-weight: bold;" for="detailStatusMahasiswa">Kata Sandi Lama</label><span style="color: red">*</span>
                                        <span>
                                            <asp:RequiredFieldValidator ID="val1" ControlToValidate="txtKataSandiLama" Text="(Harus diisi)"
                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" /><asp:CompareValidator ID="CompareValidator1" runat="server"
                                                    ControlToValidate="kshidden"
                                                    Display="Dynamic"
                                                    CssClass="ValidationError"
                                                    ControlToCompare="txtKataSandiLama"
                                                    ErrorMessage="(Kata sandi tidak sesuai)"
                                                    ValidationGroup="valgroup"
                                                    ToolTip="Password must be the same" />
                                            <asp:TextBox TextMode="Password" ID="txtKataSandiLama" CssClass="form-control" runat="server"></asp:TextBox>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="form-group">
                                        <label style="font-weight: bold;" for="detailStatusMahasiswa">Kata Sandi Baru</label><span style="color: red">*</span><br>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtKataSandiBaru" Text="(Harus diisi)"
                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                            <asp:TextBox TextMode="Password" ID="txtKataSandiBaru" CssClass="form-control" runat="server"></asp:TextBox>

                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="form-group">
                                        <label style="font-weight: bold;" for="detailStatusMahasiswa">Konfirmasi Kata Sandi</label><span style="color: red">*</span><br>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtKataSandiBaruUlang" Text="(Harus diisi)"
                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                            <asp:CompareValidator ID="CompareValidator2" runat="server"
                                                ControlToValidate="txtKataSandiBaruUlang"
                                                Display="Dynamic"
                                                CssClass="ValidationError"
                                                ControlToCompare="txtKataSandiBaru"
                                                ErrorMessage="(Kata sandi tidak sesuai)"
                                                ValidationGroup="valgroup"
                                                ToolTip="Password must be the same" />
                                            <asp:TextBox TextMode="Password" ID="txtKataSandiBaruUlang" CssClass="form-control" runat="server"></asp:TextBox>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                      <asp:LinkButton Text="Simpan Perubahan" ID="btnSimpanPerubahan" ValidationGroup="valgroup" runat="server" OnClick="btnSimpanPerubahan_Click" CssClass="btn btn-success"></asp:LinkButton>
            <asp:LinkButton Text="Kembali" ID="btnKembaliDetail" CausesValidation="false" runat="server" OnClick="btnKembaliDetail_Click" CssClass="btn btn-danger"></asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:TextBox ID="kshidden" CssClass="form-control" runat="server"></asp:TextBox>

            <br />
          
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


