<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kelola_Industri.aspx.cs" Inherits="PageStaff_PageAdmin_Kelola_Industry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Kelola Industri - Admin
</asp:Content>
<asp:Content ID="TitleHeaderCard" ContentPlaceHolderID="TitleHeaderCard" runat="Server">
   Kelola Industri
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
                                    <h3>Tabel Data Industri</h3>
                                </div>
                                
                                <div class="title_right">
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-left top_search">
                                        <asp:LinkButton ID="btnAddView" runat="server" CssClass="btn btn-primary" OnClick="btnAddView_Click">
                                        <span class="fa fa-plus">&nbsp;</span>Tambah Data
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian Nama Industri.." />
                                            <span class="input-group-btn">
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnSearch" OnClick="btnSearch_Click">Cari</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatSemua" OnClick="btnLihatSemua_Click">Lihat Semua</asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-default" runat="server" ID="btnLihatAktif" OnClick="btnLihatAktif_Click">Lihat Aktif</asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <asp:GridView
                                    ID="gvIndustry"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvIndustry_OnSorting"
                                    DataKeyNames="IndustryID"
                                    OnPageIndexChanging="gvIndustry_PageIndexChanging" PageSize="10">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:BoundField DataField="IndustryID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryID" />
                                        <asp:BoundField DataField="IndustryName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA INDUSTRI" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryName" />
                                        <asp:BoundField DataField="IndustryCreatedBy" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="DIBUAT OLEH" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryCreatedBy" />
                                        <asp:BoundField DataField="IndustryCreatedDate" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="DIBUAT TANGGAL" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryCreatedDate" />
                                        <asp:BoundField DataField="IndustryModifiedBy" NullDisplayText="-" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="DIMODIFIKASI OLEH" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryModifiedBy" />
                                        <asp:BoundField DataField="IndustryModifiedDate" NullDisplayText="-" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="DIMODIFIKASI TANGGAL" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryModifiedDate" />
                                        <%--<asp:BoundField DataField="IndustryStatusActive" HeaderText="Status" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryName" />--%>

                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="STATUS" ItemStyle-HorizontalAlign="Center" SortExpression="IndustryStatusActive">
                                            <ItemTemplate >

                                                <%--if IsLunch == true image is visible--%>
                                               
                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("IndustryStatusActive"))=="Enable"  %>' CssClass="btn btn-success" ID="LinkButton1" OnClientClick="ConfirmDisabled()" CommandArgument='<%# Eval("IndustryID") %>' OnClick="btnDelete_Click" runat="server">
                                                    <span></span>Aktif
                                                </asp:LinkButton>

                                                 <asp:LinkButton Visible='<%# Convert.ToString(Eval("IndustryStatusActive"))=="Disabled"  %>' CssClass="btn btn-danger" ID="LinkButton2" OnClientClick="ConfirmEnabled()" CommandArgument='<%# Eval("IndustryID") %>' OnClick="btnDeleteEnable_Click" runat="server">
                                                    <span></span>Nonaktif
                                                </asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--<asp:BoundField DataField="IndustryNoRek" HeaderText="NOMOR REKENING" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="IndustryNoRek" />--%>
                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ToolTip="Edit" CssClass="btn btn-primary" ID="btnUpdateView" OnClick="btnUpdateView_Click" runat="server"
                                                    CommandArgument='<%# Eval("IndustryID")%>'>
                                                    <span class="fa fa-edit"></span>
                                                </asp:LinkButton>
                                                &nbsp;&nbsp;
                                                    <%--<asp:LinkButton CssClass="btn btn-danger" ID="btnDelete" OnClientClick="Confirm()" OnClick="btnDelete_Click" runat="server" CommandArgument='<%# Eval("IndustryID") %>'>
                                                    <span class="fa fa-trash">&nbsp;</span>Hapus
                                                    </asp:LinkButton>--%>
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

                            <div id="divInputForm" runat="server">
                                <div class="x_title">
                                    <div class="clearfix"></div>
                                    <h3>Tambah Data Industri</h3>
                                </div>
                                <%-- NAMA Industry --%>
                                <div class="form-group">
                                    <asp:Label ID="label1" AssociatedControlID="txtInp_NamaIndustry"
                                        Text="Nama Industri" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_NamaIndustry" ControlToValidate="txtInp_NamaIndustry" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_NamaIndustry" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                    <br />
                                </div>

                                <%-- NO REKENING --%>
                                <%-- <div class="form-group">
                                    <asp:Label ID="label2" AssociatedControlID="txtInp_NoRek"
                                        Text="Nomor Rekening" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_NoRek" ControlToValidate="txtInp_NoRek" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_NoRek" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                </div>--%>

                                <div>
                                    
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
                                    <h3>Edit Data Industri</h3>
                                </div>
                                <%-- NAMA Industry --%>
                                <div class="form-group">
                                    <asp:Label ID="label3" AssociatedControlID="txtUpd_NamaIndustry"
                                        Text="Nama Industry" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_NamaIndustry" ControlToValidate="txtUpd_NamaIndustry" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_NamaIndustry" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                </div>

                                <%-- NO REK --%>
                                <%-- <div class="form-group">
                                    <asp:Label ID="label4" AssociatedControlID="txtUpd_NoRek"
                                        Text="Nomor Rekening" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_NoRek" ControlToValidate="txtUpd_NoRek" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_NoRek" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                </div>--%>

                                <div>
                               
                                    <asp:LinkButton ID="btnSimpanUpdate" runat="server" OnClick="btnSimpanUpdateForm_Click" CssClass="btn btn-success">
                                        Simpan
                                    </asp:LinkButton>&nbsp;&nbsp;
                                        <asp:LinkButton ID="btnKembaliUpdate" CausesValidation="false" runat="server" OnClick="btnKembaliUpdateForm_Click" CssClass="btn btn-danger">
                                        Batal
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

