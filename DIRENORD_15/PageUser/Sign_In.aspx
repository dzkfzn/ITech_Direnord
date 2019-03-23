<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sign_In.aspx.cs" Inherits="PageUser_Sign_In" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login | Direnord</title>
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
    </style>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="Template_Baru/http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

    <div class="color-line"></div>
    <div class="container-fluid">
        
    </div>
    <div class="container-fluid fc-footer ">
         <div class="row" style="position: relative">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="back-link back-backend" >
                        <a href="index.aspx"  class="btn btn-primary">Kembali ke Halaman Awal</a>
                    </div>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-md-4 col-md-4 col-sm-4 col-xs-12">
                <div class="text-center m-b-md custom-login">
                    <h1 class="fc-heading__bright--md">Masuk Direnord</h1>
                </div>

                <div class="alert alert-warning u-mb--15" style="padding: 5px 15px;"><span>Mohon perhatian! Untuk Login Direnord hanya bisa menggunakan email.</span></div>
                <div class="hpanel">
                    <div class="panel-body">
                        <form defaultbutton="btnMasuk" action="#" id="loginForm" runat="server">
                            <div class="form-group">
                                <label class="control-label" for="username">Email</label>
                                <asp:RequiredFieldValidator ID="valInp_Email1" ControlToValidate="txtEmail" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ID="valInp_Email2" ControlToValidate="txtEmail" Text="(Format Email Salah)"
                                    Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email Anda" />

                            </div>
                            <br />

                            <div class="form-group">
                                <label class="control-label" for="password">Kata Sandi</label>
                                <asp:RequiredFieldValidator ID="valUpd_Password" ControlToValidate="txtPassword" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:TextBox TextMode="Password" ID="txtPassword" CssClass="form-control" runat="server" placeholder="Kata Sandi Anda" />

                            </div>
                            <span class="pull-right fl-login__forgot"><a href="/id/reset_password/new">Lupa kata sandi?</a></span>
                            <br />



                            <asp:LinkButton ID="btnMasuk" Text="Masuk" runat="server" OnClick="btnMasuk_Click" CssClass="btn btn-block btn-lg btn-success" />


                        </form>
                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <p class="fl-login__signup">Belum memiliki akun? Silakan <a href="Sign_Up.aspx">daftar</a>, Gratis!</p>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
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
