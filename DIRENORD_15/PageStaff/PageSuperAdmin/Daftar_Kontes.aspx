<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Daftar_Kontes.aspx.cs" Inherits="PageStaff_PageAdmin_Daftar_Kontes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Daftar Kontes - Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    Kelola Kontes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="right_col" role="main">
        <div class="">

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">

                            <div id="divView" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Tabel Data Daftar Kontes</h3>
                                </div>

                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-secondary" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fa fa-search"></i>&nbsp;Cari</asp:LinkButton>
                                            </span>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                   <i class="fa fa-filter"></i> Filter
                                                </button>
                                                <div class="dropdown-menu">
                                                    <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnKontesSelesai" OnClick="btnKontesSelesai_Click">Kontes Selesai</asp:LinkButton>
                                                    <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnKontesBerjalan" OnClick="btnKontesBerjalan_Click">Kontes Berjalan</asp:LinkButton>
                                                    <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnKontesBelumBerjalan" OnClick="btnKontesBelumBerjalan_Click">Kontes Belum Berjalan</asp:LinkButton>
                                                    <div class="dropdown-divider"></div>
                                                    <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click"><i class="fa fa-eye"></i>&nbsp; Lihat Semua</asp:LinkButton>

                                                </div>
                                            </div>
                                            <span class="input-group-btn"></span>
                                        </div>
                                    </div>
                                </div>




                                <br />
                                <asp:GridView
                                    ID="gvKontes"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvKontes_OnSorting"
                                    DataKeyNames="ContestID"
                                    OnRowDataBound="gvKontes_RowDataBound"
                                    OnPageIndexChanging="gvKontes_PageIndexChanging" PageSize="10">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:TemplateField ItemStyle-ForeColor="White" HeaderText="NO">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-ForeColor="White" DataField="ContestID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ContestID" />
                                        <asp:BoundField ItemStyle-ForeColor="White" DataField="ContestTitle" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="JUDUL KONTES" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ContestTitle" />
                                        <asp:BoundField ItemStyle-ForeColor="White" DataField="ClientID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="KLIEN" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="ClientID" />
                                        <asp:BoundField ItemStyle-ForeColor="White" DataField="PackageName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="PAKET" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageName" />
                                        <asp:BoundField ItemStyle-ForeColor="White" DataField="ContestStatus" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="STATUS" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="ContestStatus" />
                                        <asp:TemplateField ItemStyle-ForeColor="White" HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ToolTip="Detil Kontes" CssClass="btn btn-warning" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("ContestID")%>'>
                                                    <span class="fa fa-info"></span>
                                                </asp:LinkButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Image ImageAlign="Middle" ID="NoDataImage"
                                            ImageUrl="~/img/nodatafound.png"
                                            AlternateText="No Image"
                                            runat="server" />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>


                            <div id="divDetail" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Detil Data Kontes</h3>
                                </div>

                                <%-- CONTEST ID --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label19" Text="ID Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlContestID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- CONTEST TITLE --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label9" Text="Judul Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlContestTitle" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- KLIEN ID --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label1" Text="Klien" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientID" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- KATEGORI --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label12" Text="Kategori" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlCategory" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- PAKET --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label21" Text="Paket" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlPackage" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- INDUSTRI --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label10" Text="Industri" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlIndustry" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER WINNER --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label7" Text="Pemenang Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlWinner" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DURASI KONTES --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label23" Text="Durasi Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlContestDuration" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- KONTES MULAI --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label14" Text="Mulai Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDateVerification" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- STATUS KONTES --%>
                                <div class="form-group col-lg-6">
                                    <asp:Label ID="Label18" Text="Status Kontes" Font-Bold="true" runat="server" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlStatusContest" Text="" runat="server" Font-Size="Medium" />
                                </div>


                                <div class="x_title">
                                    <div class="clearfix"></div>
                                </div>
                                <div>
                                    <asp:LinkButton ID="btnKembaliDetail" CausesValidation="false" runat="server" OnClick="btnKembaliDetail_Click" CssClass="btn btn-danger">
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

