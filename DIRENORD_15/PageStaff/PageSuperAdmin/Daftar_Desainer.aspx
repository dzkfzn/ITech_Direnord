<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Daftar_Desainer.aspx.cs" Inherits="PageStaff_PageSuperAdmin_Daftar_Desainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Daftar Desainer - Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
    Kelola Desainer
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
                                    <h3>Tabel Data Daftar Desainer</h3>
                                </div>


                                <br />
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
                                    ID="gvDesainer"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvDesainer_OnSorting"
                                    DataKeyNames="DesignerID"
                                    OnPageIndexChanging="gvDesainer_PageIndexChanging" PageSize="10">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="NO">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DesignerID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="DesignerID" />
                                        <asp:BoundField DataField="DesignerName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA DESAINER" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="DesignerName" />
                                        <asp:BoundField DataField="DesignerEmail" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="EMAIL" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="DesignerEmail" />
                                        <asp:BoundField DataField="DesignerPhoneNumber" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NO HP" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="DesignerPhoneNumber" />
                                        <asp:BoundField DataField="DesignerStatusExam" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="STATUS UJIAN" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="DesignerStatusExam" />
                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="STATUS AKTIF" ItemStyle-HorizontalAlign="Center" SortExpression="DesignerStatusActive">
                                            <ItemTemplate>

                                                <%--if IsLunch == true image is visible--%>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("DesignerStatusActive"))=="Enable"  %>' OnClick="btnDelete_Click" CssClass="btn btn-success" ID="btnDelete" OnClientClick="ConfirmDisabled()" CommandArgument='<%# Eval("DesignerID") %>' runat="server">
                                                    <span></span>Aktif
                                                </asp:LinkButton>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("DesignerStatusActive"))=="Disabled"  %>' OnClick="btnDeleteEnable_Click" CssClass="btn btn-danger" ID="btnDeleteEnable" OnClientClick="ConfirmEnabled()" CommandArgument='<%# Eval("DesignerID") %>' runat="server">
                                                    <span></span>Nonaktif
                                                </asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ToolTip="Detil Desainer" CssClass="btn btn-warning" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("DesignerID")%>'>
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
                                    <h3>Detil Data Desainer</h3>
                                </div>


                                 <%-- DESIGNER PHOTO --%>
                                <div class="form-group col-lg-4">
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                <asp:Label ID="dtlfoto" runat="server"></asp:Label>
                                </div>

                                <%-- DESIGNER ID --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label19" Text="ID Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER NAME --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label9" Text="Nama Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerName" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- DESIGNER EMAIL --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label1" Text="Email" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerEmail" Text="" runat="server" Font-Size="Medium" />

                                </div>


                                <%-- DESIGNER PHONE NUMBER --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label12" Text="No Handphone" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerPhoneNumber" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER BIODATA --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Biodata" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerBiodata" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER WALLET --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label10" Text="Saldo Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerWallet" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER MENANG KONTES --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label2" Text="Menang Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlMenangKontes" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER STATUS EXAM --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label7" Text="Status Ujian" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlStatusUjian" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER STATUS VERIF --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label23" Text="Status Verifiksi" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlStatusVerif" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER STATUS ACTIVE --%>
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



