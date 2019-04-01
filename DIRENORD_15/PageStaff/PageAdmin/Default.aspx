<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="PageStaff_PageAdmin_Default" %>

<!DOCTYPE html>


    <div class="right_col" role="main">
        <div class="">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <div class="x_title">
                                <div class="clearfix"></div>
                                <h3><b>Bank</b></h3>
                            </div>
                            <br />
                            <div class="">
                                <div class="row top_tiles">
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-bank blue"></i></div>
                                            <div class="count">
                                            </div>
                                            <h3>Total Bank</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-bank green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalBankAktif"></asp:Label>
                                            </div>
                                            <h3>Bank Aktif</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-bank red"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalBankTidakAktif"></asp:Label>
                                            </div>
                                            <h3>Bank Tidak Aktif</h3>
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
                                <h3><b>Industri</b></h3>
                            </div>
                            <br />
                            <div class="">
                                <div class="row top_tiles">
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-industry blue"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalIndustri"></asp:Label>
                                            </div>
                                            <h3>Total Industri</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-industry green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalIndustriAktif"></asp:Label>
                                            </div>
                                            <h3>Industri Aktif</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-industry red"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalIndustriTidakAktif"></asp:Label>
                                            </div>
                                            <h3>Industri Tidak Aktif</h3>
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
                                <h3><b>Paket Kontes</b></h3>
                            </div>
                            <br />
                            <div class="">
                                <div class="row top_tiles">
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-cubes blue"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalPaket"></asp:Label>
                                            </div>
                                            <h3>Total Paket Kontes</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-cubes green"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalPaketAktif"></asp:Label>
                                            </div>
                                            <h3>Paket Aktif</h3>
                                        </div>
                                    </div>
                                    <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="tile-stats">
                                            <div class="icon"><i class="fa fa-cubes red"></i></div>
                                            <div class="count">
                                                <asp:Label runat="server" ID="lblTotalPaketTidakAktif"></asp:Label>
                                            </div>
                                            <h3>Paket Tidak Aktif</h3>
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