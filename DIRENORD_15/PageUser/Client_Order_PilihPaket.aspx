<%@ Page Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Order_PilihPaket.aspx.cs" Inherits="PageUser_PageClient_Order_PilihPaket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar" runat="server">
        <!--views/layouts/breadcrumbs/contest_breadcrumbs-->
        <div class="fc-breadcrumbs__step-four container hidden-xs">
            <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                <li class="four-step is-success"><a href="#"><span class="fc-breadcrumbs__icon">1</span></a><p class="fc-breadcrumbs__step-title">Pilih Kategori</p>
                </li>
                <li class="four-step is-active"><a href="#"><span class="fc-breadcrumbs__icon">2</span></a><p class="fc-breadcrumbs__step-title">Pilih Paket</p>
                </li>
                <li class="four-step disabled"><a href="#"><span class="fc-breadcrumbs__icon">3</span></a><p class="fc-breadcrumbs__step-title">Buat Brief</p>
                </li>
                <li class="four-step disabled"><a href="#"><span class="fc-breadcrumbs__icon">4</span></a><p class="fc-breadcrumbs__step-title">Konfirmasi Pemesanan</p>
                </li>
            </ul>
        </div>
        <div class="fc-breadcrumbs__step-four container visible-xs">
            <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch">
                    <p class="fc-breadcrumbs__step-title">Kategori</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step is-active"><a href="https://www.sribu.com/id/launch/logo-design/packages#">
                    <p class="fc-breadcrumbs__step-title">Paket</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step disabled"><a href="https://www.sribu.com/id/launch/logo-design/packages#">
                    <p class="fc-breadcrumbs__step-title">Brief</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step disabled"><a href="https://www.sribu.com/id/launch/logo-design/packages#">
                    <p class="fc-breadcrumbs__step-title">Konfirmasi</p>
                </a></li>
            </ul>
        </div>
        <div class="fl-packages">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12"><span class="hidden">logo_design</span><h1 class="fc-heading__bright--sm u-mb--10">Pilih Paket untuk Kontes Desain Logo Anda</h1>
                        <div class="hidden-xs hidden-sm">
                            <p>Kami menjamin bahwa Anda akan mendapatkan desain yang bagus pada paket harga apapun, namun paket harga lebih tinggi akan menarik lebih banyak desainer berpengalaman dan menawarkan lebih banyak desain</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" id="voucher-session" style="margin-top: 35px;">
                    <div class="fl-packages2__wrapper" id="packages"></div>
                    <!--views/launch/launch/partials/packages-->
                    <div id="voucher-section">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-center no-paddingl centering"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="row" style="text-align: center;">
                            <div class="hidden-xs hidden-sm">
                                <div class="col-lg-11 col-md-11">
                                    <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr">
                                        <div class="fl-packages__header--white"></div>
                                    </div>
                                    <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr">
                                        <div class="hidden-xs fl-packages2__box--gold">
                                            <div class="fl-packages2__header--gold">
                                                <h1 class="fl-packages2__title-packages--gold">Gold</h1>
                                                <p class="fl-packages2__price">IDR 4.250.000</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr">
                                        <div class="hidden-xs fl-packages2__box--silver">
                                            <div class="fl-packages2__header--silver">
                                                <div class="fl-packages2__ribbon--silver">Most Popular</div>
                                                <h1 class="fl-packages2__title-packages--silver">Silver</h1>
                                                <p class="fl-packages2__price">IDR 2.200.000</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr">
                                        <div class="hidden-xs fl-packages2__box--bronze">
                                            <div class="fl-packages2__header--bronze">
                                                <h1 class="fl-packages2__title-packages--bronze">Bronze</h1>
                                                <p class="fl-packages2__price">IDR 1.100.000</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 20px 10px 20px 10px; text-align: left;"><span class="benefitCategoty">Kualitas desain</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;">
                                            <span style="cursor: default;">
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                        </span>
                                        </div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span style="cursor: default;">
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            
                                        </span>
                                            <input class="rating" data-empty="fa fa-star fa-lg fl-show-contest__rat" data-filled="fa fa-star fa-lg fl-show-contest__rat--active" data-readonly="" type="hidden" value="4">
                                        </div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span style="cursor: default;">
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                            <div class="rating-symbol" style="display: inline-block; position: relative;">
                                                <div class="rating-symbol-background fa fa-star fa-lg fl-show-contest__rat" style="visibility: hidden;"></div>
                                                <div class="rating-symbol-foreground" style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: auto;"><span class="fa fa-star fa-lg fl-show-contest__rat--active"></span></div>
                                            </div>
                                           
                                        </span>
                                            <input class="rating" data-empty="fa fa-star fa-lg fl-show-contest__rat" data-filled="fa fa-star fa-lg fl-show-contest__rat--active" data-readonly="" type="hidden" value="3"></div>
                                    </div>
                                </div>
                               
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr cat_1 table-row1" style="padding: 10px; text-align: left;"><span class="benefitCategoty">Durasi pengerjaan</span><span class="tooltipNew"><i class="fa fa-question-circle"></i></span><span class="contentTooltip" style="font-weight: normal;">Jika Anda membutuhkan desain dengan cepat, Anda dapat memilih durasi pengerjaan yang cepat. Jika Anda membutuhkan pilihan desain yang banyak, Anda dapat memilih durasi yang lebih lama.</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="benefitCategoty">3 - 14 hari</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="benefitCategoty">5 - 10 hari</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="benefitCategoty">7 hari</span></div>
                                    </div>
                                </div>
                                
                               
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr cat_1 table-row" style="padding: 10px; text-align: left;"><span class="benefitCategoty">Order prioritas</span><span class="tooltipNew"><i class="fa fa-question-circle"></i></span><span class="contentTooltip" style="font-weight: normal;">Order Anda akan dikerjakan lebih dahulu dan Anda akan mendapatkan pilihan desain yang lebih banyak.</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-times benefitCategoty" style="color: red;"></span></div>
                                    </div>
                                </div>
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr cat_1 table-row1" style="padding: 10px; text-align: left;"><span class="benefitCategoty">Dikerjakan desainer terbaik</span><span class="tooltipNew"><i class="fa fa-question-circle"></i></span><span class="contentTooltip" style="font-weight: normal;">Desainer-desainer terbaik akan lebih tertarik mendesain untuk Anda.</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="fa fa-times benefitCategoty" style="color: red;"></span></div>
                                    </div>
                                </div>
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr cat_1 table-row" style="padding: 10px; text-align: left;"><a class="benefitCategoty" href="/money-back-guarantee" target="_blank">Garansi uang kembali</a></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                    </div>
                                </div>
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr cat_1 table-row1" style="padding: 10px; text-align: left;"><span class="benefitCategoty">Master file desain</span><span class="tooltipNew"><i class="fa fa-question-circle"></i></span><span class="contentTooltip" style="font-weight: normal;">Anda akan mendapatkan master file desain berupa file AI (adobe illustrator) atau CDR (corel draw) yang dapat diedit, resolusi besar yang tidak pecah ketika di-zoom dan siap untuk print.</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row1" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                    </div>
                                </div>
                                <div class="col-lg-11 col-md-11">
                                    <div class="wrapper-benefit">
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr cat_1 table-row" style="padding: 10px; text-align: left;"><span class="benefitCategoty">Hak cipta desain</span><span class="tooltipNew"><i class="fa fa-question-circle"></i></span><span class="contentTooltip" style="font-weight: normal;">Anda akan mendapatkan surat izin untuk penggunaan hak cipta desain yang dibuat oleh desainer pemenang.</span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                        <div class="col-sm-6 col-md-3 col-lg-3 no-paddinglr table-row" style="padding: 10px;"><span class="fa fa-check benefitCategoty" style="color: #28cb75;"></span></div>
                                    </div>
                                </div>
                                <div class="col-lg-11 col-md-11" style="padding-bottom: 30px;" runat="server">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-3" style="border: 1px solid rgba(221,221,221,0.5);">
                                            <div class="btn-footer--gold" runat="server">
                                                <asp:LinkButton runat="server" CssClass="btn-modal-login btn btn-lg btn-block btn-success" OnClick="btnGold_Click" ID="btnGold">Pilih Paket </asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="col-md-3" style="border: 1px solid rgba(221,221,221,0.5);">
                                            <div class="btn-footer--silver">
                                                <asp:LinkButton runat="server" CssClass="btn-modal-login btn btn-lg btn-block btn-success" OnClick="btnSilver_Click" ID="btnSilver">Pilih Paket </asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="col-md-3" style="border: 1px solid rgba(221,221,221,0.5);">
                                            <div class="btn-footer--bronze">
                                                <asp:LinkButton runat="server" CssClass="btn-modal-login btn btn-lg btn-block btn-success" OnClick="btnBronze_Click" ID="btnBronze">Pilih Paket </asp:LinkButton>

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
</asp:Content>
