<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kelola_Bank.aspx.cs" Inherits="PageStaff_PageAdmin_Kelola_Bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Kelola Bank - Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="right_col" role="main">
        <div class="">
            <%--<div class="page-title">
                <div class="title_left">
                    <h3>Bank</h3>
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
                                    <h3>Tabel Data Bank</h3>
                                </div>

                                <div class="title_right">
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group pull-left top_search">
                                        <asp:LinkButton ID="btnAddView" runat="server" CssClass="btn btn-primary" OnClick="btnAddView_Click">
                                        <span class="fa fa-plus">&nbsp;</span>Tambah Data
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtSearch" class="form-control" placeholder="Pencarian Nama Bank, Nomor Rekening.." />
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
                                    ID="gvBank"
                                    runat="server"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-striped table-bordered"
                                    AllowPaging="true"
                                    AllowSorting="true"
                                    OnSorting="gvBank_OnSorting"
                                    DataKeyNames="BankID"
                                    OnPageIndexChanging="gvBank_PageIndexChanging" PageSize="10">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" PageButtonCount="5" Position="Bottom" />
                                    <Columns>
                                        <asp:BoundField DataField="BankID" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="BankID" />
                                        <asp:BoundField DataField="BankName" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="NAMA BANK" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="BankName" />
                                        <asp:BoundField DataField="BankNoRek" ItemStyle-Font-Size="Medium" DataFormatString="" HeaderStyle-Font-Size="Medium" HeaderText="NOMOR REKENING" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="BankNoRek"  />
                                        <asp:BoundField DataField="BankAtasNama" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderText="ATAS NAMA" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="BankAtasNama"  />
                                        <asp:TemplateField HeaderText="IKON" ItemStyle-Font-Size="Medium" HeaderStyle-Font-Size="Medium" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" Height="50" Width="" runat="server"
                                                    ImageUrl='<%# Eval("BankImage") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="STATUS" ItemStyle-HorizontalAlign="Center" SortExpression="BankStatusActive">
                                            <ItemTemplate>

                                                <%--if IsLunch == true image is visible--%>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("BankStatusActive"))=="Enable"  %>' OnClick="btnDelete_Click" CssClass="btn btn-success" ID="LinkButton1" OnClientClick="ConfirmDisabled()" CommandArgument='<%# Eval("BankID") %>' runat="server">
                                                    <span></span>Aktif
                                                </asp:LinkButton>

                                                <asp:LinkButton Visible='<%# Convert.ToString(Eval("BankStatusActive"))=="Disabled"  %>' OnClick="btnDeleteEnable_Click" CssClass="btn btn-danger" ID="LinkButton2" OnClientClick="ConfirmEnabled()" CommandArgument='<%# Eval("BankID") %>' runat="server">
                                                    <span></span>Nonaktif
                                                </asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderText="AKSI" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ToolTip="Detil Bank" CssClass="btn btn-warning" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("BankID")%>'>
                                                    <span class="fa fa-info">&nbsp;</span>
                                                </asp:LinkButton>

                                                <asp:LinkButton ToolTip="Edit" CssClass="btn btn-primary" ID="btnUpdateView" OnClick="btnUpdateView_Click" runat="server"
                                                    CommandArgument='<%# Eval("BankID")%>'>
                                                    <span class="fa fa-edit"></span>
                                                </asp:LinkButton>
                                                
                                                    <%--<asp:LinkButton CssClass="btn btn-danger" ID="btnDelete" OnClientClick="Confirm()" OnClick="btnDelete_Click" runat="server" CommandArgument='<%# Eval("BankID") %>'>
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
                                    <h3>Tambah Data Bank</h3>
                                </div>
                                <%-- NAMA BANK --%>
                                <div class="form-group">
                                    <asp:Label ID="label1" AssociatedControlID="txtInp_NamaBank"
                                        Text="Nama Bank" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_NamaBank" ControlToValidate="txtInp_NamaBank" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_NamaBank" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                    <br />
                                </div>

                                <%-- NO REKENING --%>
                                <div class="form-group">
                                    <asp:Label ID="label2" AssociatedControlID="txtInp_NoRek"
                                        Text="Nomor Rekening" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valInp_NoRek" ControlToValidate="txtInp_NoRek" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_NoRek" CssClass="form-control col-md-7 col-xs-12" MaxLength="25" runat="server" onkeypress="return isNumber(event)" />
                                </div>

                                <%-- ATAS NAMA --%>
                                <div class="form-group">
                                    <asp:Label ID="label7" AssociatedControlID="txtInp_AtasNama"
                                        Text="Atas Nama" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtInp_AtasNama" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtInp_AtasNama" CssClass="form-control col-md-7 col-xs-12" MaxLength="100" runat="server"  />
                                </div>

                                <%-- BANK GAMBAR --%>
                                <div class="form-group">
                                    <asp:Label ID="label5" AssociatedControlID="FileUpload_Input"
                                        Text="Ikon Bank" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FileUpload_Input" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:FileUpload ID="FileUpload_Input" accept=".png,.jpg,.jpeg,.gif" runat="server" onchange="readURL(this)" />
                                    <br />
                                    <img id="blah" src="#" alt="" width="auto" height="100" />
                                    <br />
                                </div>

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
                                <%-- NAMA BANK --%>
                                <div class="form-group">
                                    <asp:Label ID="label3" AssociatedControlID="txtUpd_NamaBank"
                                        Text="Nama Bank" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_NamaBank" ControlToValidate="txtUpd_NamaBank" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_NamaBank" CssClass="form-control col-md-7 col-xs-12" runat="server" />
                                </div>

                                <%-- NO REK --%>
                                <div class="form-group">
                                    <asp:Label ID="label4" AssociatedControlID="txtUpd_NoRek"
                                        Text="Nomor Rekening" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="valUpd_NoRek" ControlToValidate="txtUpd_NoRek" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_NoRek" CssClass="form-control col-md-7 col-xs-12" onkeypress="return isNumber(event)" MaxLength="15" runat="server" />
                                </div>

                                <%-- ATAS NAMA --%>
                                <div class="form-group">
                                    <asp:Label ID="label8" AssociatedControlID="txtUpd_AtasNama"
                                        Text="Nomor Rekening" runat="server" /><span style="color: red" class="glyphicon-asterisk"></span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtUpd_AtasNama" Text="(Harus diisi)"
                                        Display="Dynamic" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUpd_AtasNama" CssClass="form-control col-md-7 col-xs-12" MaxLength="100" runat="server" />
                                </div>

                                <%-- BANK GAMBAR --%>
                                <div class="form-group">
                                    <asp:Label ID="label6" AssociatedControlID="FileUpload_Update"
                                        Text="Ikon Bank" runat="server" />
                                    <asp:FileUpload ID="FileUpload_Update" accept=".png,.jpg,.jpeg,.gif" runat="server" onchange="readURL1(this)" />
                                    <br />
                                    <asp:Label ID="lblPreiewFoto" runat="server"></asp:Label>
                                    <br />
                                </div>

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
                                    <h3>Detil Data Bank</h3>
                                </div>

                                <div class="form-group col-lg-4">
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                <asp:Label ID="dtlfoto" runat="server"></asp:Label>
                                </div>

                                <%-- BANK ID --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label19" Text="ID Bank" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlBankID" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- NAMA BANK --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label9" Text="Nama Bank" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlBankName" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- NOMOR REKENING --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label12" Text="Nomor Rekening" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlNomorRekening" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- ATAS NAMA --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label10" Text="Atas Nama" runat="server" Font-Bold="true" Font-Size="Large" />
                                    <br />
                                    <asp:Label ID="dtlAtasNama" Text="" runat="server" Font-Size="Medium" />

                                </div>

                                <%-- DIBUAT OLEH --%>
                                <div class="form-group col-lg-4">
                                    <asp:Label ID="Label21" Text="Dibuat Oleh" runat="server" Font-Bold="true" Font-Size="Large" />
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

