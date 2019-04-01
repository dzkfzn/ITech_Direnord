<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard - Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    Dashboard Admin
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">



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
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-bank fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Total Bank</div>
                                        <div class="circle-tile-number text-faded ">
                                            
                                                <asp:Label runat="server" ID="lblTotalBank"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated : <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-bank fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Bank Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalBankAktif"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-bank fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Bank Tidak Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalBankTidakAktif"></asp:Label>

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
    <hr />
    
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
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-industry fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Total Industri</div>
                                        <div class="circle-tile-number text-faded ">
                                            
                                                <asp:Label runat="server" ID="lblTotalIndustri"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated : <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-industry fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Industri Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalIndustriAktif"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-industry fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Industri Tidak Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalIndustriTidakAktif"></asp:Label>

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

    <hr />
      
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
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-cubes fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Total Paket Kontes</div>
                                        <div class="circle-tile-number text-faded ">
                                            
                                                <asp:Label runat="server" ID="lblTotalPaket"></asp:Label>


                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated : <script> document.write(new Date().toLocaleDateString()); </script>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-cubes fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Paket Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalPaketAktif"></asp:Label>

                                        </div>
                                        <a class="circle-tile-footer" href="#"><i class="fa fa-calendar"></i> Last Updated: <script> document.write(new Date().toLocaleDateString()); </script></a>
                                    </div>
                                </div>
                            </div>

                            <div class="animated flipInY col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="circle-tile ">
                                    <a href="#">
                                        <div class="circle-tile-heading dark-blue"><i class="fa fa-cubes fa-fw fa-3x"></i></div>
                                    </a>
                                    <div class="circle-tile-content dark-blue">
                                        <div class="circle-tile-description text-faded">Paket Tidak Aktif</div>
                                        <div class="circle-tile-number text-faded ">
                                            <asp:Label runat="server" ID="lblTotalPaketTidakAktif"></asp:Label>

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

