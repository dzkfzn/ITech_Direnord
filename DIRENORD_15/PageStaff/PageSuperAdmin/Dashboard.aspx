<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard - Super Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    Dashboard Super Admin
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
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Karyawan Direnord</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalKaryawan"></asp:Label>
                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated : <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Karyawan Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalKaryawanAktif"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Karyawan Tidak Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalKaryawanTidakAktif"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                    <div class="x_title">
                        <div class="clearfix"></div>
                        <h3><b>Role Karyawan</b></h3>
                    </div>
                    <br />
                    <div class="">
                        <div class="row top_tiles">

                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Super Admin</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblSuperAdmin"></asp:Label>
                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Admin</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblAdmin"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Verifier</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblVerifier"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Jumlah Manajer</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblManajemen"></asp:Label>
                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                    <div class="x_title">
                        <div class="clearfix"></div>
                        <h3><b>Customer</b></h3>
                    </div>
                    <br />
                    <div class="">
                        <div class="row top_tiles">

                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content red">
                                        <div class="circle-tile-description text-faded">Jumlah Desainer Terdaftar</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalDesainer"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content red">
                                        <div class="circle-tile-description text-faded">Jumlah Klien Terdaftar</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalKlien"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content red">
                                        <div class="circle-tile-description text-faded">Jumlah Desainer Lolos</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalDesainerLolos"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content red">
                                        <div class="circle-tile-description text-faded">Jumlah Desainer Tidak Lolos</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalDesainerBelumLolos"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

