<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Detail_ContestSelesai.aspx.cs" Inherits="PageUser_Client_Detail_ContestSelesai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar">
        <!--views/contests/contest/show-->
        <div class="fl-show-contest">
            <div class="container">
                <div class="row">
                    <!--views/contests/contests/partials/detail-->
                    <div class="col-sm-12">
                        
                        <h1 class="fl-show-contest__title">
                            <asp:Label ID="lbljudulkontes" runat="server"></asp:Label></h1>
                        <div class="pull-right">
                        </div>
                        <ol class="breadcrumb">
                            <li><span>1. Kontes Berlangsung</span></li>
                            <li><span>2. Pemilihan Pemenang</span></li>
                            <li><span>3. Transfer File dan Revisi</span></li>
                            <li class="active"><span>4. Kontes Berakhir</span></li>
                        </ol>
                         <div class="pull-right">
                            <a class="btn btn-success btn-lg" href="Client_Lihat_Kontes.aspx">Selesai</a>
                        </div>
                    </div>

                    <div class="col-sm-12 col-lg-9">

                        <div class="fl-show-contest__icon-text">
                            <i class="fa fa-user u-mr--5"></i>
                            <p>
                                by <a href="/id/members/pavindoma">
                                    <asp:Label ID="lblusername" runat="server"></asp:Label></a>
                            </p>
                        </div>

                        <div class="fl-show-contest__icon-text">
                            <div class="fl-show-contest__icon-text" data-placement="bottom" data-toggle="tooltip" title="" data-original-title="">
                                <i class="fa fa-clock-o u-mr--5"></i>
                                <p>
                                    Berakhir pada tanggal
                                    <asp:Label ID="lbltglberakhir" runat="server"></asp:Label>
                                </p>
                            </div>
                        </div>
                        <div class="fl-show-contest__icon-text">
                            <i class="fa fa-image u-mr--5"></i>
                            <p>
                                <asp:Label ID="lbljumlahentri" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="fl-show-contest__icon-text">
                            <i class="fa fa-trophy u-mr--5"></i>
                            <p>
                                <asp:Label ID="lblhadiahpemenang" runat="server"></asp:Label>
                            </p>
                        </div>
                    </div>


                    <div class="col-sm-12">
                        <div class="fl-show-contest__icon-text u-mt--10">
                            <span class="label fc-label--is-default">
                                <asp:Label ID="lblnamapaket" runat="server"></asp:Label></span>
                            <span class="label fc-label--is-default">
                                <asp:Label ID="lblkategori" runat="server"></asp:Label></span>
                            <span class="label fc-label--is-default">
                                <asp:Label ID="lblindsutri" runat="server"></asp:Label></span>

                        </div>
                    </div>
                    <div class="col-sm-12">
                        <ul class="nav nav-pills fc-nav u-mt--20" role="tablist">
                            <li id="liDesain" runat="server" class="active">
                                <asp:LinkButton
                                    runat="server"
                                    OnClick="btnDesain_Click"
                                    ID="btnDesain"
                                    Text="Desain">
                                </asp:LinkButton>
                            </li>
                            <li id="liBrief" runat="server">
                                <asp:LinkButton
                                    runat="server"
                                    OnClick="btnBrief_Click"
                                    Text="Brief"
                                    ID="btnBrief">
                                </asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content u-mt--30">
                    <!--views/contests/partials/tab_designs-->
                    <div class="fl-show-contest__tab-designs tab-pane active" id="designs" role="tabpanel">
                        <!--views/contests/partials/form_entries_filter-->

                        <div runat="server" id="divDesain" style="position: relative">
                            <div id="entries">
                                <!--views/contests/partials/entries-->
                                <div id="entries1">
                                    <!--views/contests/partials/entries-->
                                    <h1>Pemenang</h1>

                                    <asp:GridView ID="dlgambardesain" runat="server" Visible="false" AutoGenerateColumns="false" EmptyDataText="No files available">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <p class="fl-show-contest__info ">
                                                        <div style="position: relative">
                                                            <asp:Label ID="lblFilePath" runat="server" Text='<%#  Eval("ImagePath") %>' Visible="false"></asp:Label>
                                                        </div>
                                                    </p>
                                                    <a href="#">
                                                        <div class="fc-entries__thumbnails">
                                                            <asp:Image CssClass="img-responsive" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />

                                                        </div>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>


                                    <div class="fl-browse-contest__wrapper--open">

                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="fl-browse-contest__thumb">
                                                    <asp:ListView runat="server" ID="viewDetail">
                                                        <ItemTemplate>

                                                            <div class="fc-entries__thumbnails-bc">
                                                                <asp:Image CssClass="img-responsive" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                            </div>
                                                            <div class="fl-browse-contest__hover hide hidden-xs hidden-sm hidden-md">
                                                                <img class="img-responsive" src="https://cdn.sribu.com/assets/media/contest_detail/2018/12/design-booth-untuk-pameran-sepatu-5c04d8c49d68b1423e5b49c1/13a42ff0e7.jpg" alt="13a42ff0e7">
                                                            </div>


                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success btn-block btn-lg" Text="Unduh Semua" OnClick="btnDownload_Click" />

                                </div>
                                <asp:ListView RepeatColumns="4" ID="dlgambardesain2" runat="server">
                                    <ItemTemplate>
                                        <div class="hidden">
                                            <p class="fl-show-contest__info">
                                                by <a href="#">
                                                    <asp:Label ID="lblusername" runat="server" Text='<%# Eval("DesignerID") %>'></asp:Label></a>
                                            </p>
                                            <a href="#">
                                                <div class="fc-entries__thumbnails">
                                                    <asp:Image CssClass="img-responsive" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                </div>
                                            </a>
                                        </div>

                                    </ItemTemplate>

                                    <EmptyDataTemplate>
                                        <div class="row u-mt--30">
                                            <div class="col-md-12">
                                                <div class="alert alert-warning btn-block"><strong>Belum ada Desain</strong></div>
                                            </div>
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:ListView>

                                <br />
                                <h1>List Peserta</h1>
                                <hr />
                                <div class="row">
                                <div class="col-sm-12">

                                    <asp:DataList RepeatColumns="4" ID="DataList1" runat="server">
                                        <ItemTemplate>

                                            <div class="fl-invoices__wrapperv3 invoice_wrapper" style="margin-bottom: 25px;">

                                                <p class="fl-show-contest__info">
                                                    by <a href="#">
                                                        <asp:Label ID="lblusername" runat="server" Text='<%# Eval("DesignerID") %>'></asp:Label></a>
                                                </p>
                                                <a href="#">
                                                    <div class="fc-entries__thumbnails" style="width: 210px;height: 210px;">
                                                        <asp:Image CssClass="img-responsive" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                                    </div>
                                                </a>
                                            </div>

                                        </ItemTemplate>
                                        <SeparatorTemplate>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </SeparatorTemplate>
                                    </asp:DataList>
                                </div>
                                    </div>
                                <asp:ListView ID="lvCustomers" runat="server" DataKeyNames="CustomerID" DataMember="DefaultView"
                                    ItemPlaceholderID="CustomerPlaceHolder">
                                    <ItemTemplate>
                                    </ItemTemplate>
                                </asp:ListView>



                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="pagination"><span class="previous_page disabled">Sebelumnya</span> <em class="current">1</em> <a rel="next" href="/id/booth-design/contests/design-booth-untuk-pameran-sepatu-5c04d8c49d68b1423e5b49c1?page=2&amp;tab=designs">2</a> <a href="/id/booth-design/contests/design-booth-untuk-pameran-sepatu-5c04d8c49d68b1423e5b49c1?page=3&amp;tab=designs">3</a> <a class="next_page" rel="next" href="/id/booth-design/contests/design-booth-untuk-pameran-sepatu-5c04d8c49d68b1423e5b49c1?page=2&amp;tab=designs">Selanjutnya</a></div>
                                    </div>
                                </div>


                            </div>
                        </div>

                        <div runat="server" id="divBrief">
                            <div class="tab-content u-mt--30">
                                <!--views/contests/partials/tab_brief-->
                                <div class="tab-pane active" id="brief" role="tabpanel">
                                    <div class="fl-show-contest__brief">
                                        <div class="row fl-show-contest__brief-details">
                                            <div class="col-sm-4">
                                                <h1 class="fl-show-contest__brief-title">Detail Kontes</h1>
                                            </div>
                                            <div class="col-sm-8">
                                                <h1 class="fl-show-contest__brief-label">Judul Kontes</h1>
                                                <p class="fl-show-contest__brief-text">
                                                    <asp:Label ID="lblBriefJudul" runat="server"></asp:Label>
                                                </p>

                                                <h1 class="fl-show-contest__brief-label">Industri</h1>
                                                <p class="fl-show-contest__brief-text">
                                                    <asp:Label ID="lblBriefIndustri" runat="server"></asp:Label>
                                                </p>

                                                <h1 class="fl-show-contest__brief-label">Nama Desain</h1>
                                                <p class="fl-show-contest__brief-text">
                                                    <asp:Label ID="lblBriefNamaDesain" runat="server"></asp:Label>
                                                </p>

                                                <h1 class="fl-show-contest__brief-label">Deskripsi Klien</h1>
                                                <p class="fl-show-contest__brief-text">
                                                    <asp:Label ID="lblBriefDescKlien" runat="server"></asp:Label>
                                                </p>

                                                <h1 class="fl-show-contest__brief-label">Warna yang diinginkan</h1>
                                                <p class="fl-show-contest__brief-text">
                                                    <asp:Label ID="lblBriefWarna" runat="server"></asp:Label>
                                                </p>

                                                <h1 class="fl-show-contest__brief-label">Informasi tambahan untuk desainer</h1>
                                                <p class="fl-show-contest__brief-text">
                                                    <asp:Label ID="lblBriefDescDesain" runat="server"></asp:Label>
                                                </p>

                                            </div>
                                            <div class="row fl-show-contest__brief-details">
                                                <div class="col-sm-4">
                                                    <h1 class="fl-show-contest__brief-title">File Attachment</h1>
                                                </div>
                                                <div class="col-sm-8">
                                                    <h1 class="fl-show-contest__brief-label">Contoh gambar, sketsa atau dokumen lainnya</h1>
                                                    <ul class="list-inline u-mt--20">
                                                        <asp:DataList runat="server" RepeatColumns="6" ID="dlBriefReference">
                                                            <ItemTemplate>
                                                                <li class="u-mb--20">
                                                                    <div class="fc-entries__thumbnails-attachment">
                                                                        <asp:Image ImageUrl='<%# Eval("ImagePath") %>' ID="image1" runat="server" />
                                                                    </div>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <div aria-hidden="true" class="modal fade" id="modal_change_avatar" role="dialog" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="bMYJN6CEMPJ6mTgP7JP2BBpenkjThjg++Sq81Epwb/sHjhmIriS9Du/ZE0WvuCGejvGpCZoRVXUocDPJboiu2A=="><div class="modal-header">
                        <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h3 class="modal-title"><b>Pilih Pemenang</b></h3>
                    </div>
                    <div class="modal-body">

                        <asp:ListView ID="dlPemenang" runat="server">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="fl-invoices__wrapperv2 invoice_wrapper" style="margin-bottom: 25px; background-color: #f9fafb">

                                                <div class="col-sm-10 col-md-9">
                                                    <!--views/works/partials/info_contest-->
                                                    <a class="fl-works__title" href="/id/logo-design/contests/gyjjhbk-5c3832cc9d68b11971dadea6"><%# Eval("DesignerName") %></a><div class="fl-works__details">
                                                        <div class="fl-works__details-contest">
                                                            <div class="fl-works__icon-text">
                                                                <i class="fa fa-user"></i>
                                                                <p>by <a class="fl-works__username" href="#">@<%# Eval("DesignerID") %></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-3">
                                                    <div class="fl-works__action" style="margin-top: 20px;">

                                                        <asp:LinkButton ID="btnPemenang" runat="server" CssClass="btn btn-success" OnClick="btnPemenang_Click" CommandArgument='<%# Eval("DesignerID") %>'>Set Pemenang</asp:LinkButton>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <div class="alert alert-warning u-mb--15" style="padding: 5px 15px;">
                                    <span>Maaf kontes ada belum ada entry.</span>
                                </div>
                            </EmptyDataTemplate>
                        </asp:ListView>


                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>


    </div>

    <script>
        $(function () {
            // Multiple images preview in browser
            var imagesPreview = function (input, placeToInsertImagePreview) {

                if (input.files) {
                    var filesAmount = input.files.length;

                    for (i = 0; i < filesAmount; i++) {
                        var reader = new FileReader();

                        reader.onload = function (event) {
                            $($.parseHTML('<img width="200px" height="200px" margin-left= "10px" margin-right= "10px" margin-top= "10px" margin-down= "10px";>&nbsp;&nbsp;&nbsp;')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                        }

                        reader.readAsDataURL(input.files[i]);
                    }
                }

            };

            $('#fuReferensi').on('change', function () {
                imagesPreview(this, 'div.gallery');
            });
        });

        </script>
</asp:Content>


