<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Daftar_Klien.aspx.cs" Inherits="PageStaff_PageSuperAdmin_Daftar_Klien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Daftar Klien - Admin
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
                                    <h3>Tabel Data Daftar Klien</h3>
                                </div>


                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-secondary" runat="server" ID="btnSearch" OnClick="btnSearch_Click"><i class="fa fa-search"></i>&nbsp;Cari</asp:LinkButton>
                                            </span>

                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-primary" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click"><i class="fa fa-eye"></i>&nbsp; Lihat Semua</asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <asp:GridView
                                    ID="gvKlien"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvKlien_OnSorting"
                                    DataKeyNames="ClientID"
                                    OnPageIndexChanging="gvKlien_PageIndexChanging" PageSize="10">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="NO">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ClientID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ClientID" />
                                        <asp:BoundField DataField="ClientName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA KLIEN" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="ClientName" />
                                        <asp:BoundField DataField="ClientEmail" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="EMAIL" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="ClientEmail" />
                                        <asp:BoundField DataField="ClientPhoneNumber" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NO HP" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="ClientPhoneNumber" />

                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="STATUS AKTIF" ItemStyle-HorizontalAlign="Center" SortExpression="ClientStatusActive">
                                            <ItemTemplate>

                                                <%--if IsLunch == true image is visible--%>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("ClientStatusActive"))=="Enable"  %>' OnClick="btnDelete_Click" CssClass="btn btn-success" ID="btnDelete" OnClientClick="ConfirmDisabled()" CommandArgument='<%# Eval("ClientID") %>' runat="server">
                                                    <span></span>Aktif
                                                </asp:LinkButton>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("ClientStatusActive"))=="Disabled"  %>' OnClick="btnDeleteEnable_Click" CssClass="btn btn-danger" ID="btnDeleteEnable" OnClientClick="ConfirmEnabled()" CommandArgument='<%# Eval("ClientID") %>' runat="server">
                                                    <span></span>Nonaktif
                                                </asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ToolTip="Detil Kontes" CssClass="btn btn-warning" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("ClientID")%>'>
                                                    <span class="fa fa-info"></span>
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


                            <div id="divDetail" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Detil Data Klien</h3>
                                </div>


                                <%-- Client PHOTO --%>
                                <div class="form-group col-lg-4">
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                <asp:Label ID="dtlfoto" runat="server"></asp:Label>
                                </div>

                                <%-- Client ID --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label19" Text="ID Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Client NAME --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label9" Text="Nama Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientName" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- Client EMAIL --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label1" Text="Email" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientEmail" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- Client PHONE NUMBER --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label12" Text="No Handphone" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientPhoneNumber" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Client BIODATA --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Biodata" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlClientBiodata" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Client Kontes yang Pernah Dibuat --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label2" Text="Kontes Yang Pernah Dibuat" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlKontesbuat" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- Client STATUS VERIF --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label23" Text="Status Verifiksi" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlStatusVerif" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- Client STATUS ACTIVE --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label14" Text="Status Aktif" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlStatusAktif" Text="" runat="server" Font-Size="Medium" />

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


