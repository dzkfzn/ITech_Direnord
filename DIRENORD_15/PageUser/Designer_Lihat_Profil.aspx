<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Designer_Lihat_Profil.aspx.cs" Inherits="PageUser_Designer_Lihat_Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar">
        <!--views/members/profile/show-->
        <!--views/members/profile/show_designer-->
        <div class="fl-profile-designer">
            <div class="fl-profile-designer__cover">
                <img class="img-responsive" src="https://cdn.sribu.com/assets/media/cover/yorraoliviaa/shutterstock_93026242.jpg" alt="Shutterstock 93026242">
            </div>
            <div class="container">
                <div class="fl-profile-designer__header">
                    <div class="row">
                        <div class="col-sm-12 col-md-2">
                            <div class="avatar">
                                <asp:Label ID="lblHtmlGambarProfil" runat="server"></asp:Label>
                            </div>
                            <a class="btn btn-block btn-success" data-toggle="modal" data-target="#modal_change_avatar" href="#">Ubah Foto Profil</a>
                        </div>
                        <div class="col-sm-12 col-md-7">
                            <h1 class="fl-profile-designer__name">
                                <asp:Label ID="lblNama" Text="Nama" runat="server"></asp:Label>
                                <small>
                                    <asp:Label Text="@Username" ID="lblUsername" runat="server"></asp:Label></small></h1>
                            <p class="fl-profile__shortbio">
                                <em>
                                    <asp:Label ID="lblBio" runat="server"></asp:Label></em>
                            </p>
                            <div class="row u-mt--20">
                                <div class="col-xs-4 col-sm-4 col-md-4">
                                    <p class="fl-profile__value-info">Menang Kontes</p>
                                    <h3 class="u-mt--no">
                                        <asp:Label ID="lblMenangKontes" Text="0" runat="server"></asp:Label></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fl-profile-designer__tab">
                    <div class="row">
                        <div class="col-sm-12 u-mt--20">
                            <ul class="nav nav-pills fc-nav u-mb--20" role="tablist">
                                <li class="active" role="presentation"><a href="/id/members/yorraoliviaa?tab=portfolio">Portfolio</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane tab-pane active" id="portfolio" role="tabpanel">
                                    <div class="fl-portfolio-designer">

                                        <div id="portfolios">

                                            <asp:DataList runat="server" ID="dlPortfolio" RepeatColumns="3">
                                                <ItemTemplate>
                                                    <a href="#">
                                                        <div class="fc-entries__thumbnails">
                                                            <asp:Image CssClass="img-responsive" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                        </div>
                                                    </a>
                                                    <p class="fl-show-contest__info">
                                                        <a href="#">
                                                            <asp:Label ID="lblkontes" runat="server" Text='<%# Eval("JudulKontes") %>'></asp:Label></a>
                                                    </p>
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    &nbsp;&nbsp;
                                                    &nbsp;&nbsp;
                                                    &nbsp;&nbsp;
                                                    &nbsp;&nbsp;
                                                    &nbsp;&nbsp;
                                                </SeparatorTemplate>
                                            </asp:DataList>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div aria-hidden="true" class="modal fade" id="modal_change_avatar" role="dialog" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="bMYJN6CEMPJ6mTgP7JP2BBpenkjThjg++Sq81Epwb/sHjhmIriS9Du/ZE0WvuCGejvGpCZoRVXUocDPJboiu2A=="><div class="modal-header">
                        <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h3 class="modal-title"><b>Ubah Foto Profil</b></h3>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="member_id" id="member_id" value="52491b073c0aa17e9b001caa"><div class="form-group">
                            <h3 class="modal-sribu__label-title">Foto Profil</h3>
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURLFoto(this)"></asp:FileUpload>
                            <br />
                            <img id="inifoto" src="#" alt="" width="160" height="240" />

                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <asp:LinkButton ID="btnUbahFotoProfil" CssClass="btn btn-success" Text="Simpan Perubahan" OnClick="btnUbahFotoProfil_Click" runat="server"></asp:LinkButton>
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

