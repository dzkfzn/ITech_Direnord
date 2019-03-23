<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Designer_Detail_Kontes.aspx.cs" Inherits="PageUser_Designer_Detail_Contest" %>

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
                            <a class="btn btn-success btn-lg" data-toggle="modal" data-target="#modal_change_avatar" href="#">Ikuti Kontes</a>
                        </div>
                        <ol class="breadcrumb">
                            <li class="active"><span>1. Kontes Berlangsung</span></li>
                            <li><span>2. Pemilihan Pemenang</span></li>
                            <li><span>3. Transfer File</span></li>
                            <li><span>4. Kontes Berakhir</span></li>
                        </ol>
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

                        <div runat="server" id="divDesain">
                            <div id="entries">
                                <!--views/contests/partials/entries-->

                                <asp:DataList RepeatColumns="4" ID="dlgambardesain" runat="server">
                                    <ItemTemplate>

                                        <p class="fl-show-contest__info">
                                            by <a href="#">
                                                <asp:Label ID="lblusername" runat="server" Text='<%# Eval("DesignerID") %>'></asp:Label></a>
                                        </p>
                                        <a href="#">
                                            <div class="fc-entries__thumbnails">
                                                <asp:Image CssClass="img-responsive" ImageUrl='<%# Eval("ImagePath") %>' runat="server" />
                                            </div>
                                        </a>
                                    </ItemTemplate>
                                    <SeparatorTemplate>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </SeparatorTemplate>
                                </asp:DataList>


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
                                                                        <asp:Image ImageUrl='<%# "/img/img-RefrenceContest/" + Eval("ImagePath") %>' ID="image1" runat="server" />
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
                        <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h3 class="modal-title"><b>Ikut Kontes</b></h3>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="member_id" id="member_id" value="52491b073c0aa17e9b001caa"><div class="form-group">
                            <h3 class="modal-sribu__label-title">Upload Desainmu</h3>
                            <span class="btn btn-default fileinput-button"><i style="margin-right: 5px;" class="fa fa-paperclip"></i><span>Add Files</span>
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="fuReferensi" AllowMultiple="true" />
                            </span>
                            <br />
                            <br />
                            <div class="gallery"></div>
                            <br />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <asp:LinkButton ID="btnUploadDesain" CssClass="btn btn-success" Text="Upload Desain" OnClick="btnUploadDesain_Click" runat="server"></asp:LinkButton>
                        </div>
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

