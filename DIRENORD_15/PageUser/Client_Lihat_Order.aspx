<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Lihat_Order.aspx.cs" Inherits="PageUser_Client_Lihat_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">

    <div class="fl-main-page">
        <!--views/orders/orders/index-->
        <div class="fl-invoices">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="fc-heading__bright--md">Invoice</h1>
                    </div>
                </div>
                <div id="orders">
                    <div class="row fl-invoices__content">
                        <div class="col-sm-12">

                            <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="PlaceHolder1">
                                <ItemTemplate>
                                    <div class="fl-invoices__wrapperv2 invoice_wrapper" style="margin-bottom: 25px;">
                                        <div class="row" style="border-bottom: 2px solid #e7ebf0;">
                                            <span class="fl-invoices__numberv2"><%# Eval("OrderID") %></span>
                                            <span class="fl-invoices__infov2 hidden-xs hidden-sm"><%# Eval("OrderDate" , "{0:f}") %></span>
                                            <span class="fl-invoices__infov2 visible-xs">11 Jan 2019</span>
                                        </div>
                                        <div class="row" style="padding-bottom: 10px; padding-top: 10px;">
                                            <b>Durasi Kontes: </b><span style="margin-left: 7px;"><%# Eval("ContestDuration") %>  days</span><br>
                                            <b class="hidden-xs hidden-sm">Status :</b>
                                            <span class="label fc-label--is-<%# Convert.ToInt32(Eval("OrderVerif")) == 0 ? "danger" : null %><%# Convert.ToInt32(Eval("OrderVerif")) == 1 ? "success" : null %><%# Convert.ToInt32(Eval("OrderVerif")) == 2 ? "success" : null %>" style="margin-left: 7px;"><%# Eval("OrderVerifStatus") %></span>
                                            <span class="fl-invoices__info"></span><b class="hidden-xs hidden-sm">Total pembayaran: </b>
                                            <b style="margin-left: 7px;">Rp. <%# Eval("PackageTotalCost", "{0:0,00}") %></i></b>
                                        </div>
                                        <div class="row">
                                            <b class="hidden-xs hidden-sm">Metode Pembayaran: </b>
                                            <span style="margin-left: 7px;">
                                                <strong><%# Eval("BankName") %> </strong>

                                            </span>
                                            <span
                                                class="label fc-label--is-<%# Convert.ToInt32(Eval("OrderStatusKonfirmasi")) == 0 ? "danger" : null %><%# Convert.ToInt32(Eval("OrderStatusKonfirmasi")) == -1 ? "default" : null %><%# Convert.ToInt32(Eval("OrderStatusKonfirmasi")) == 1 ? "warning" : null %><%# Convert.ToInt32(Eval("OrderStatusKonfirmasi")) == 2 ? "success" : null %>  u-ml--5">
                                                <%# Eval("OrderKonfirmasiStatus") %>

                                            </span>

                                        </div>
                                        <div class="box">
                                            <div class="box_head" style="padding: 10px 0 10px 0;">
                                                <span class="fl-invoices__title"></span>
                                                <div class="col-lg-9 col-md-9 col-xs-9" style="padding-left: 0px; display: inline-flex;"><b class="hidden-xs hidden-sm" style="padding-left: 10px;">Nama kontes: </b><span style="padding-left: 14px;"><%# Eval("ContestTitle") %></span></div>
                                                <span aria-hidden="true" class="action_toggle_hidden_1 fa fa-angle-down"></span><span aria-hidden="true" class="action_toggle_hidden_2 hidden fa fa-angle-up"></span><span class="action_toggle_hidden"></span>
                                                <div class="box_body">
                                                    <table class="table table-responsive" style="margin-top: 20px; border: 0px;">
                                                        <tbody>
                                                            <tr class="fl-payment__invoice-item border_b">
                                                                <td><b>Pembayaran Desainer</b></td>
                                                                <td class="float_right"><span>Rp. <%# Eval("PackageDesignerCost", "{0:0,00}") %></span></td>
                                                            </tr>
                                                            <tr class="fl-payment__invoice-item border_b">
                                                                <td><b>Biaya Transaksi</b></td>
                                                                <td class="float_right"><span>Rp. <%# Eval("PackageAdminCost", "{0:0,00}") %></span></td>
                                                            </tr>
                                                            <tr class="fl-payment__invoice-header">
                                                                <td><b>Total (Nett)</b></td>
                                                                <td class="float_right"><span>Rp. <%# Eval("PackageTotalCost", "{0:0,00}") %></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fl-invoices__action" runat="server">
                                            <asp:LinkButton
                                                OnClick="btnDetailOrder_Click"
                                                ID="btnDetailOrder"
                                                runat="server"
                                                CssClass="btn btn-default btn-success make-payment"
                                                CommandArgument='<%# Eval("OrderID") %>'
                                                Visible='<%# Convert.ToInt16(Eval("OrderStatusKonfirmasi")) >= 1 ? false  : true %>'>Lakukan Pembayaran
                                            </asp:LinkButton>
                                            <%--<a class="btn btn-default fl-payment__btn-download" target="_blank" href="/id/orders/proforma_invoices/5c3832cc9d68b11971dadeab.pdf?h=e80feb5321e3a697d01c86e1">Download Proforma Invoice</a>--%>
                                        </div>
                                    </div>

                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <div class="row u-mt--30">
                                        <div class="col-md-6">
                                            <div class="alert alert-success"><strong>No record found</strong></div>
                                        </div>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

