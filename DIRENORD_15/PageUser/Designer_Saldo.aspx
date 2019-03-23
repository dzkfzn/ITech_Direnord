<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Designer_Saldo.aspx.cs" Inherits="PageUser_Designer_Saldo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar">
        <!--views/members/deposits/index-->
        <div class="fl-deposits">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="fc-heading__bright--md">Saldo</h1>
                        <p class="fc-subheading">Saldo Anda <b><asp:Label ID="lblsaldo" runat="server"></asp:Label> </b> </p>
                    </div>
                    <div class="col-md-12">
                        <div id="deposits">
                            <div class="fl-deposits__table">
                                <table class="table table-bordered table-stripped">
                                    <asp:DataList ID="dltabel" runat="server" RepeatColumns="2">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr class="fl-deposits__table-header">
                                                    <th width="750">Deskripsi</th>
                                                    <th>Jumlah</th>
                                                </tr>
                                            </thead>
                                            <tbody class="fl-deposits__table-body">
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <tr>
                                                <td colspan="1">
                                                    <p><em>Reward Pemenang <%# Eval("ContestTitle") %></em></p>
                                                </td>
                                                <td align="right"><%# Eval("Jumlah", "{0:c}") %>
                                                </td>
                                            </tr>

                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                                        </FooterTemplate>
                                    </asp:DataList>


                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--members/deposits/partials/modal_withdraw-->

    </div>
</asp:Content>

