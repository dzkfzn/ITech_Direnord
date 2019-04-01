<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Designer_Pengaturan.aspx.cs" Inherits="PageUser_Designer_Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">

    <style>
        .fc-footer li a {
            color: #8bc34a;
            font-size: 1.5rem;
        }


            .fc-footer li a:hover, .fc-footer li a:focus, .fc-footer li a:active {
                color: #46793f;
                text-decoration: none;
            }

        .fc-nav li a:hover, .fc-nav li a:active, .fc-nav li a:focus {
            background-color: transparent;
            border-bottom: 2px solid #46793f;
        }
    </style>

    <div class="fl-main-page">
        <!--views/works/contests/index-->
        <div class="fl-works">
            <div class="container">
                <h1 class="fc-heading__bright--md">Pengaturan</h1>

                <!--views/works/partials/nav_tabs-->
                <ul class="nav nav-pills fc-nav u-mt--30" role="tablist">
                    <li id="liProfil" runat="server" class="active">
                        <asp:LinkButton
                            runat="server"
                            OnClick="btnProfil_Click"
                            ID="btnProfil">Profil
                        </asp:LinkButton>
                    </li>
                    <li id="liPassword" runat="server">
                        <asp:LinkButton
                            runat="server"
                            OnClick="btnPassword_Click"
                            ID="btnPassword">Kata Sandi
                        </asp:LinkButton>
                    </li>
                </ul>
                <!--views/contests/contests/partials/form_contests_filter-->

                <div id="divProfil" runat="server" visible="true">
                    <div class="fl-setting__content">
                        <div class="row">
                            <div class="col-sm-7">
                                <input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch"><input type="hidden" name="authenticity_token" value="W6OUf3xb+/dX8YpPGBTYJomEWoF4F1QoPfDsSz2f8IrwV2/EX11B5nmIZ60f2q8AyStYl0J0iMWhZ7+BbGfBDw=="><h1 class="fc-heading__default--sm">Profil Publik</h1>
                                <div class="row fl-setting__form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="full_name">Nama Lengkap</label>
                                            <asp:TextBox ID="txtNamaLengkap" runat="server" CssClass="form-control input-lg" placeholder="Nama Lengkap Anda" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="user_name">Username</label>
                                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control input-lg" placeholder="Username Anda" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="bio">Biodata Singkat</label>
                                            <asp:TextBox ID="txtBiodata" runat="server" CssClass="form-control input-lg" placeholder="Ceritakan sedikit tentang diri Anda" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:LinkButton ID="btnSimpanProfil" OnClick="btnSimpanProfil_Click" Text="Simpan Perubahan" CssClass="btn btn-lg btn-success u-mt--20" runat="server"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 visible-md visible-lg text-center">
                                <img alt="Design-Sribu" class="cs-image" src="./Template_User/Exam_First/cs-2-54c1f92d5f056b2de36f3fee10c4fd898e8199a16c91721c1a7843b6d4c6cf4d.png">
                            </div>
                        </div>
                    </div>
                </div>

                <div id="divPassword" runat="server" visible="false">
                    <div class="fl-setting__content">
                        <div class="row">
                            <div class="col-sm-7">
                                <input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch"><input type="hidden" name="authenticity_token" value="7Uidbbw21zecDtJgpDfi0gXibTALHzNh7lsfQeL2X/hGvGbWnzBtJrJ3P4Kj+ZX0RU1vJjF874xyzEyLsw5ufQ=="><h1 class="fc-heading__default--sm">Password</h1>
                                <div class="row fl-setting__form">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="password">Kata Sandi Lama<span style="color: red">*</span></label>
                                            <asp:RequiredFieldValidator ID="val1" ControlToValidate="txtPasswordLama" Text="(Harus diisi)"
                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                ControlToValidate="kshidden"
                                                Display="Dynamic"
                                                CssClass="ValidationError"
                                                ControlToCompare="txtPasswordLama"
                                                ErrorMessage="(Kata sandi tidak sesuai)"
                                                ValidationGroup="valgroup"
                                                ToolTip="Password must be the same" />
                                            <asp:TextBox ID="kshidden" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:TextBox TextMode="Password" ID="txtPasswordLama" runat="server" CssClass="form-control input-lg" placeholder="Kata Sandi Anda sekarang"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="new_password">Kata Sandi Baru<span style="color: red">*</span></label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtPasswordBaru" Text="(Harus diisi)"
                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                            <asp:RegularExpressionValidator ID="valPassword" runat="server"
                                                ControlToValidate="txtPasswordBaru"
                                                ErrorMessage="(Minimal 6 karakter)"
                                                ValidationExpression=".{6}.*"
                                                ValidationGroup="valgroup" />
                                            <asp:TextBox TextMode="Password" ID="txtPasswordBaru" runat="server" CssClass="form-control input-lg" placeholder="Kata Sandi Baru Anda"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="new_password_confirm">Konfirmasi Kata Sandi Baru<span style="color: red">*</span></label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                ControlToValidate="txtKonfirmasiPasswordBaru" Text="(Harus diisi)"
                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroup" />
                                            <asp:CompareValidator ID="CompareValidator2" runat="server"
                                                ControlToValidate="txtKonfirmasiPasswordBaru"
                                                Display="Dynamic"
                                                CssClass="ValidationError"
                                                ControlToCompare="txtPasswordBaru"
                                                ErrorMessage="(Kata sandi tidak sesuai)"
                                                ValidationGroup="valgroup"
                                                ToolTip="Password must be the same" />
                                            <asp:TextBox TextMode="Password" ID="txtKonfirmasiPasswordBaru" runat="server" CssClass="form-control input-lg" placeholder="Ketik ulang password baru Anda"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:LinkButton ID="btnSimpanPassword" OnClick="btnSimpanPassword_Click" ValidationGroup="valgroup" Text="Simpan Perubahan" CssClass="btn btn-lg btn-success u-mt--20" runat="server"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 visible-md visible-lg text-center">
                                <img alt="Design-Sribu" class="cs-image" src="./Template_User/Exam_First/cs-2-54c1f92d5f056b2de36f3fee10c4fd898e8199a16c91721c1a7843b6d4c6cf4d.png">
                            </div>
                        </div>
                    </div>
                </div>


                <div id="divNoRecord" visible="false" runat="server">
                    <div class="row u-mt--30">
                        <div class="col-md-6">
                            <div class="alert alert-success"><strong>No record found</strong></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</asp:Content>

