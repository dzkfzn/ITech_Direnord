<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard - Verifier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="right_col" role="main">
        <div class="">
            <%--<div class="page-title">
                <div class="title_left">
                    <h3>Industry</h3>
                </div>
            </div>
            <div class="clearfix"></div>--%>

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
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-spinner blue"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblUjianBelum"></asp:Label>
                                            </div>
                                            <h3>Belum Diverifikasi</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-certificate green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblUjianUdah"></asp:Label>
                                            </div>
                                            <h3>Terverifikasi</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-check-circle-o green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblUjianDiterima"></asp:Label>
                                            </div>
                                            <h3>Ujian Diterima</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-times-circle-o red"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblUjianDitolak"></asp:Label>
                                            </div>
                                            <h3>Ujian Ditolak</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-book black"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalUjian"></asp:Label>
                                            </div>
                                            <h3>Total Desainer Ikut Ujian</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                <h3><b>Verifikasi Transaksi Order Kontes</b></h3>
                            </div>
                            <br />
                            <div class="">
                                <div class="row top_tiles">
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-spinner blue"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblBelumDiverifikasi"></asp:Label>
                                            </div>
                                            <h3>Belum Diverifikasi</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-certificate green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblSudahDiverifikasi"></asp:Label>
                                            </div>
                                            <h3>Terverifikasi</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-check-circle-o green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTransaksiDiterima"></asp:Label>
                                            </div>
                                            <h3>Order Diterima</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-times-circle-o red"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTransaksiDitolak"></asp:Label>
                                            </div>
                                            <h3>Order Ditolak</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-book black"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalTransaksi"></asp:Label>
                                            </div>
                                            <h3>Total Order Kontes</h3>
                                        </div>
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

