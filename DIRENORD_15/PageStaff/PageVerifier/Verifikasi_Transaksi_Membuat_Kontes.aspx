<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Verifikasi_Transaksi_Membuat_Kontes.aspx.cs" Inherits="PageStaff_PageVerifier_Verifikasi_Transaksi_Membuat_Kontes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Verifikasi Kontes
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    Verifikasi Kontes
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

                            <div id="divView" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Tabel Data Verifikasi Order</h3>
                                </div>
                                <br />

                                <div class="title_right">
                                    <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian id ujian, id desainer, tipe desain, tanggal pengajuan..." />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click">Cari</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click">Lihat Semua</asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <asp:GridView
                                    ID="gvOrder"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvOrder_OnSorting"
                                    DataKeyNames="OrderID"
                                    OnPageIndexChanging="gvOrder_PageIndexChanging" PageSize="5">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:BoundField DataField="OrderID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID Ujian" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="OrderID" />
                                        <asp:BoundField DataField="ClientID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID Desainer" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ClientID" />
                                        <asp:BoundField DataField="CategoryName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Tipe Desain" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="CategoryName" />
                                        <asp:BoundField DataField="OrderDate" DataFormatString="{0:dd/MM/yyyy 'at' hh:mm}" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Tanggal Pengajuan" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="OrderDate" />
                                        <asp:BoundField DataField="PackageName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Tipe Paket" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageName" />
                                        <asp:BoundField DataField="ContestTitle" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Judul Kontes" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ContestTitle" />
                                        <asp:BoundField DataField="BankName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Tujuan Bank" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="BankName" />
                                        <asp:BoundField DataField="IndustryName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Industri" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryName" />

                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ToolTip="Lakukan Verifikasi" CssClass="btn btn-success" ID="btnVerifikasi" OnClick="btnVerifikasi_Click" runat="server"
                                                    CommandArgument='<%# Eval("OrderID")%>'>
                                                    Lakukan Verifikasi
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                     <EmptyDataTemplate>
                                        <asp:Image ImageAlign="Middle"  ID="NoDataImage"
                                            ImageUrl="~/img/nodatafound.png"
                                            AlternateText="No Image"
                                            runat="server" />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>

                            <div id="divVerifikasi" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Detail Kontes</h3>
                                </div>



                                <%-- ID ORDER --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label19" Text="ID Order" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- ID CLIENT --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label9" Text="ID Client" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientID" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- Judul Kontes --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label11" Text="Judul Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlJudulKontes" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- TIPE DESAIN --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label12" Text="Tipe Desain" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlTypeDesign" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Order Date --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label3" Text="Order Date" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlOrderDate" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Status --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label6" Text="Status" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlOrderStatus" Text="" runat="server" Font-Size="Medium" />

                                </div>
                                <%-- Paket --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label8" Text="Paket" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlPaket" Text="" runat="server" Font-Size="Medium" />

                                </div>
                                <%-- Industri --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label15" Text="Industri" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlIndustri" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_title">
                                    <h3>Detail Konfirmasi</h3>
                                </div>

                                <div class="form-group col-lg-4">
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                    <asp:Image runat="server" ID="dtlfoto" ImageAlign="Middle" Height="170" Width="235" />
                                </div>

                                <%-- Atas Nama --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Atas Nama" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAtasNama" Text="" runat="server" Font-Size="Medium" />
                                </div>

                                <%-- Norek --%>
                                <%--     <div class="form-group col-lg-4">
                                    <asp:Label ID="Label23" Text="Nomor Rekening" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlNorek" Text="" runat="server" Font-Size="Medium" />
                                </div>--%>

                                <%-- Bank Client --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label14" Text="Bank Client" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlBankClient" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Total Transfer --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label4" Text="Total Transfer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlTotalTransfer" Text="" runat="server" Font-Size="Medium" />

                                </div>
                                <%-- Bank Dituju --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label2" Text="Bank Dituju" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlBankDituju" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>
                                <div>
                                    <br />

                                    <asp:LinkButton ID="btnTerimaVerifikasi" OnClientClick="ConfirmVerifikasi()" CausesValidation="false" runat="server" OnClick="btnTerimaVerifikasi_Click" CssClass="btn btn-success">
                                         Data Benar
                                    </asp:LinkButton>
                                    &nbsp; 
                                    <asp:LinkButton ID="btnTolakVerifikasi" CausesValidation="false" runat="server" OnClientClick="ConfirmVerifikasi()" OnClick="btnTolakVerifikasi_Click" CssClass="btn btn-danger">
                                        Data Salah
                                    </asp:LinkButton>
                                    &nbsp; 
                                        <asp:LinkButton ID="btnKembali" CausesValidation="false" runat="server" OnClick="btnKembali_Click" CssClass="btn btn-warning">
                                        Kembali
                                        </asp:LinkButton>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

