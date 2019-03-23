<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sign_Up.aspx.cs" Inherits="PageUser_Sign_Up" %>


<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Daftar | Direnord</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="Template_Baru/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Play:400,700" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/owl.carousel.css">
    <link rel="stylesheet" href="Template_Baru/css/owl.theme.css">
    <link rel="stylesheet" href="Template_Baru/css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/normalize.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="Template_Baru/css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="Template_Baru/css/calendar/fullcalendar.print.min.css">
    <!-- forms CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/form/all-type-forms.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="Template_Baru/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="Template_Baru/js/vendor/modernizr-2.8.3.min.js"></script>

    <style>
        .fc-footer:before {
            position: absolute;
            background-image: url(/img/bg.png);
            background-size: contain;
            content: "";
            opacity: 0.02;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .panel-body a {
            font-size: 14px;
            color: #f1f1f2;
            margin-top: 15px;
        }



        .fl-register__icon {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>

<body class="">
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="Template_Baru/http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <form id="formDaftar" defaultbutton="btnDaftar" runat="server">

        <div class="color-line"></div>
        <div class="container-fluid">
            <div class="row" style="position: relative">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="back-link back-backend" >

                    </div>

                </div>
            </div>
        </div>
        <br>
        <br>

        <div class="container-fluid fc-footer">
             <div class="row" style="position: relative">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="back-link back-backend" >
                        <a href="index.aspx"  class="btn btn-primary">Kembali ke Halaman Awal</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-md-6 col-sm-6 col-xs-12">

                    <div class="text-center custom-login">
                        <h3>Daftar</h3>

                        <p>Direnord adalah jasa desain online mulai dari jasa desain logo, website, kemasan, dan lainnya. Kami telah membantu 10,200+ klien dan memiliki 128,200+ desainer berkualitas.</p>
                    </div>
                    <div class="hpanel">
                        <div class="row">

                            <%-- <div class="form-group col-sm-6">
                                    <asp:Image CssClass="u-mt--40 u-mb--20 fl-register__icon" ID="Image1" ImageAlign="Left" Height="130" Width="130" runat="server"
                                        ImageUrl="Template_Baru/img/designer.png" />
                                </div>--%>
                            <div class="col-sm-6">
                                <span>
                                    <div class="radio">
                                        <img class="u-mt--40 u-mb--20 fl-register__icon" src="Template_Baru/img/designer.png" width="130" height="130">
                                        <label>
                                            <asp:RadioButton CssClass="i-checks" ID="Design" TextAlign="Right" GroupName="a" runat="server" />
                                            <i></i>Saya seorang desainer
                                        </label>
                                        <asp:Label ID="ValidasiRB" runat="server" Visible="true" ForeColor="Red" Text="(Wajib Memilih salah satu)"></asp:Label>
                                    </div>
                                </span>
                            </div>
                            <div class="col-sm-6">
                                <span>
                                    <div class="radio">
                                        <img class="u-mt--40 u-mb--20 fl-register__icon" src="Template_Baru/img/klien.png" width="130" height="130">
                                        <label>
                                            <asp:RadioButton CssClass="i-checks" ID="Client" TextAlign="Right" GroupName="a" runat="server" />
                                            <i></i>Saya klien yang membutuhkan desain
                                        </label>
                                    </div>
                                </span>
                            </div>
                        </div>

                        <%-- <div class="form-group col-lg-6">

                                    <asp:Image CssClass="u-mt--40 u-mb--20 fl-register__icon" ID="Image2" ImageAlign="Left" Height="130" Width="130" runat="server"
                                        ImageUrl="Template_Baru/img/klien.png" />
                                </div>--%>

                         <div class="row">
                            <div class="form-group col-lg-12">
                                <label>Nama Lengkap</label>
                                <asp:RequiredFieldValidator ValidationGroup="signup" ID="valInp_Nama" ControlToValidate="txtNama" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:TextBox ID="txtNama" CssClass="form-control" placeholder="Nama Lengkap Anda. Contoh: Gordon Bin Abim" runat="server" />
                            </div>
                            <div class="form-group col-lg-12">
                                <label>Email</label>
                                <asp:RequiredFieldValidator ValidationGroup="signup" ID="valInp_Email1" ControlToValidate="txtEmail" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ValidationGroup="signup" ID="valInp_Email2" ControlToValidate="txtEmail" Text="(Format Email Salah)"
                                    Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                <asp:TextBox ID="txtEmail" TextMode="Email" placeholder="Email. Contoh: name@example.com" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group col-lg-6">

                                <label>Kata Sandi</label>

                                <asp:RequiredFieldValidator ValidationGroup="signup" ID="valUpd_Password" ControlToValidate="txtPassword" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Kata Sandi. Minimal 6 karakter." CssClass="form-control" runat="server" />
                                <asp:RegularExpressionValidator ValidationGroup="signup" ID="valPassword" runat="server"
                                    ControlToValidate="txtPassword"
                                    ErrorMessage="(Minimal kata sandi 6 karakter)"
                                    ValidationExpression=".{6}.*" />
                            </div>
                            <div class="form-group col-lg-6">

                                <label>Konfirmasi Kata Sandi</label>

                                <asp:RequiredFieldValidator ValidationGroup="signup" ID="RequiredFieldValidator1" ControlToValidate="txtRePassword" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />

                                <asp:CompareValidator ValidationGroup="signup" ID="CompareValidator1" runat="server"
                                    ControlToValidate="txtRePassword"
                                    CssClass="ValidationError"
                                    ControlToCompare="txtPassword"
                                    ErrorMessage="(Kata sandi harus sesuai)"
                                    ToolTip="Harus Sama" />


                                <asp:TextBox ID="txtRePassword" TextMode="Password" placeholder="Konfirmasi kata sandi anda." CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group col-lg-12">
                                <label>No Telepon</label>
                                <asp:RequiredFieldValidator ValidationGroup="signup" ID="valTelpInp" ControlToValidate="txtTelp" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ValidationGroup="signup" ID="valInp_HP" ControlToValidate="txtTelp" ErrorMessage="(Hanya Angka)"
                                    Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\d+" />
                                <asp:TextBox ID="txtTelp" TextMode="Phone" placeholder="Nomor Telepon. Contoh: 081234123434" MaxLength="13" CssClass="form-control" runat="server" />
                            </div>



                        </div>
                       
                        <small>Dengan melakukan pendaftaran, maka anda setuju dengan syarat & ketentuan dan kode etik direnord.</small>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnDaftar" Text="Daftar" runat="server" CausesValidation="true" ValidationGroup="signup"  OnClick="btnDaftar_Click" CssClass="btn btn-block btn-lg btn-success" />
                        <br />

                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
        </div>
    </form>

    <div class="row">

        <div class="col-md-12 text-center">
            <p>Sudah punya akun? <a href="Sign_in.aspx">Masuk</a> sekarang.</p>
        </div>
    </div>

    </div>

    <!-- jquery
		============================================ -->
    <script src="Template_Baru/js/vendor/jquery-1.11.3.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="Template_Baru/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="Template_Baru/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="Template_Baru/js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="Template_Baru/js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="Template_Baru/js/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="Template_Baru/js/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="Template_Baru/js/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="Template_Baru/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="Template_Baru/js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="Template_Baru/js/metisMenu/metisMenu.min.js"></script>
    <script src="Template_Baru/js/metisMenu/metisMenu-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="Template_Baru/js/tab.js"></script>
    <!-- icheck JS
		============================================ -->
    <script src="Template_Baru/js/icheck/icheck.min.js"></script>
    <script src="Template_Baru/js/icheck/icheck-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="Template_Baru/js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="Template_Baru/js/main.js"></script>
</body>

</html>
