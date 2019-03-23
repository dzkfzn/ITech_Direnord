<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Lihat_Kontes.aspx.cs" Inherits="PageUser_Client_Lihat_Kontes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <style type="text/css">
        .ratingStar {
            font-size: 0pt;
            width: 13px;
            height: 12px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }

        .filledStar {
            background-image: url(image/Filled_Star.png);
        }

        .emptyStar {
            background-image: url(Image/Empty_Star.png);
        }

        .savedStar {
            background-image: url(Image/Saved_Star.png);
        }

        .auto-style1 {
            height: 50px;
        }
    </style>

    <div class="fl-main-page">
        <!--views/works/contests/index-->
        <div class="fl-works">
            <div class="container">
                <h1 class="fc-heading__bright--md">Kontes Saya</h1>
                <p runat="server" id="labelTitle" class="fc-subheading">
                    Daftar kontes yang pernah dibuat.
                </p>
                <!--views/works/partials/nav_tabs-->
                <ul class="nav nav-pills fc-nav u-mt--30" role="tablist">
                    <li id="liSemuaKontes" runat="server" class="active">
                        <asp:LinkButton
                            runat="server"
                            OnClick="btnSemuaKontes_Click"
                            ID="btnSemuaKontes">Semua Kontes
                        </asp:LinkButton>
                    </li>
                    <li id="liKontesBerjalan" runat="server">
                        <asp:LinkButton
                            runat="server"
                            OnClick="btnKontesBerjalan_Click"
                            ID="btnKontesBerjalan">Kontes Berjalan
                        </asp:LinkButton>
                    </li>
                    <li id="liKontesSelesai" runat="server">
                        <asp:LinkButton
                            runat="server"
                            OnClick="btnKontesSelesai_Click"
                            ID="btnKontesSelesai">Kontes Selesai
                        </asp:LinkButton>
                    </li>
                    <li id="liKontesBatal" runat="server">
                        <asp:LinkButton
                            runat="server"
                            OnClick="btnKontesBatal_Click"
                            ID="btnKontesBatal">Kontes Pending
                        </asp:LinkButton>
                    </li>
                </ul>
                <!--views/contests/contests/partials/form_contests_filter-->
                <br />
                <br />
                <div class="col-sm-6 col-md-2">
                    <div class="form-group">
                        <asp:DropDownList name="status" ID="status" runat="server" class="form-control">
                            <asp:ListItem Value="">Semua Kontes</asp:ListItem>
                            <asp:ListItem Value="closed">Closed Contest</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />


                <div id="divSemuaKontes" runat="server" visible="true">
                    <div class="u-mt--50" id="works">
                        <asp:ListView ID="lvSemuaKontes" runat="server" ItemPlaceholderID="PlaceHolder1">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="fl-invoices__wrapperv2 invoice_wrapper" style="margin-bottom: 25px; background-color: #f9fafb">
                                            <div class="row" style="border-bottom: 2px solid #e7ebf0;">
                                            <span class="fl-invoices__numberv2"><%# Eval("ContestTitle") %></span>
                                        </div>
                                            <div class="row">
                                                <div class="col-sm-10 col-md-8">
                                                    <!--views/works/partials/info_contest-->
                                                    <%--<a class="fl-works__title" href="/id/logo-design/contests/gyjjhbk-5c3832cc9d68b11971dadea6"><%# Eval("ContestTitle") %></a>--%>
                                                    <div class="fl-works__details">
                                                        <div class="fl-works__details-contest">
                                                            <div class="fl-works__icon-text">
                                                                <i class="fa fa-user"></i>
                                                                <p>by <a class="fl-works__username" href="#">@<%# Eval("ClientID") %></a></p>
                                                            </div>
                                                            <div class="fl-works__icon-text" data-placement="bottom" data-toggle="tooltip" title="" data-original-title="Kontes dimulai: Date undefined">
                                                                <i class="fa fa-clock-o"></i>
                                                                <p><%# Eval("OrderKonfirmasiStatus") %></p>
                                                            </div>
                                                            <div class="fl-works__icon-text">
                                                                <i class="fa fa-image"></i>
                                                                <p><%# Eval("CountEntries") %> entries</p>
                                                            </div>
                                                            <div class="fl-works__icon-text">
                                                                <i class="fa fa-trophy"></i>
                                                                <p>Rp. <%# Eval("PackageTotalCost", "{0:0,00}") %></p>
                                                            </div>
                                                        </div>
                                                        <div class="fl-works__details-contest">
                                                            <div class="fl-works__icon-text">
                                                                <span class="label fc-label__status--<%# Convert.ToInt16(Eval("ContestStatusActive")) == 0 ? "closed" :null %><%# Convert.ToInt16(Eval("ContestStatusActive")) ==1 ? "open" : null %><%# Convert.ToInt16(Eval("ContestStatusActive")) == 2 ? "default" : null %>">
                                                                    <%# Convert.ToInt16(Eval("ContestStatusActive")) == 0 ? "Not Active" :null %><%# Convert.ToInt16(Eval("ContestStatusActive")) == 1 ? "Active" : null%><%# Convert.ToInt16(Eval("ContestStatusActive")) == 3 ? "Closed" :null %></span>
                                                                <span class="label fc-label__packages--gold"><%# Eval("PackageName") %></span>
                                                                <span class="label fc-label--is-feature"><%# Eval("CategoryName") %></span>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-4">
                                                    <div class="fl-works__title"
                                                        runat="server" visible='<%# Convert.ToInt16(Eval("ContestStatusActive")) == 3 ? true :false%>'>
                                                        Winner:
                                                    </div>
                                                    <div class="fl-works__action" style="margin-top: 10px;">
                                                        <div class="fl-works__details-contest" runat="server" visible='<%# Convert.ToInt16(Eval("ContestStatusActive")) == 3 ? true :false%>'>
                                                            <div class="fl-works__icon-text">
                                                                <i class="fa fa-user"></i>
                                                                <p><a class="fl-works__username">
                                                                     <asp:LinkButton
                                                                OnClick="btnLihatProfileDesigner_Click"
                                                                ID="btnLihatProfileDesigner"
                                                                runat="server"
                                                                CommandArgument='<%# Eval("DesignerWinner") %>'>
                                                            @<%# Eval("DesignerWinner") %>
                                                            </asp:LinkButton>
                                                                    </a></p>
                                                            </div>
                                                            <asp:LinkButton
                                                                OnClick="btnRiwayat_Click"
                                                                ID="btnRiwayat"
                                                                runat="server"
                                                                CssClass="btn btn-block btn-default"
                                                                CommandArgument='<%# Eval("ContestID") %>'>
                                                            Riwayat Kontes
                                                            </asp:LinkButton>

                                                        </div>
                                                        <asp:LinkButton
                                                            OnClick="btnDetailKontes_Click"
                                                            ID="btnDetailKontes"
                                                            runat="server"
                                                            CssClass="btn btn-block btn-default"
                                                            CommandArgument='<%# Eval("ContestID") %>'
                                                            Visible='<%# Convert.ToInt16(Eval("ContestStatusActive")) == 0 ||  Convert.ToInt16(Eval("ContestStatusActive"))==3 ? false : true%>'>
                                                            Lihat Kontes
                                                        </asp:LinkButton>
                                                        <asp:LinkButton
                                                            OnClick="btnDetailTrans_Click"
                                                            ID="btnDetailTrans"
                                                            runat="server"
                                                            Visible='<%# Convert.ToInt16(Eval("ContestStatusActive")) == 0 ? true : false %>'
                                                            CssClass="btn btn-block btn-default"
                                                            CommandArgument='<%# Eval("OrderID") %>'>
                                                            Transaction Detail
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
                <div id="divKontesBerjalan" runat="server" visible="false">
                </div>
                <div id="divKontesSelesai" runat="server" visible="false">
                </div>
                <div id="divKontesBatal" visible="false" runat="server">
                </div>



                <div id="divNoRecord" visible="false" runat="server">
                    <div class="row u-mt--30">
                        <div class="col-md-6">
                            <div class="alert alert-success"><strong>No record found</strong></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

