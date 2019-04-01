<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kelola_Paket_Kontes.aspx.cs" Inherits="PageStaff_PageAdmin_Kelola_Paket_Kontes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Kelola Paket Kontes - Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
   Kelola Paket Kontes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="right_col" role="main">
        <div class="">
            <%--<div class="page-title">
                <div class="title_left">
                    <h3>Paket Kontes</h3>
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
                                    <h3>Tabel Data Paket Kontes</h3>
                                </div>
                               

                                <div class="title_right">
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-left top_search">
                                        <asp:LinkButton ID="btnAddView" runat="server" CssClass="btn btn-primary" OnClick="btnAddView_Click">
                                        <span class="fa fa-plus">&nbsp;</span>Tambah Data
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian nama paket..." />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click">Cari</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click">Lihat Semua</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatAktif" OnClick="btnLihatAktif_Click">Lihat Aktif</asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <br />
                                <asp:GridView
                                    ID="gvPaketKontes"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvPaketKontes_OnSorting"
                                    DataKeyNames="PackageID"
                                    OnPageIndexChanging="gvPaketKontes_PageIndexChanging" PageSize="5" >
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:BoundField DataField="PackageID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageID" />
                                        <asp:BoundField DataField="PackageName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA PAKET" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageName" />
                                        <asp:BoundField DataField="PackageDesignerCost" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="BIAYA DESAINER" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageDesignerCost" DataFormatString="Rp. {0:###,###,###.00}" />
                                        <asp:BoundField DataField="PackageAdminCost" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="BIAYA ADMINISTRASI" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageAdminCost" DataFormatString="Rp. {0:###,###,###.00}" />
                                        <asp:BoundField DataField="PackageTotalCost" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="TOTAL BIAYA" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="Center" SortExpression="PackageTotalCost" DataFormatString="Rp. {0:###,###,###.00}" />

                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="STATUS" ItemStyle-HorizontalAlign="Center" SortExpression="BankStatusActive">
                                            <ItemTemplate>

                                                <%--if IsLunch == true image is visible--%>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("PackageActive"))=="Enable"  %>' OnClick="btnDelete_Click" CssClass="btn btn-success" ID="LinkButton1" OnClientClick="ConfirmDisabled()" CommandArgument='<%# Eval("PackageID") %>' runat="server">
                                                    <span></span>Aktif
                                                </asp:LinkButton>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("PackageActive"))=="Disabled"  %>' OnClick="btnDeleteEnable_Click" CssClass="btn btn-danger" ID="LinkButton2" OnClientClick="ConfirmEnabled()" CommandArgument='<%# Eval("PackageID") %>' runat="server">
                                                    <span></span>Nonaktif
                                                </asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ToolTip="Detil Paket" CssClass="btn btn-warning" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("PackageID")%>'>
                                                    <span class="fa fa-info"></span>
                                                </asp:LinkButton>
                                                &nbsp;&nbsp;

                                                <asp:LinkButton ToolTip="Edit" CssClass="btn btn-primary" ID="btnUpdateView" OnClick="btnUpdateView_Click" runat="server"
                                                    CommandArgument='<%# Eval("PackageID")%>'>
                                                    <span class="fa fa-edit"></span>
                                                </asp:LinkButton>
                                                
                                                    <%--<asp:LinkButton CssClass="btn btn-danger" ID="btnDelete" OnClientClick="Confirm()" OnClick="btnDelete_Click" runat="server" CommandArgument='<%# Eval("PackageID") %>'>
                                                    <span class="fa fa-trash">&nbsp;</span>Hapus
                                                    </asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>

                            <div id="divInputForm" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Tambah Data Paket Kontes</h3>
                                </div>
                                <%-- NAMA PAKET KONTES --%>
                                <div class="form-group">
                                    <asp:Label ID="label1" AssociatedControlID="txtInp_NamaPaket"
                                        Text="Nama Paket Kontes" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_NamaPaket" ControlToValidate="txtInp_NamaPaket" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_NamaPaket" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                    <br />
                                </div>

                                <%-- BIAYA DESAINER --%>
                                <div class="form-group">
                                    <asp:Label ID="label2" AssociatedControlID="txtInp_BiayaDesainer"
                                        Text="Biaya Desainer (Rp.)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_BiayaDesainer" ControlToValidate="txtInp_BiayaDesainer" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_BiayaDesainer" CssClass="form-control col-md-7 col-xs-12" runat="server"
                                        onkeypress="return isNumber(event)" onkeyup="javascript:this.value=Comma(this.value);" />
                                </div>

                                <%-- BIAYA ADMINISTRASI --%>
                                <div class="form-group">
                                    <asp:Label ID="label5" AssociatedControlID="txtInp_BiayaAdministrasi"
                                        Text="Biaya Administrasi (Rp.)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtInp_BiayaAdministrasi" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_BiayaAdministrasi" CssClass="form-control col-md-7 col-xs-12" runat="server" onkeypress="return isNumber(event)"
                                        onkeyup="javascript:this.value=Comma(this.value);" />
                                </div>

                                <%--                             TOTAL BIAYA 
                                <div class="form-group">
                                    <asp:Label ID="label7" AssociatedControlID="txtInp_TotalBiaya"
                                        Text="Total Biaya (Rp.)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtInp_TotalBiaya" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_TotalBiaya" CssClass="form-control col-md-7 col-xs-12" runat="server" onkeypress="return isNumber(event)" 
                                        onkeyup = "javascript:this.value=Comma(this.value);"/>
                                </div>--%>

                                <div>
                                    <br />
                                    <asp:LinkButton ID="btnSimpanInputForm" runat="server" OnClick="btnSimpanInputForm_Click" CssClass="btn btn-success">
                                        Simpan
                                    </asp:LinkButton>&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnKembaliInputForm" CausesValidation="false" runat="server" OnClick="btnKembaliInputForm_Click" CssClass="btn btn-danger">
                                         Batal
                                        </asp:LinkButton>
                                </div>
                            </div>


                            <div id="divUpdateForm" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Edit Data Bank</h3>
                                </div>

                                <%-- NAMA PAKET KONTES --%>
                                <div class="form-group">
                                    <asp:Label ID="label3" AssociatedControlID="txtUpd_NamaPaket"
                                        Text="Nama Paket Kontes" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtUpd_NamaPaket" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_NamaPaket" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                    <br />
                                </div>

                                <%-- BIAYA DESAINER --%>
                                <div class="form-group">
                                    <asp:Label ID="label4" AssociatedControlID="txtUpd_BiayaDesainer"
                                        Text="Biaya Desainer (Rp.)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtUpd_BiayaDesainer" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_BiayaDesainer" CssClass="form-control col-md-7 col-xs-12" runat="server"
                                        onkeypress="return isNumber(event)" onkeyup="javascript:this.value=Comma(this.value);" />
                                </div>

                                <%-- BIAYA ADMINISTRASI --%>
                                <div class="form-group">
                                    <asp:Label ID="label6" AssociatedControlID="txtUpd_BiayaAdministrasi"
                                        Text="Biaya Administrasi (Rp.)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtUpd_BiayaAdministrasi" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_BiayaAdministrasi" CssClass="form-control col-md-7 col-xs-12" runat="server" onkeypress="return isNumber(event)"
                                        onkeyup="javascript:this.value=Comma(this.value);" />
                                </div>

                                <%--TOTAL BIAYA 
                                <div class="form-group">
                                    <asp:Label ID="label8" AssociatedControlID="txtUpd_TotalBiaya"
                                        Text="Total Biaya (Rp.)" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtUpd_TotalBiaya" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_TotalBiaya" CssClass="form-control col-md-7 col-xs-12" runat="server" onkeypress="return isNumber(event)"
                                        onkeyup="javascript:this.value=Comma(this.value);" />
                                </div>--%>

                                <div>
                                    <br>

                                    <asp:LinkButton ID="btnSimpanUpdate" runat="server" OnClick="btnSimpanUpdateForm_Click" CssClass="btn btn-success">
                                        Simpan
                                    </asp:LinkButton>&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnKembaliUpdate" CausesValidation="false" runat="server" OnClick="btnKembaliUpdateForm_Click" CssClass="btn btn-danger">
                                        Batal
                                        </asp:LinkButton>
                                </div>
                            </div>


                            <div id="divDetail" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Detil Data Paket Kontes</h3>
                                </div>

                                <%-- PACKAGE ID --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label19" Text="ID Paket Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlPackageID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- NAMA PACKAGE --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label9" Text="Nama Paket Kontes" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlPackageName" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DESIGNER COST --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label12" Text="Biaya Desainer" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlDesignerCost" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- ADMIN COST --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Biaya Admin" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAdminCost" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- TOTAL COST --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label10" Text="Total Biaya" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlTotalCost" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                 <%-- DIBUAT OLEH --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label7" Text="Dibuat Oleh" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlCreatedBy" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DIBUAT TANGGAL --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label23" Text="Dibuat Tanggal" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlCreatedDate" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DIMODIFIKASI OLEH --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label14" Text="Dimodifikasi Oleh" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlModifiedBy" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DIMODIFIKASI TANGGAL --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label18" Text="Dimodifikasi Tanggal" Font-Bold="true" runat="server" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlModifiedDate" Text="" runat="server" Font-Size="Medium" />
                                </div>

                                <%-- Aktif --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label11" Text="Status Aktif" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAktif" Text="" runat="server" Font-Size="Medium" />
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


