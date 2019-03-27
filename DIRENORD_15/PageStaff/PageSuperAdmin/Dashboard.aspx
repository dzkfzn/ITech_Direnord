<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard - Super Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                    <div class="x_title">
                        <div class="clearfix"></div>
                        <h3><b>Karyawan Direnord</b></h3>
                    </div>
                    <br />
                    <div class="">
                        <div class="row top_tiles">
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users fa-7x"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalKaryawan"></asp:Label>
                                    </div>
                                    <h3>Total Karyawan</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users green"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalKaryawanAktif"></asp:Label>
                                    </div>
                                    <h3>Karyawan Aktif</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users red"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalKaryawanTidakAktif"></asp:Label>
                                    </div>
                                    <h3>Karyawan Tidak Aktif</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-user"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblSuperAdmin"></asp:Label>
                                    </div>
                                    <h3>Total Super Admin</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-user"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblAdmin"></asp:Label>
                                    </div>
                                    <h3>Total Admin </h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-user"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblVerifier"></asp:Label>
                                    </div>
                                    <h3>Total Verifier</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-user"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblManajemen"></asp:Label>
                                    </div>
                                    <h3>Total Manajer</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile ">
                <a href="#">
                    <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                </a>
                <div class="circle-tile-content dark-blue">
                    <div class="circle-tile-description text-faded">Users</div>
                    <div class="circle-tile-number text-faded ">265</div>
                    <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated: #TODAY</a>
                </div>
            </div>
        </div>

        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile ">
                <a href="#">
                    <div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div>
                </a>
                <div class="circle-tile-content red">
                    <div class="circle-tile-description text-faded">Users Online </div>
                    <div class="circle-tile-number text-faded ">10</div>
                    <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated: #TODAY</a>

                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile ">
                <a href="#">
                    <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                </a>
                <div class="circle-tile-content dark-blue">
                    <div class="circle-tile-description text-faded">Users</div>
                    <div class="circle-tile-number text-faded ">265</div>
                    <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated: #TODAY</a>
                </div>
            </div>
        </div>

        <div class="col-lg-2 col-sm-6">
            <div class="circle-tile ">
                <a href="#">
                    <div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div>
                </a>
                <div class="circle-tile-content red">
                    <div class="circle-tile-description text-faded">Users Online </div>
                    <div class="circle-tile-number text-faded ">10</div>
                    <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated: #TODAY</a>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                    <div class="x_title">
                        <div class="clearfix"></div>
                        <h3><b>Pengguna Direnord</b></h3>
                    </div>
                    <br />
                    <div class="">
                        <div class="row top_tiles">
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users blue"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalDesainer"></asp:Label>
                                    </div>
                                    <h3>Total Desainer</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users green"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalDesainerLolos"></asp:Label>
                                    </div>
                                    <h3>Desainer Lolos</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users red"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalDesainerBelumLolos"></asp:Label>
                                    </div>
                                    <h3>Desainer Belum Lolos</h3>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="tile-stats">
                                    <div class="icon"><i class="fa fa-users blue"></i></div>
                                    <div class="count">
                                        <asp:Label runat="server" ID="lblTotalKlien"></asp:Label>
                                    </div>
                                    <h3>Total Klien</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

