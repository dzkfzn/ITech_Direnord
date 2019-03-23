<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Designer_Lihat_Kontes_Yang_Diikuti.aspx.cs" Inherits="PageUser_Designer_Lihat_Kontes_Yang_Diikuti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <!--views/contest/contest/index-->
    <div id="divContests" runat="server">
        <div class="fl-main-page with-hellobar">
            <div class="fl-browse-contest">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 class="fc-heading__bright--md">Kontes Yang Saya Ikuti</h1>
                            <p class="fc-subheading">Semoga Beruntung!</p>
                        </div>
                    </div>
                    <!--views/contests/contests/partials/form_contests_filter-->
                    <div class="row fl-browse-contest__filter">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <asp:TextBox runat="server" CssClass="form-control on-keydown-submit" placeholder="Cari Berdasarkan Judul Kontes, Kategori, Industri..." ID="txtSearch"></asp:TextBox>
                                <%--<asp:LinkButton runat="server" ID="btnSearch" CssClass="btn btn-success" Text="Cari"></asp:LinkButton>--%>
                            </div>
                        </div>

                        <div class="col-sm-4 col-md-4">
                            <div class="form-group">
                                <asp:LinkButton runat="server" ID="btnSearch" CssClass="btn btn-success" OnClick="btnSearch_Click"><span class="fa fa-search">  Cari</span></asp:LinkButton>
                                <asp:LinkButton runat="server" Text="Lihat Semua" ID="btnall" CssClass="btn btn-success" OnClick="btnall_Click"></asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div id="contests">
                        <!--views/contests/contests/partials/contest-->
                        <asp:ListView  ID="dlContest" DataKeyField="ContestID" runat="server" RepeatColumns="1">
                            <ItemTemplate>
                                <div class="fl-browse-contest__wrapper--open" style="background-color: white; position: relative;">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-4">
                                            <a class="fl-browse-contest__title" href="#">
                                                <asp:Label runat="server" Text='<%# Eval("ContestTitle") %>'></asp:Label></a><div class="fl-browse-contest__details-contest">
                                                    <span class="label fc-label__status--open">
                                                        <asp:Label runat="server" Text='<%# Eval("Category") %>'></asp:Label></span>
                                                    <span class="label fc-label__status--open">
                                                        <asp:Label runat="server" Text='<%# Eval("Industry") %>'></asp:Label></span>
                                                </div>
                                        </div>

                                        <div class="col-sm-10 col-md-4 fl-browse-contest__info">
                                            <div class="fl-browse-contest__icon-text">
                                                <i class="fa fa-image"></i>
                                                <p>
                                                    <asp:Label runat="server" Text='<%# Eval("CountEntries") %>'></asp:Label>
                                                    entries
                                                </p>
                                            </div>
                                            <div class="fl-browse-contest__icon-text" data-placement="bottom" data-toggle="tooltip">
                                                <i class="fa fa-clock-o"></i>
                                                <p><asp:Label runat="server" Text='<%# Eval("Final") %>'></asp:Label></p>
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-md-2 fl-browse-contest__info">
                                            <div class="fl-browse-contest__icon-text">
                                                <i class="fa fa-trophy"></i>
                                                <p class="price">
                                                    IDR
                                            <asp:Label runat="server" Text='<%# string.Format("{0:n0}", Eval("Total"))%>'></asp:Label>
                                                </p>
                                                <br>
                                                <span class="label fc-label__packages--gold">
                                                    <asp:Label runat="server" Text='<%# Eval("NamePackage") %>'></asp:Label></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-10 col-md-2 fl-browse-contest__info">
                                            <div class="fl-browse-contest__icon-text">
                                                <br />
                                                <asp:LinkButton ToolTip="Detail Kontes" CssClass="btn btn-success btn-lg" Text="Detail Kontes" ID="btnDetailView" OnClick="btnDetailView_Click" runat="server"
                                                    CommandArgument='<%# Eval("ContestID")%>'>
                                                </asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <h3>Tidak ada kontes yang anda ikuti.</h3>
                            </EmptyDataTemplate>
                        </asp:ListView>
                        <br />
                        <br />
                        <br />

                        <div class="row">
                            <div class="col-sm-12">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%-- <div id="divDetail" runat="server">
        <div class="fl-main-page with-hellobar">
            <div class="fl-browse-contest">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 class="fc-heading__bright--md">
                                <asp:Label ID="dtlContestTitle" runat="server"></asp:Label></h1>
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="col-sm-12">
                            <h3 class="exam-list-title" style="color: firebrick">Referensi Desain</h3>
                            <asp:Label ID="dtlPict" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Kategori</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlKategori" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Industri</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlIndustri" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Hadiah Pemenang</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlDesainerCost" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Paket Kontes</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlNamaPaket" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Pengikut Kontes</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlCountEntries" runat="server"> Orang</asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Inisial Desain Yang Dibutuhkan</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlDesainName" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Deskripsi Klien</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlDescClient" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Warna Yang Diingikan</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlColour" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Deskripsi Desain</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlDescDesign" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Gaya Desain</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlContestStyle" runat="server"> Hari</asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Durasi Kontes</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlDuration" runat="server"> Hari</asp:Label>
                            </p>
                        </div>
                        <div class="col-sm-4">
                            <h3 class="exam-list-title" style="color: firebrick">Kontes Berakhir</h3>
                            <p class="fc-subheading">
                                <asp:Label ID="dtlFinal" runat="server"></asp:Label>
                            </p>
                        </div>

                        <div class="col-sm-12">
                            <h3 class="exam-list-title" style="color: firebrick">Upload Desain Anda*
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="fuReferensi" Text="(Harus diisi)" Display="Dynamic"
                                    runat="server" ForeColor="Red" ValidationGroup="valgroup1" />
                            </h3>
                            <span class="btn btn-default fileinput-button"><i style="margin-right: 5px;" class="fa fa-paperclip"></i><span>Add Files</span>
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="fuReferensi" AllowMultiple="true" />
                            </span>
                            <br />
                            <br />
                            <br />
                            <div class="gallery"></div>
                            <br />
                            <br />
                        </div>


                        <div class="col-sm-12">
                            <asp:Button ID="btnUnggah_Desain" OnClick="btnUnggah_Desain_Click" ValidationGroup="valgroup1" runat="server" Text="Unggah Desain" CssClass="btn btn-success btn-lg" />&nbsp;&nbsp;
                            <asp:Button ID="btnKembali" OnClick="btnKembali_Click" CausesValidation="false" runat="server" Text="Keluar" CssClass="btn btn-danger btn-lg" />
                        </div>



                    </div>

                </div>
            </div>
        </div>
    </div>--%>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


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


    </div>
    </div>
</asp:Content>

