<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Staff.aspx.cs" Inherits="PageStaff_Login_Staff" %>


<!DOCTYPE html>
<html class="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>Halaman Login
    </title>
    <link href="./Login_Staff_files/bootstrap.min.css" rel="stylesheet">
    <link href="./Login_Staff_files/font-awesome.min.css" rel="stylesheet">
    <link href="./Login_Staff_files/jquery.fancybox.css" rel="stylesheet">
    <link href="./Login_Staff_files/bootstrap-select.min.css" rel="stylesheet">
    <link href="./Login_Staff_files/Style.css" rel="stylesheet">
    <script src="./Login_Staff_files/tether.min.js.download"></script>
    <script src="./Login_Staff_files/jquery-3.1.1.min.js.download"></script>
    <script src="./Login_Staff_files/jquery-ui-1.12.1.min.js.download"></script>
    <script src="./Login_Staff_files/bootstrap.min.js.download"></script>
    <script src="./Login_Staff_files/tinymce.min.js.download"></script>
    <script src="./Login_Staff_files/jquery.fancybox.pack.js.download"></script>
    <script src="./Login_Staff_files/bootstrap-select.min.js.download"></script>
       <link rel="shortcut icon" href="/Dashboard_files/logo_kecil.png">

    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        $(function () {
            $('[rel="tooltip"]').tooltip()
        })

        $(function () {
            $('[data-toggle="popover"]').popover()
        })

        function redirectNotifikasi() {
            window.location.href = 'Page_Notifikasi.aspx';
        }

        function sentValidation(input) {
            $(input).addClass('disabled');
            $(input).text('Mohon tunggu..');
        }

        function pageLoad(sender, args) {
            $('.selectpicker').selectpicker();
        }

        function showModalKey() {
            $('#changeModal').modal({ backdrop: 'static', keyboard: false });
        }
    </script>
    <style>
    .mce-branding-powered-by {
        display: none;
    }

  </style>
    <style type="text/css">
    .fancybox-margin {
        margin-right: 0px;
    }

    .polman-nav-static-top {
        top: 0;
        left: 0;
        right: 0;
        position: fixed;
        height: 70px;
        width: 100% !important;
        padding: 10px 20px 10px 20px;
        box-shadow: 0px 2px 0px 0px #3d8437;
        background-color: white;
        z-index: 4;
    }

    .block {
        width: 100%;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .fc-footer:before {
        position: absolute;
        background-image: url(/img/bg.png);
        background-size: contain;
        content: "";
        opacity: 0.09;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    .polman-nav-static-top {
        top: 0;
        left: 0;
        right: 0;
        position: fixed;
        height: 70px;
        width: 100% !important;
        padding: 10px 20px 10px 20px;
        box-shadow: 0px 2px 0px 0px #18580f;
        background-color: white;
        z-index: 4;
    }

  </style>


</head>

<body>
    <form defaultbutton="btnMasuk" runat="server">

        <script src="./Login_Staff_files/WebResource.axd" type="text/javascript"></script>


        <script src="./Login_Staff_files/ScriptResource.axd" type="text/javascript"></script>
        <script src="./Login_Staff_files/ScriptResource(1).axd" type="text/javascript"></script>
        <script src="./Login_Staff_files/ScriptResource(2).axd" type="text/javascript"></script>

        <div class="fc-footer">
            <div class="polman-nav-static-top" style="        opacity: 0.9;">
                <div class="float-left">
                    <a href="#">
                        <img src="./Login_Staff_files/logo_baru2.png" style="        height: 50px;">
                    </a>
                </div>
            </div>

            <meta http-equiv="refresh" content="3600">
            <div class="polman-form-login">
                <h4>Login</h4>
                <hr>

                <div class="form-group">
                    <label for="txtUsername">Username <span style="        color: red;">*</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtInp_Username" Text="(Harus diisi)"
                        Display="Dynamic" runat="server" ForeColor="Red" />
                    <asp:TextBox ID="txtInp_Username" CssClass="form-control" runat="server" placeholder="Username" />
                </div>
                <div class="form-group">
                    <label for="txtPassword">Kata Sandi <span style="        color: red;">*</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtInp_Password" Text="(Harus diisi)"
                        Display="Dynamic" runat="server" ForeColor="Red" />
                    <asp:TextBox TextMode="Password" ID="txtInp_Password" CssClass="form-control" runat="server" placeholder="Password" />
                </div>
                <div class="form-group">
                </div>
                <asp:LinkButton ID="btnMasuk" runat="server" OnClick="btnMasuk_Click" CssClass="btn btn-primary block">
                             Masuk
                </asp:LinkButton>
            </div>



            <div class="polman-nav-static-bottom">
                Copyright © 2019 - Direnord
            </div>

        </div>


    </form>


</body>
</html>
