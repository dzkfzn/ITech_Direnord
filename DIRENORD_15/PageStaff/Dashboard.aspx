<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="PageStaff_Dashboard" %>

<html class="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="Website Sistem Informasi Akademik Politeknik Manufaktur Astra. Silahkan gunakan NIM dan password Anda untuk login.">
    <meta name="keywords" content="SIA,Sistem,Polman Astra,PMA,Akademik,SSO">
    <meta name="author" content="Politeknik Manufaktur Astra">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />

    <title>
        <asp:ContentPlaceHolder ID="title" runat="server">
        </asp:ContentPlaceHolder>
    </title>
    <link rel="shortcut icon" href="https://sia.polman.astra.ac.id/favicon.png">
    <link href="./Dashboard_files/bootstrap.min.css" rel="stylesheet">
    <link href="./Dashboard_files/jquery.fancybox.css" rel="stylesheet">
    <link href="./Dashboard_files/bootstrap-select.min.css" rel="stylesheet">
    <link href="./Dashboard_files/Style.css" rel="stylesheet">


    <script src="./Dashboard_files/tether.min.js.download"></script>
    <script src="./Dashboard_files/jquery-3.1.1.min.js.download"></script>
    <script src="./Dashboard_files/jquery-ui-1.12.1.min.js.download"></script>
    <script src="./Dashboard_files/bootstrap.min.js.download"></script>
    <script src="./Dashboard_files/highcharts.js.download"></script>
    <script src="./Dashboard_files/highcharts-more.js.download"></script>
    <script src="./Dashboard_files/solid-gauge.js.download"></script>
    <script src="./Dashboard_files/exporting.js.download"></script>
    <script src="./Dashboard_files/tinymce.min.js.download"></script>
    <script src="./Dashboard_files/jquery.fancybox.pack.js.download"></script>
    <script src="./Dashboard_files/bootstrap-select.min.js.download"></script>
    <script src="./Dashboard_files/LetterAvatar.js.download"></script>

    <script src="./Dashboard_files/jquery.floatThead.js.download"></script>
    <style>
        .mce-branding-powered-by {
            display: none;
        }

        table {
            border-top: none;
            border-bottom: none;
            background-color: #FFF;
        }

        .table-striped tbody tr:nth-of-type(2n+1) {
            background-color: #FFF;
        }

        .table-striped tbody tr:nth-of-type(2n), thead {
            background-color: #ECECEC;
        }

        .table-striped tbody tr.pagination-ys {
            background-color: #FFF;
        }

        .highcharts-credits {
            display: none;
            height: 0px;
        }

        .loaderPMB {
            position: absolute;
            left: 50%;
            top: 25%;
            z-index: 1;
            border: 10px solid #f3f3f3; /* Light grey */
            border-top: 10px solid #3498db; /* Blue */
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>
    <style type="text/css">
        .fancybox-margin {
            margin-right: 7px;
        }
    </style>
    <style type="text/css">
        .fancybox-margin {
            margin-right: 7px;
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
    </style>
</head>
<body class="scrollstyle2">
    <form method="post" action="#"  id="form1" enctype="multipart/form-data">

        <script src="./Dashboard_files/WebResource.axd" type="text/javascript"></script>


        <script src="./Dashboard_files/ScriptResource.axd" type="text/javascript"></script>
        <script src="./Dashboard_files/ScriptResource(1).axd" type="text/javascript"></script>
        <script src="./Dashboard_files/ScriptResource(2).axd" type="text/javascript"></script>

        <div class="fc-footer">
            <div class="polman-nav-static-top">
                <div class="float-left polman-adjust4">
                    <a href="#">
                        <img src="./Login_Staff_files/logo_baru2.png" style="height: 50px; margin-top: -15px;"></a>
                </div>

                <div class="polman-menu">
                    <nav class="nav justify-content-end" style="padding-top: 5px;">
                        <b id="username1" style="position: absolute;">
                            <asp:Label ID="lblName" runat="server" Text="#NAMA (#ROLE)"></asp:Label>
                        </b>
                        <span id="lastlogin" style="font-size: 11px; margin-top: -2px; width: 500px; text-align: right;">
                            <br>
                            <br>
                            <asp:Label ID="lblLastLogin" runat="server" Text=""></asp:Label></span>
                    </nav>
                </div>
                <div class="polman-menu-bar">
                    <div class="float-right">
                        <div class="fa fa-bars fa-2x" style="margin-top: 9px; cursor: pointer;" aria-hidden="true" data-toggle="collapse" data-target="#menu" aria-expanded="false" aria-controls="menu"></div>
                    </div>
                </div>
                <div class="polman-notifikasi" onclick="redirectNotifikasi();">
                    <div class="float-right">
                        <div class="fa fa-envelope fa-2x" style="margin-top: 8px; margin-right: 15px; cursor: pointer;" aria-hidden="true"></div>
                        <span class="badge badge-pill badge-info polman-badge">0</span>
                    </div>
                </div>

            </div>


            <div class="polman-nav-static-right collapse scrollstyle2 polman-adjust5" id="menu" style="margin-left: 0px;">
                <div id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="list-group">
                        <a class="list-group-item list-group-item-action polman-username" style="border-radius: 0px; border: none; background-color: #EEE;">Hai,&nbsp;<b id="username2">#NamaUser (#Role)</b></a>
                        <a href="#" class="list-group-item list-group-item-action"
                            style="border-radius: 0px; border: none; padding-left: 23px;"><i class="fa fa-sign-out fa-lg fa-pull-left"></i>Logout
                        </a>


                        <%--Start of menu SUPER ADMIN--%>
                        <div id="menu_superadmin" runat="server">
                            <a href="../PageSuperAdmin/Dashboard.aspx" class="list-group-item list-group-item-action polman-menu-active" style="border-radius: 0px; border: none; padding-left: 22px; display: inherit;"><i class="fa fa-home fa-lg fa-pull-left"></i>Dashboard </a>
                            <a href="../PageSuperAdmin/Pengaturan_Akun.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;">Profil Anda </a>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Kelola SDM</a>
                                <div>
                                    <a href="../PageSuperAdmin/Kelola_Staff.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Karyawan</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Kelola Customer</a>
                                <div>
                                    <a href="Daftar_Desainer.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Desainer</a>
                                    <a href="Daftar_Klien.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Client</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Kelola Kontes</a>
                                <div>
                                    <a href="Daftar_Kontes.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Kontes Berjalan</a>
                                    <%--<a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Kontes Selesai</a>--%>
                                </div>
                            </div>
                        </div>
                        <%--End of Menu SUPER ADMIN--%>


                        <%--Start of menu  ADMIN--%>
                        <div id="menu_admin" runat="server">
                            <a href="#" class="list-group-item list-group-item-action polman-menu-active" style="border-radius: 0px; border: none; padding-left: 22px; display: inherit;"><i class="fa fa-home fa-lg fa-pull-left"></i>Dashboard </a>
                            <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;">Profil Anda </a>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Kelola SDM</a>
                                <div>
                                    <a href="../PageAdmin/Dashboard.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Karyawan</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Kelola Customer</a>
                                <div>
                                    <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Desainer</a>
                                    <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Client</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Kelola Kontes</a>
                                <div>
                                    <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Kontes Berjalan</a>
                                    <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Kontes Selesai</a>
                                </div>
                            </div>
                        </div>
                        <%--End of Menu  ADMIN--%>


                        <%--Start of menu VERIFIER--%>
                        <div id="menu_verifier" runat="server">
                            <a href="#" class="list-group-item list-group-item-action polman-menu-active" style="border-radius: 0px; border: none; padding-left: 22px; display: inherit;"><i class="fa fa-home fa-lg fa-pull-left"></i>Dashboard </a>
                            <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;">Profil Anda </a>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Verifikasi</a>
                                <div>
                                    <a href="../PageVerifier/Verifikasi_Ujian_Desainer.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Ujian Desainer</a>
                                    <a href="../PageVerifier/Verifikasi_Transaksi_Membuat_Kontes.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Pembayaran Kontes</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Riwayat</a>
                                <div>
                                    <a href="../PageVerifier/Riwayat_Ujian_Desainer.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Ujian Desainer</a>
                                </div>
                            </div>

                        </div>
                        <%--End of Menu VERIFIER--%>

                        <%--Start of menu MANAGER--%>
                        <div id="menu_manager" runat="server">
                            <a href="#" class="list-group-item list-group-item-action polman-menu-active" style="border-radius: 0px; border: none; padding-left: 22px; display: inherit;"><i class="fa fa-home fa-lg fa-pull-left"></i>Dashboard </a>
                            <a href="#" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;">Profil Anda </a>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Laporan Pembelian</a>
                                <div>
                                    <a href="../PageManager/Laporan_Kontes_Kategori.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Berdasarkan Kategori</a>
                                    <a href="../PageManager/Laporan_Kontes_Paket.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Berdasarkan Paket</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Laporan Finance</a>
                                <div>
                                    <a href="../PageManager/Laporan_Order.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Order</a>
                                    <a href="../PageManager/Laporan_Profit.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Keuntungan</a>
                                </div>
                            </div>
                            <div>
                                <a href="#" role="tab" class="list-group-item list-group-item-action collapsed" style="border-radius: 0px; border: none;"><i class="fa fa-chevron-down fa-lg fa-pull-left"></i>Laporan Customer</a>
                                <div>
                                    <a href="../PageManager/Laporan_User_Daftar.aspx" class="list-group-item list-group-item-action " style="border-radius: 0px; border: none; padding-left: 47px; display: inherit;"><b>–&nbsp;&nbsp;</b>Peningkatan Customer</a>
                                </div>
                            </div>
                        </div>
                        <%--End of Menu MANAGER--%>
                    </div>
                </div>
            </div>
            <div id="allcontent" class="polman-adjust5" style="margin-left: 0px;">
                <ol class="breadcrumb polman-breadcrumb">
                    <li class="breadcrumb-item"><a href="#" data-toggle="tooltip">Direnord Staff</a></li>
                    <li class="breadcrumb-item">Dashboard</li>
                </ol>
                <hr>

                <div class="scrollstyle" style="overflow-x: auto;">
                    <ul id="MainContent_tabDashboard" class="nav nav-tabs">
                        <li id="MainContent_linkAkademik" class="nav-item">
                            <a id="tabAkademik" class="nav-link active disabled" href="javascript:__doPostBack('ctl00$MainContent$tabAkademik','')">Operasional Akademik</a>
                        </li>
                    </ul>
                </div>
                <br>
                <div id="MainContent_OperasionalAkademikMahasiswa_updatePanel1">

                    <div id="MainContent_OperasionalAkademikMahasiswa_dashboardPerformaMahasiswa" class="card">
                        <div class="card-header">
                            <span id="MainContent_OperasionalAkademikMahasiswa_lblDashboardPerformaMahasiswa" style="font-weight: bold;">Dashboard Mahasiswa - Kamis, 21 Maret 2019 | 16.02</span>
                        </div>
                        <div class="card-block">
                            <asp:ContentPlaceHolder ID="body" runat="server">

                            </asp:ContentPlaceHolder>
                          <%--  <h4>Indeks Prestasi</h4>
                            <div class="row">
                                <div class="col-lg-7">
                                    <div id="chartNilai" data-highcharts-chart="0"></div>
                                </div>
                                <div class="col-md-5">
                                    <br>

                                    <br>
                                    <br>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <style>
                    .card {
                        margin-bottom: 20px;
                    }
                </style>

            </div>
        </div>

        <script type="text/javascript">var kuisoner = false;</script>
        <script type="text/javascript">var data = []</script>

    </form>




    <div data-tether-id="1" style="top: 0px; left: 0px; position: absolute;"></div>
</body>
</html>
