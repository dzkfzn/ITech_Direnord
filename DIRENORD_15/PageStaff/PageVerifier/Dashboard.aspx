<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard - Verifier
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    Dashboard Verifier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                    <div class="x_title">
                        <div class="clearfix"></div>
                        <h3><b>Verifikasi Ujian Desainer</b></h3>
                    </div>
                    <br />
                    <div class="">
                        <div class="row top_tiles">
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-spinner fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Belum Diverifikasi</div>
                                        <div class="circle-tile-number text-faded ">

                                            <asp:Label runat="server" ID="lblUjianBelum"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated :
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-certificate fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Terverifikasi</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblUjianUdah"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-check-circle-o fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Ujian Diterima</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblUjianDiterima"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-times-circle-o fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Ujian Ditolak</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblUjianDitolak"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-book fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Total Desainer Ikut Ujian</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalUjian"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
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
    <hr />

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_content">
                    <div class="x_title">
                        <div class="clearfix"></div>
                        <h3><b>Verifikasi Transaksi Order Kontes</b></h3>
                    </div>
                    <br />
                    <div class="">
                        <div class="row top_tiles">
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-spinner fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Belum Diverifikasi</div>
                                        <div class="circle-tile-number text-faded ">

                                            <asp:Label runat="server" ID="lblBelumDiverifikasi"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated :
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-certificate fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Terverifikasi</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblSudahDiverifikasi"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-check-circle-o fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Order Diterima</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTransaksiDiterima"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-times-circle-o fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Order Ditolak</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTransaksiDitolak"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-book fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Total Order Kontes</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalTransaksi"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i>Last Updated:
                                            <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
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


</asp:Content>

