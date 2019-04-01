<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Riwayat_Ujian_Desainer.aspx.cs" Inherits="PageStaff_PageVerifier_Riwayat_Ujian_Desainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Riwayat Ujian Desainer - Verifier
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
   Riwayat Ujian Desainer
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
                                    <h3>Tabel Data Riwayat Ujian Desainer</h3>
                                </div>
                                <br />

                                <div class="title_right">
                                    <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian id ujian, id desainer, tipe desain, tanggal pengajuan, status..." />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click">Cari</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click">Lihat Semua</asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <asp:GridView
                                    ID="gvUjian"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvUjian_OnSorting"
                                    DataKeyNames="ExID"
                                    OnPageIndexChanging="gvUjian_PageIndexChanging" PageSize="5">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:BoundField DataField="ExID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID Ujian" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ExID" />
                                        <asp:BoundField DataField="DesignerID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID Desainer" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="DesignerID" />
                                        <asp:BoundField DataField="ExDesignType" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Tipe Desain" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ExDesignType" />
                                        <asp:BoundField DataField="ExDate" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Tanggal Pengajuan" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ExDate" />
                                        <asp:BoundField DataField="ExStatusVerified" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="Status Verifikasi" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ExStatusVerified" />


                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ToolTip="Lihat Detail" CssClass="btn btn-success" ID="btnVerifikasi" OnClick="btnVerifikasi_Click" runat="server"
                                                    CommandArgument='<%# Eval("ExID")%>'>
                                                    Lihat Detail
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
                                    <h3>Detail Riwayat Ujian Desainer</h3>
                                </div>

                                <div class="form-group col-lg-4">
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                <asp:Label ID="dtlfoto" runat="server"></asp:Label>
                                </div>

                                <%-- ID UJIAN --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label19" Text="ID Ujian" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- ID DESAINER --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label9" Text="ID Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesainerID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- TIPE DESAIN --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label12" Text="Tipe Desain" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlTypeDesign" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESCRIPTION DESIGN --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Deskripsi Desain" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDescription" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- TANGGAL PENGAJUAN --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label23" Text="Tanggal Pengajuan" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDate" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- STATUS VERIFIKASI --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label14" Text="Status" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlStatus" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- ALASAN PENOLAKAN --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label1" Text="Alasan Penolakan" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAlasan" Text="" runat="server" Font-Size="Medium" />
                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>
                                <div>
                                    <br />
                                        <asp:LinkButton ID="btnKembali"  CausesValidation="false" runat="server" OnClick="btnKembali_Click" CssClass="btn btn-warning">
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

