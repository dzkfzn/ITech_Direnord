<%@ Page Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Buat_Brief_Silver.aspx.cs" Inherits="PageUser_PageClient_Buat_Brief_Silver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar">
        <!--views/layouts/breadcrumbs/contest_breadcrumbs-->
        <div class="fc-breadcrumbs__step-four container hidden-xs">
            <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch"><span class="fc-breadcrumbs__icon">1</span></a><p class="fc-breadcrumbs__step-title">Pilih Kategori</p>
                </li>
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch/logo-design/packages"><span class="fc-breadcrumbs__icon">2</span></a><p class="fc-breadcrumbs__step-title">Pilih Paket</p>
                </li>
                <li class="four-step is-active"><a href="https://www.sribu.com/id/launch/logo-design/brief?package=silver#"><span class="fc-breadcrumbs__icon">3</span></a><p class="fc-breadcrumbs__step-title">Buat Brief</p>
                </li>
                <li class="four-step disabled"><a href="https://www.sribu.com/id/launch/logo-design/brief?package=silver#"><span class="fc-breadcrumbs__icon">4</span></a><p class="fc-breadcrumbs__step-title">Konfirmasi Pemesanan</p>
                </li>
            </ul>
        </div>
        <div class="fc-breadcrumbs__step-four container visible-xs">
            <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch">
                    <p class="fc-breadcrumbs__step-title">Kategori</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch/logo-design/packages">
                    <p class="fc-breadcrumbs__step-title">Paket</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step is-active"><a href="https://www.sribu.com/id/launch/logo-design/brief?package=silver#">
                    <p class="fc-breadcrumbs__step-title">Brief</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step disabled"><a href="https://www.sribu.com/id/launch/logo-design/brief?package=silver#">
                    <p class="fc-breadcrumbs__step-title">Konfirmasi</p>
                </a></li>
            </ul>
        </div>
        <!--views/launch/launch/brief-->
        <div class="fl-brief">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <span class="hidden">logo_design</span><h1 class="fl-brief__section-title u-mt--no">Masukkan Kreatif Brief untuk Desain Logo Anda</h1>
                        <p class="fl-brief__section-subtitle">Jelaskan selengkapnya mengenai permintaan desain Anda dengan mengisi form di bawah ini</p>
                        <input name="utf8" type="hidden" value="✓">
                        <input type="hidden" name="authenticity_token" value="ywKRoBxHbiYmIaZSjoxj6FutdFPltQmw/diui0FL1b8TDYUO3f2jRt70PVtWQ9HUOas7r3mL+QDGaymdRK5D4w==">
                        <input type="hidden" name="category_id" id="category_id" value="4fac049959aa92040e00041c">
                        <input type="hidden" name="package_id" id="package_id" value="4fac049959aa92040e00041e">
                        <input type="hidden" name="package_cname" id="package_cname" value="silver">
                        <input type="hidden" name="contest_attachment_group_id" id="contest_attachment_group_id" value="de1f187bbee830bd10fae345bba1d170">
                        <input type="hidden" name="ga_client_id" id="ga_client_id">
                        <input type="hidden" name="gclid" id="gclid">
                        <input type="hidden" name="utm_source" id="utm_source">
                        <input type="hidden" name="utm_medium" id="utm_medium">
                        <div class="form-group">
                            <label>Apa nama yang Anda inginkan di dalam Logo?</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="valInp_NamaBarang" ControlToValidate="txtNamaDesaign" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <asp:TextBox
                                ID="txtNamaDesaign"
                                runat="server"
                                CssClass="form-control input-lg"
                                placeholder="Contoh: Direnord"
                                data-validation="length"
                                data-validation-length="2-100"
                                data-validation-error-msg="Nama logo harus diisi" />

                        </div>
                        <div class="form-group">
                            <label>Jelaskan mengenai perusahaan atau produk Anda secara singkat dan target marketnya</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDescPerusahaan" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <asp:TextBox
                                ID="txtDescPerusahaan"
                                TextMode="multiline"
                                Columns="50"
                                Rows="3"
                                runat="server"
                                CssClass="form-control input-lg text-count-1000"
                                placeholder="Contoh: Kami menjual desain grafis secara online dengan pilihan desain yang banyak dan berkualitas kepada startup, pengusaha kecil menengah dan brand besar di seluruh dunia." />
                            <span class="pull-right help-block textarea-count">0 / 1000 characters.</span>
                        </div>
                        <div class="form-group">
                            <label>Pilih industri Anda</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="industry_id" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="bs-select-native">
                                        <asp:DropDownList ID="industry_id" CssClass="form-control input-lg" runat="server" DataSourceID="ddlAcara" DataTextField="IndustryName" DataValueField="IndustryID">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>


                                        <asp:SqlDataSource ID="ddlAcara" runat="server" ConnectionString="<%$ ConnectionStrings:DirenordConnectionString %>" SelectCommand="SELECT [IndustryID], [IndustryName] FROM [Industry] WHERE ([IndustryStatusActive] = @IndustryStatusActive)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="IndustryStatusActive" Type="Int16" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="divLogo" visible="false" runat="server">
                            <label>Pilih gaya desain yang Anda suka</label><div class="fl-brief__sample-logo" style="position: relative; width: 650px; height: 410px;">
                                <label style="position: absolute; left: 0px; top: 0px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo1" value="initial"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_initial-220090c2a9a3c100a9fc8ef704df647f99a38b1f621d419eb003191daea6065e.jpg"><i class="fa fa-check-circle fa-2x"></i>Initial Style
                                </label>
                                <label style="position: absolute; left: 165px; top: 0px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo2" value="symbol"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_symbol-0549f912846ca9d18746940137031d3685b921df829665124749f54cf0370b84.jpg"><i class="fa fa-check-circle fa-2x"></i>Symbol Style
                                </label>
                                <label style="position: absolute; left: 330px; top: 0px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo3" value="typography"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_typography-ade83f48c49b902cd5fdba7c78165acc217abc0f00e3ca7df24e7e8d3fa1802c.jpg"><i class="fa fa-check-circle fa-2x"></i>Typography Style
                                </label>
                                <label style="position: absolute; left: 495px; top: 0px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo4" value="illustration"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_illustration-521c279d345ad294953712f0305c1049fb1566fe6259a5850e79b38c546b9834.jpg"><i class="fa fa-check-circle fa-2x"></i>Illustration Style
                                </label>
                                <label style="position: absolute; left: 0px; top: 205px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo5" value="fun"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_fun-d9dba22a2f7587f1a912dd1b2571a1b89c47a7349df9c507acd7479f8ef33e00.jpg"><i class="fa fa-check-circle fa-2x"></i>Fun Style
                                </label>
                                <label style="position: absolute; left: 165px; top: 205px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo6" value="corporate"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_corporate-edbf0a19125eca7ece73cebce02ba4c23b3d5e9de2b047b02c66f24d206a378f.jpg"><i class="fa fa-check-circle fa-2x"></i>Corporate Style
                                </label>
                                <label style="position: absolute; left: 330px; top: 205px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo7" value="web"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_web-4346e1a57f709cb8bfc1b872b166fba17560f695befbc85af674170ad52e8369.jpg"><i class="fa fa-check-circle fa-2x"></i>Web Style
                                </label>
                                <label style="position: absolute; left: 495px; top: 205px;">
                                    <input type="checkbox" runat="server" name="detail[logo_types][]" id="logo8" value="flat"><img alt="Sample-Logo" class="img-responsive" src="./Template_User/Buat_Brief_Silver_files/sample_flat-4feadd1914bda00f99fd5bdd3bce22eecf1e4cac6f91851c361a7adc83aec076.jpg"><i class="fa fa-check-circle fa-2x"></i>Flat Style
                                </label>
                            </div>
                            <div class="has-error hidden"><span class="help-block form-error">Anda harus memilih paling tidak satu gaya desain</span></div>
                        </div>

                        <div class="form-group variant-types-radio" visible="false" runat="server" id="divBanner">
                            <label>Jenis desain apa saja yang Anda inginkan?</label>
                         
                            <asp:RadioButtonList CssClass="radio" ID="rbBanner" runat="server"
                                RepeatColumns="1"
                                RepeatDirection="Vertical"
                                RepeatLayout="Table">
                                <asp:ListItem Text="Webbanner" Value="Web banner"></asp:ListItem>
                                <asp:ListItem Text="Standing banner" Value="Standing banner"></asp:ListItem>
                                <asp:ListItem Text="Billboard" Value="Billboard"></asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        
                        <div class="form-group variant-types-checkbox" visible="false" runat="server" id="divKopSurat">
                            <label>Jenis stationery apa saja yang Anda inginkan?</label><p class="text-muted">Anda dapat memilih 2 jenis stationery untuk Bronze, 4 jenis stationery untuk Silver, 6 jenis stationery untuk Gold</p>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" runat="server" name="detail[variant_types][]" id="stat1" value="Kartu nama">Kartu nama</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" runat="server" name="detail[variant_types][]" id="stat2" value="Kop surat">Kop surat</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" runat="server" name="detail[variant_types][]" id="stat3" value="Amplop">Amplop</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" runat="server" name="detail[variant_types][]" id="stat4" value="Note">Note</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" runat="server" name="detail[variant_types][]" id="stat5" value="Invoice">Invoice</label>
                            </div>
                        </div>


                        <div class="form-group" id="warnaDesaign" runat="server">
                            <label>Warna apa yang Anda inginkan untuk desain logo Anda?</label><div class="fl-brief__color" style="position: relative; width: 650px; height: 315px;">
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Pengetahuan, Kepercayaan, Tenang, dan Kejujuran." style="position: absolute; left: 0px; top: 0px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna1" value="Biru"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_blues-f7ab820143c6609924270f3c110f8c8ed853c042730b117791c3c428c46f6c0b.png"><i class="fa fa-check-circle fa-2x"></i>Biru
                                </label>

                                <asp:Label runat="server" ID="test1" data-placement="top" data-toggle="tooltip" data-original-title="Pengetahuan, Kepercayaan, Tenang, dan Kejujuran." Style="position: absolute; left: 0px; top: 0px;">

                                </asp:Label>

                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Empati, Welas Asih, Kejernihan, dan Ketelitian." style="position: absolute; left: 165px; top: 0px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna2" value="Pastel"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_aquas-af8a2b53dde212f4b46ba679b0b8e73684ce40e9fe1a778bb9052e07ad86a879.png"><i class="fa fa-check-circle fa-2x"></i>Pastel
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Pertumbuhan, Keharmonisan, dan Kesuksesan." style="position: absolute; left: 330px; top: 0px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna3" value="Hijau"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_greens-4f6e9bfe226c8933ed542263141519d75fa07ad649fb212f9bcd2dcdbcc123fe.png"><i class="fa fa-check-circle fa-2x"></i>Hijau
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Imajinasi, Spiritual, Kemegahan, dan Kemewahan." style="position: absolute; left: 495px; top: 0px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna4" value="Ungu"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_purples-1c01f1ee5a24eb9165fb109e7aab23d6d0683d3e08155a885385787031cb8f87.png"><i class="fa fa-check-circle fa-2x"></i>Ungu
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Keintiman, Cinta, Tenang, dan Membimbing." style="position: absolute; left: 0px; top: 105px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna5" value="Merah Muda"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_pinks-be7d3f42293467fdf88ca1d22d2250f4719d201eb3a3a55a7434c849c2e44be4.png"><i class="fa fa-check-circle fa-2x"></i>Merah muda
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Energi, Aksi, Gairah, dan Cinta." style="position: absolute; left: 165px; top: 105px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna6" value="Merah"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_reds-9adfd9551f986948767202c8912f564e645f9f4563246666a8b0ebd393ca3d11.png"><i class="fa fa-check-circle fa-2x"></i>Merah
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Kreativitas, Petualangan, dan Kebahagiaan." style="position: absolute; left: 330px; top: 105px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna7" value="Orange"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_oranges-ceff0bfa0919e50096ccd01af20b7d943260d13fe04a1b7de476462d3a2b0950.png"><i class="fa fa-check-circle fa-2x"></i>Oranye
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Kemurnian, Keseimbangan, dan Kecerdasan." style="position: absolute; left: 495px; top: 105px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna8" value="Putih"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_lights-dd8f8111391d0ea8ceb4842f180dab899ca589d782c34ae130ce51f242a221f6.png"><i class="fa fa-check-circle fa-2x"></i>Putih
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Energi, Kecerdasan, Gembira, dan Jiwa Muda." style="position: absolute; left: 0px; top: 210px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna9" value="Kuning"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_yellows-b98610f00d01500b8986513fb07ca453a5a512518ba9e2dfe66cecee651567da.png"><i class="fa fa-check-circle fa-2x"></i>Kuning
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Formalitas, Misteri, Eksklusivitas, dan Mewah." style="position: absolute; left: 165px; top: 210px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna10" value="Hitam"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_darks-4e276cdd927b3b1431b561f0048684ca02ed2d7e0f7a2d89399f80207aaba653.png"><i class="fa fa-check-circle fa-2x"></i>Hitam
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Saya memiliki warna tertentu untuk digunakan." style="position: absolute; left: 330px; top: 210px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna11" value="others"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_others-ef049f3dc5a1cdf46968908a616ed14f44a5936b3e0b63ea20d7d2e99588e1e6.png" width="205" height="205"><i class="fa fa-check-circle fa-2x"></i>Warna Lain
                                </label>
                                <label data-placement="top" data-toggle="tooltip" title="" data-original-title="Saya ingin desainer untuk mengeksplorasi warna apapun." style="position: absolute; left: 495px; top: 210px;">
                                    <input type="checkbox" name="detail[colors][]" runat="server" id="warna12" value="suggestion"><img alt="Sample-Logo" class="img-responsive brief__thumbnails--image" src="./Template_User/Buat_Brief_Silver_files/color_suggestion-1a477a1437b2a68b8ad9aae5cd3ce1b25ad912548d501306b6dde6ccddc6428a.png"><i class="fa fa-check-circle fa-2x"></i>Warna Bebas
                                </label>
                            </div>
                            <%--<div class="fl-brief__other-color" style="display: none;">
                                    <div class="well">
                                        <input type="text" runat="server" name="detail[other]" id="warna13" class="form-control input-lg" placeholder="Your Hexa Number Eg. #000000">
                                    </div>
                                </div>--%>
                            <div class="has-error hidden"><span class="help-block form-error">Anda harus memilih paling tidak satu warna</span></div>
                        </div>

                        <div class="form-group">
                            <label>Apakah ada informasi lain yang ingin Anda sampaikan ke desainer kami?</label>
                            <asp:TextBox
                                ID="txtDescDesaign"
                                TextMode="multiline"
                                Columns="50"
                                Rows="3"
                                runat="server"
                                CssClass="form-control input-lg text-count-1000"
                                placeholder="Contoh: Saya ingin desain yang elegan dan menarik." />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtDescDesaign" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <span class="pull-right help-block textarea-count">0 / 1000 characters.</span>
                        </div>


                        <%--<div class="form-group">
                                <label>Apakah ada informasi lain yang ingin Anda sampaikan ke desainer kami?</label><textarea name="detail[note]" id="note" class="form-control input-lg text-count-600" rows="3" placeholder="Contoh: Saya ingin desain yang elegan dan menarik" data-validation="length" data-validation-length="max600" data-validation-error-msg="Informasi tambahan tidak boleh lebih dari 600 karakter"></textarea><span class="pull-right help-block textarea-count">0 / 600 characters.</span>
                            </div>--%>
                        <%--<div class="form-group">
                                <label>Apakah Anda menginginkan desain kartu nama dan kop surat juga bersama dengan logo Anda?</label><div class="radio">
                                    <label>
                                        <input type="radio" name="detail[is_need_stationery]" id="detail_is_need_stationery_false" value="false">Tidak, Saya hanya ingin logo.</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="detail[is_need_stationery]" id="detail_is_need_stationery_true" value="true">Ya, Saya juga ingin desain kartu nama dan kop surat (tambahan biaya IDR 1.000.000).</label>
                                </div>
                            </div>--%>
                        <%-- <div class="form-group" id="stationery_description">
                            <label>Apa informasi yang Anda inginkan di kartu nama dan kop surat Anda?</label>
                            <asp:TextBox runat="server" ID="txtDescDesaign" CssClass="form-control input-lg text-count-600" Rows="3" placeholder="Contoh: Alamat kantor/nama/email/telepon/nama website, dll." data-validation="length" data-validation-length="min5" data-validation-error-msg="Informasi stationery harus diisi"></asp:TextBox><span class="pull-right help-block textarea-count">0 / 600 characters.</span>
                        </div>--%>
                        <div class="form-group" data-url="/id/contest_attachments" id="attachments_fileupload">
                            <label>Apakah Anda memiliki referensi atau file pendukung yang mau dilampirkan?</label><p class="text-muted">Contoh: Logo Anda sekarang, foto, ilustrasi, content, layout ideas</p>
                            <span class="btn btn-default fileinput-button"><i style="margin-right: 5px;" class="fa fa-paperclip"></i><span>Add Files</span>
                                <%--<input id="attachments" multiple="multiple" name="attachments[]" type="file"></span><div id="attachment_files">--%>
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="fuReferensi" AllowMultiple="true" />
                                <%--<input runat="server" type="file" multiple="multiple" id="fuReferensi"/>--%>
                        </div>
                        <div class="gallery"></div>

                        <div class="form-group">
                            <label>Judul kontes</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtTitle" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <asp:TextBox
                                ID="txtTitle"
                                runat="server"
                                CssClass="form-control input-lg"
                                placeholder="Contoh: Kontes Desain Logo untuk Perusahaan Desain"
                                data-validation="length"
                                data-validation-length="2-100"
                                data-validation-error-msg="Nama logo harus diisi" />

                        </div>

                        <div class="form-group">
                            <label class="capitalize-phrase">Durasi kontes</label><span style="color: red" class="glyphicon-asterisk"></span><p class="text-muted">Berapa lama Anda ingin kontes Anda berjalan? Desainer hanya dapat upload desain ketika kontes berjalan.</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="bs-select-native">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Enabled="false" ControlToValidate="ddlBronzeDurasi" Text="(Harus diisi)"
                                            Display="Dynamic" runat="server" ForeColor="Red" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Enabled="false" ControlToValidate="ddlSilverDurasi" Text="(Harus diisi)"
                                            Display="Dynamic" runat="server" ForeColor="Red" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Enabled="false" ControlToValidate="ddlGoldDurasi" Text="(Harus diisi)"
                                            Display="Dynamic" runat="server" ForeColor="Red" />
                                        <div id="ddlBronze" runat="server">
                                            <asp:DropDownList ID="ddlBronzeDurasi" runat="server" class="form-control input-lg">
                                                <asp:ListItem Value="">-Choose the duration-</asp:ListItem>
                                                <asp:ListItem Value="7">7 days</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>

                                        <div id="ddlSilver" runat="server">
                                            <asp:DropDownList ID="ddlSilverDurasi" runat="server" class="form-control input-lg">
                                                <asp:ListItem Value="">-Choose the duration-</asp:ListItem>
                                                <asp:ListItem Value="10">10 days</asp:ListItem>
                                                <asp:ListItem Value="9">9 days</asp:ListItem>
                                                <asp:ListItem Value="8">8 days</asp:ListItem>
                                                <asp:ListItem Value="7">7 days</asp:ListItem>
                                                <asp:ListItem Value="6">6 days</asp:ListItem>
                                                <asp:ListItem Value="5">5 days</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>

                                        <div id="ddlGold" runat="server">
                                            <asp:DropDownList ID="ddlGoldDurasi" runat="server" class="form-control input-lg">
                                                <asp:ListItem Value="">-Choose the duration-</asp:ListItem>
                                                <asp:ListItem Value="13">13 days</asp:ListItem>
                                                <asp:ListItem Value="12">12 days</asp:ListItem>
                                                <asp:ListItem Value="11">11 days</asp:ListItem>
                                                <asp:ListItem Value="10">10 days</asp:ListItem>
                                                <asp:ListItem Value="9">9 days</asp:ListItem>
                                                <asp:ListItem Value="8">8 days</asp:ListItem>
                                                <asp:ListItem Value="7">7 days</asp:ListItem>
                                                <asp:ListItem Value="6">6 days</asp:ListItem>
                                                <asp:ListItem Value="5">5 days</asp:ListItem>
                                                <asp:ListItem Value="4">4 days</asp:ListItem>
                                                <asp:ListItem Value="3">3 days</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="alert alert-warning">Anda akan mendapatkan file master AI/Vector daripada desain logo yang Anda pilih.</div>






                        <p class="fl-brief__section-subtitle">Kami bekerja sama dengan mitra terpilih. Mitra kami akan memberikan penawaran yang baru untuk jasa tersebut dan berbeda dengan penawaran desain ini</p>




                        <div class="col-sm-12">
                            <asp:Button ID="btnSimpan" CssClass="btn btn-lg btn-success fl-brief__btn-payment" Text="Lanjut ke Pembayaran" OnClick="btnSimpan_Click" runat="server" />
                        </div>
                    </div>
                    <div class="col-md-5 visible-md visible-lg text-center">
                        <img alt="Design-Sribu" class="cs-image" src="./Template_User/Buat_Brief_Silver_files/cs-2-54c1f92d5f056b2de36f3fee10c4fd898e8199a16c91721c1a7843b6d4c6cf4d.png">
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
                            $($.parseHTML('<img width="200px" height="200px" margin-left= "10px" margin-right= "10px" margin-top= "10px" margin-down= "10px";>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                        }

                        reader.readAsDataURL(input.files[i]);
                    }
                }

            };

            $('#fuReferensi').on('change', function () {
                imagesPreview(this, 'div.gallery');
            });
        });
        window.fcWidget.setExternalId("animename0018");
        window.fcWidget.user.setFirstName("dzaki fauzaan");
        window.fcWidget.user.setEmail("animename00@gmail.com");
        window.fcWidget.user.setPhone("+62895353755286");

    </script>
</asp:Content>
