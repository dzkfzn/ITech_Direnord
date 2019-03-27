<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pengaturan_Akun.aspx.cs" Inherits="PageStaff_PageManager_Pengaturan_Akun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Pengaturan Akun - Manager
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="">
        <div id="divDetail" runat="server">
            <div class="x_title">
                <div class="clearfix"></div>
                <h3>
                    <asp:Label runat="server" ID="lblnamaprofil"></asp:Label></h3>
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
                                <label style="font-weight: bold;" for="detailJalurMasuk">Jalur Masuk</label><br>
                                <span id="MainContent_detailJalurMasuk">Reguler</span>
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
                                <label style="font-weight: bold;" for="detailStatusMahasiswa">Alamat</label><br>
                                <span>
                                    <asp:Label ID="dtlAdress" Text="" runat="server" Font-Size="Medium" />

                                </span>
                            </div>
                        </div>
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

        <div id="divKS" runat="server">
            <asp:Label ID="Label3" Text="Kata Sandi Lama" runat="server" Font-Bold="true" Font-Size="Large" /><span style="color: red">*</span><asp:RequiredFieldValidator ID="val1" ControlToValidate="txtKataSandiLama" Text="(Harus diisi)"
                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server"
                    ControlToValidate="kshidden"
                    Display="Dynamic"
                    CssClass="ValidationError"
                    ControlToCompare="txtKataSandiLama"
                    ErrorMessage="(Kata sandi tidak sesuai)"
                    ValidationGroup="valgroup"
                    ToolTip="Password must be the same" />
            <asp:TextBox TextMode="Password" ID="txtKataSandiLama" CssClass="form-control" runat="server"></asp:TextBox>
            <br />


            <asp:Label ID="Label5" Text="Kata Sandi Baru" runat="server" Font-Bold="true" Font-Size="Large" /><span style="color: red">*</span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtKataSandiBaru" Text="(Harus diisi)"
                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
            <asp:TextBox TextMode="Password" ID="txtKataSandiBaru" CssClass="form-control" runat="server"></asp:TextBox>
            <br />


            <asp:Label ID="Label6" Text="Ulangi Kata Sandi" runat="server" Font-Bold="true" Font-Size="Large" /><span style="color: red">*</span>
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
            <asp:TextBox TextMode="Password" ID="txtKataSandiBaruUlang" CssClass="form-control" runat="server"></asp:TextBox>



            <asp:TextBox ID="kshidden" CssClass="form-control" runat="server"></asp:TextBox>


             <%-- Foto Profil --%>
                    <div class="form-group col-lg-4">
                        <asp:Label ID="Label4" Text="Unggah Foto Profil Baru?" runat="server" Font-Bold="true" Font-Size="Large" />
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURLFoto(this)"></asp:FileUpload>
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

