<%@ Page Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Order_PilihKat.aspx.cs" Inherits="PageUser_PageClient_Order_PilihKat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
   <div class="fl-main-page with-hellobar">
            <!--views/layouts/breadcrumbs/contest_breadcrumbs-->
            <div class="fc-breadcrumbs__step-four container hidden-xs">
                <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                    <li class="four-step is-active"><a href="#"><span class="fc-breadcrumbs__icon">1</span></a><p class="fc-breadcrumbs__step-title">Pilih Kategori</p>
                    </li>
                    <li class="four-step disabled"><a href="#"><span class="fc-breadcrumbs__icon">2</span></a><p class="fc-breadcrumbs__step-title">Pilih Paket</p>
                    </li>
                    <li class="four-step disabled"><a href="#"><span class="fc-breadcrumbs__icon">3</span></a><p class="fc-breadcrumbs__step-title">Buat Brief</p>
                    </li>
                    <li class="four-step disabled"><a href="#"><span class="fc-breadcrumbs__icon">4</span></a><p class="fc-breadcrumbs__step-title">Konfirmasi Pemesanan</p>
                    </li>
                </ul>
            </div>
            <div class="fc-breadcrumbs__step-four container visible-xs">
                <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                    <li class="four-step is-active"><a href="#">
                        <p class="fc-breadcrumbs__step-title">Kategori</p>
                    </a></li>
                    <li class="icon"><i class="fa fa-angle-right"></i></li>
                    <li class="four-step disabled"><a href="#">
                        <p class="fc-breadcrumbs__step-title">Paket</p>
                    </a></li>
                    <li class="icon"><i class="fa fa-angle-right"></i></li>
                    <li class="four-step disabled"><a href="#">
                        <p class="fc-breadcrumbs__step-title">Brief</p>
                    </a></li>
                    <li class="icon"><i class="fa fa-angle-right"></i></li>
                    <li class="four-step disabled"><a href="#">
                        <p class="fc-breadcrumbs__step-title">Konfirmasi</p>
                    </a></li>
                </ul>
            </div>
            <!--views/launch/launch/index-->
                <div class="fl-launch">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h1 class="fc-heading__bright--sm">Apa jenis desain yang Anda butuhkan?</h1>
                                <div class="col-lg-12 fl-launch__col-lg">
                                    <div class="col-lg-6">
                                        <h1 class="fl-launch__name">1. Logo &amp; Identitas Branding</h1>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <h2 class="fl-launch__subtitle">Mulai bisnis/startup Anda dengan membuat logo yang unik dan mudah diingat</h2>
                                        </div>
                                        <div class="col-lg-3"><a class="fl-launch__portfolio u-mr--20" data-target=".modal-logo" data-toggle="modal">Lihat Portofolio</a></div>
                                    </div>
                                    <asp:LinkButton ID="btnLogo" OnClick="btnLogo_Click" runat="server">
                                <div class="col-sm-6">
                                    <div class="fl-launch__box">
                                        <div class="fl-launch__icon">
                                            <img alt="Client-Sribu" data-title="Desain Logo" src="./Template_User/Order_PilihKat_files/icon_logo-design-6ea944906b4333654b4e715430a76c835e1b15bd07f63a04d925a3952740fa39.svg" width="50" height="50">
                                        </div>
                                        <div class="fl-launch__text">
                                            <h1 class="fl-launch__title"><strong>Desain Logo</strong></h1>
                                            <p class="fl-launch__info">Logo berkualitas dan unik. Cocok untuk usaha baru dan rebranding di semua industri.</p>
                                        </div>
                                    </div>
                                </div>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnKopSurat" OnClick="btnKopSurat_Click" runat="server">

                                <div class="col-sm-6">
                                    <div class="fl-launch__box">
                                        <div class="fl-launch__icon">
                                            <img alt="Client-Sribu" data-title="Desain Kartu Nama &amp; Kop Surat" src="./Template_User/Order_PilihKat_files/icon_stationery-design-1783fd02b7a4c8df16a9c512b73c4a388d135d256be8eacc7b63b0e265d7b28e.svg" width="50" height="50">
                                        </div>
                                        <div class="fl-launch__text">
                                            <h1 class="fl-launch__title"><strong>Desain Kartu Nama &amp; Kop Surat</strong></h1>
                                            <p class="fl-launch__info">Kartu nama, kop surat, amplop, map folder, cap, nota, invoice.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                    </asp:LinkButton>
                                    <div class="clearfix"></div>
                                    <div class="col-lg-6">
                                        <h1 class="fl-launch__name">2. Bisnis &amp; Marketing</h1>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <h2 class="fl-launch__subtitle">Promosikan brand Anda dengan materi marketing yang berkualitas tinggi</h2>
                                        </div>
                                        <div class="col-lg-3"><a class="fl-launch__portfolio u-mr--20" data-target=".modal-business-marketing" data-toggle="modal">Lihat Portofolio</a></div>
                                    </div>
                                    <asp:LinkButton ID="btnBanner" OnClick="btnBanner_Click" runat="server">

                                <div class="col-sm-6">
                                    <div class="fl-launch__box">
                                        <div class="fl-launch__icon">
                                            <img alt="Client-Sribu" data-title="Desain Banner" src="./Template_User/Order_PilihKat_files/icon_banner-ads-3997051768630baca0136bf889492278e6039be1aceebfa5a5999923f13152b3.svg" width="50" height="50">
                                        </div>
                                        <div class="fl-launch__text">
                                            <h1 class="fl-launch__title"><strong>Desain Banner</strong></h1>
                                            <p class="fl-launch__info">Banner ad, web banner, signage, billboard dan banner lainnya.</p>
                                        </div>
                                    </div>
                                </div>
                                    </asp:LinkButton>
                                    <a href="/flyer-brochure-design/packages">

                                        <div class="clearfix"></div>
                                    </a>

















                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            <div class="modal fade fc-modal-fs modal-logo" role="dialog" tabindex="-1">
                <div class="modal-dialog fc-modal-fs__dialog">
                    <div class="modal-content fc-modal-fs__content">
                        <div class="modal-header">
                            <div class="container">
                                <button aria-label="Close" class="u-mt--10 close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h1 class="modal-title fc-heading__bright--sm">Logo &amp; Brand Identity</h1>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <ul class="list-inline text-center">
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/1-2cb5576b6f507cf0cf5467d34bb5496e91ba9b76669f76249fd30ad052dafae4.jpg">
                                        </div>
                                        <span>Logo Chicken Town</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/2-e782e469a66171f86a1b1b8fd409151999936a0e9922718f38206f87199bbcf5.jpg">
                                        </div>
                                        <span>Logo Reborn Workshop</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/3-c96bd7a4d8050ace1efd7910868489267be82caaf6106dd0cac075eda337a6c9.jpg">
                                        </div>
                                        <span>Logo Transmania</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/4-5505a3218d266a9c850c4aed4263fd29e512cc513a3940440eeaf3c4b57241fe.jpg">
                                        </div>
                                        <span>Logo Yolo</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/5-b8cb9e1074ed13bfe0124614a1efa4af223e38e7b5f27235a19e448b794a1086.jpg">
                                        </div>
                                        <span>Member Card Tiket.com</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/6-f8b928b849387ae95a0ea5b8a5cb385619a8548c90ab40cf5cffa5701a960e0d.jpg">
                                        </div>
                                        <span>Business Card Bayu Buana</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/7-d4038707ebe68a0038c6637272f88a943f6b2a1e8b07deae4f053f102df752ba.jpg">
                                        </div>
                                        <span>Business Card Putra Mandala</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/8-643b3722065bb4bf0321f5b29da84ae8592d8dc482a11c8b70f0751f4bf10d0d.jpg">
                                        </div>
                                        <span>Business Card SICM</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container">
                                <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade fc-modal-fs modal-business-marketing" role="dialog" tabindex="-1">
                <div class="modal-dialog fc-modal-fs__dialog">
                    <div class="modal-content fc-modal-fs__content">
                        <div class="modal-header">
                            <div class="container">
                                <button aria-label="Close" class="u-mt--10 close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h1 class="modal-title fc-heading__bright--sm">Business &amp; Marketing</h1>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <ul class="list-inline text-center">
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/1-9ec072e2088f21fe02d53d6c7a61556c04970d75144dbac1ef91e864088243d8.jpg">
                                        </div>
                                        <span>X-Banner Crown Sky</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/2-2a350b787ce68d2b04a152dc3b8bb3abf289900fd1ef2c07016ee233be167da6.jpg">
                                        </div>
                                        <span>Banner Coffindo</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/3-ca00fa66970e7c0ca0529466873919f4121ba8334305f406655b0831f304f871.jpg">
                                        </div>
                                        <span>Flyer Hyde Park</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/4-7673196ea2c8b55f146bf188e23e3f17c6c2520617dd88bcad9a43e435ef0993.jpg">
                                        </div>
                                        <span>Brochure Perumahan Binong</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/5-0b370174f72b490b6d7bb6d3ef095d5b5173cf9d3ddded0715c6881f3c358338.jpg">
                                        </div>
                                        <span>Company Profile PLH Logistic</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/6-1576ab4980d1f32f07309f9df1c4a1e3f843fd85f48cdcfb394f9affdd6f93cb.jpg">
                                        </div>
                                        <span>Mascot Cimory</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/7-6c2329315abc32e1e5db62418d130a2294982e3656ae30072fa9e087f3249891.jpg">
                                        </div>
                                        <span>Poster Dompet Dhuafa</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/8-4bd69a68224cf918d5b00c9f2b1c3f8c6a7c49c9779f490e46d890a0908b2aa2.jpg">
                                        </div>
                                        <span>Kartu Lebaran Premi Air</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container">
                                <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade fc-modal-fs modal-product" role="dialog" tabindex="-1">
                <div class="modal-dialog fc-modal-fs__dialog">
                    <div class="modal-content fc-modal-fs__content">
                        <div class="modal-header">
                            <div class="container">
                                <button aria-label="Close" class="u-mt--10 close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h1 class="modal-title fc-heading__bright--sm">Packaging &amp; Label</h1>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <ul class="list-inline text-center">
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/1-814b09766ebe947d7dea8013dcdc3d997a8eb5cd91c54175bf7dcd354c449698.jpg">
                                        </div>
                                        <span>Label Shirt Dennis</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/2-9257af08f5f01904eab19a90a874d30b08a662817df731fd4ef7c7da2173950d.jpg">
                                        </div>
                                        <span>Label Bodywash Packaging</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/3-404403dc6966e141e2516bf4c30cdaa5b042a3b1b439cd732512bdb06dd05d8b.jpg">
                                        </div>
                                        <span>Label Skipjack Tuna</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/4-db9b98a2fd77059e3f6cbbd5240e61278bdfde94081152c66c1a1b623a668af7.jpg">
                                        </div>
                                        <span>Packaging Deka Tani Karung Beras</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/5-264abdd5d369e6ed37bf464b0f6baf41d6fe3ff1c3278a7d4af0b7b2a95323d0.jpg">
                                        </div>
                                        <span>Packaging De Briquettes</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/6-a061279eec617f32938c1881a36311486684294a7d8363819d64ca8ae303d6e8.jpg">
                                        </div>
                                        <span>Packaging Green Magic</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/7-e7cafa374af70ae347a907bd769fa3dc422657a759bcc76450933946dfb888c4.jpg">
                                        </div>
                                        <span>Product Design USB Name Card</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/8-2f62a381742beed1df0c98002b65be23abca2154e8b04e30e5f29ba7183b3212.jpg">
                                        </div>
                                        <span>Shoes Rack untuk Smart Home</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container">
                                <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade fc-modal-fs modal-website-apps" role="dialog" tabindex="-1">
                <div class="modal-dialog fc-modal-fs__dialog">
                    <div class="modal-content fc-modal-fs__content">
                        <div class="modal-header">
                            <div class="container">
                                <button aria-label="Close" class="u-mt--10 close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h1 class="modal-title fc-heading__bright--sm">Website &amp; App Design</h1>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <ul class="list-inline text-center">
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/1-bcf0daceb21417130ac5015b49428d2a32d65b472514a3909d4e5ef0b5d8540e.jpg">
                                        </div>
                                        <span>Mobile App Design Dokter Umum Padi</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/2-be87f2e0c0c3044110154f97aadd074d2d3f412096764e17047430531f4463cc.jpg">
                                        </div>
                                        <span>Mobile App Design My Corz</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/3-0286282e3f2b6fd3e39785657bc22da410f2b6b60ad2517d783dee8663bf6c2a.jpg">
                                        </div>
                                        <span>LMobile App Design My Corz 2</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/4-6325a7cef675e7aa40d5930623073b8c93cf40a1974473395ed338313e0b429e.jpg">
                                        </div>
                                        <span>Mobile App Design Dokter Umum Padi 2</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/5-38a0ff9504f9e07b240d09b1fc2e2e28b5666e28dbef89aed411f0d2d2dd91f5.jpg">
                                        </div>
                                        <span>Website Design InTouch</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/6-8013dc7f7c3d235bd17c90e95e255a7ac1a1185be252706fb0685be98b6e4004.jpg">
                                        </div>
                                        <span>PWebsite Design JHS Legal</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/7-236c158bee90adf2bb5a5f98b986663fb0e521f11ce876709709884d2dfb1ba6.jpg">
                                        </div>
                                        <span>Website Design Greenpad</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/8-5eea80873696f6f36c283b9b4fbc8c90350837ab1b86335e1080dc03390bbad6.jpg">
                                        </div>
                                        <span>Website Design www.viktori-profindo.com</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container">
                                <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade fc-modal-fs modal-clothing-merchandising" role="dialog" tabindex="-1">
                <div class="modal-dialog fc-modal-fs__dialog">
                    <div class="modal-content fc-modal-fs__content">
                        <div class="modal-header">
                            <div class="container">
                                <button aria-label="Close" class="u-mt--10 close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h1 class="modal-title fc-heading__bright--sm">Clothing &amp; Merchandising</h1>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <ul class="list-inline text-center">
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/1-1e603663547dcdc2897e003127c1be1594cb3d238d959cb112d7cd85fb992014.jpg">
                                        </div>
                                        <span>Calendar Bayu Buana 2012</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/2-d9b5a62978ef3f746e3d61058b7f56ab8404e6c2ff69cce4252ff547210117d6.jpg">
                                        </div>
                                        <span>Calendar TFCA</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/3-fc7a975bed13ea53a6e76e65f3804329c23c0f4e11048a998388198960f4ec57.jpg">
                                        </div>
                                        <span>Calendar Perusahaan Arga Solusi</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/4-02604b9d1b9ed4e047213b3cbd690f27ceecf1564ce4ab492be382799bc85fde.jpg">
                                        </div>
                                        <span>T-shirt Telkomsel</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/5-90fb467dd5f0b0755c5e788df9c2fed0b5da26fd845ad0e628851e0aa44d8d1c.jpg">
                                        </div>
                                        <span>Uniform Office Pertamina</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/6-b955701052309344181655c6e6564e5fbe343f4c673f714921defe8139d1108d.jpg">
                                        </div>
                                        <span>Uniform Event Jasamarga</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/7-6a6fbd6bbd26b3cd821afc33e7a2cf4c2fcbb89e7e033694727ad588bb884430.jpg">
                                        </div>
                                        <span>Merchandising Design Crown Sky</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/8-cc585abc5b2ab3b77556d93b733a1e16ed4023e0ca7d11f70fbad7b702874395.jpg">
                                        </div>
                                        <span>Merchandising Tropicana Slim</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container">
                                <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade fc-modal-fs modal-others" role="dialog" tabindex="-1">
                <div class="modal-dialog fc-modal-fs__dialog">
                    <div class="modal-content fc-modal-fs__content">
                        <div class="modal-header">
                            <div class="container">
                                <button aria-label="Close" class="u-mt--10 close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><h1 class="modal-title fc-heading__bright--sm">Other Designs</h1>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <ul class="list-inline text-center">
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/1-5e4e21091a726149b3953283343cdb58691ed5625b312a245281f86a19f3ff84.jpg">
                                        </div>
                                        <span>Booth Design Advan</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/2-66c20ddf50a2bc3867d6d00b43e110aa99cd54d079bc285a72288a442166bc08.jpg">
                                        </div>
                                        <span>Interior Bread Story Outlet</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/3-45562724a083a00cca2724c247d2d35ffb5dd1f55187ecca9815f039c9f78e77.jpg">
                                        </div>
                                        <span>Interior Rice Bowl Restaurant</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/4-0318979ca9a0cadc6bbe8aebe8f4a17a27a480becbbb1a676d3cf13537ce5f05.jpg">
                                        </div>
                                        <span>Book Cover Happy Leadership</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/5-5e30c72ee59b6f45382109f60de5fac017d78d0a22bf6cc3951e9eaf66673d5a.jpg">
                                        </div>
                                        <span>Book Cover Sumargo Consulting</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/6-89f469c0f10620d74d46597a3a12bb75b19840e77ebf636e2b4283437c353381.jpg">
                                        </div>
                                        <span>Car Branding Enak Aja Food</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/7-522d557ce73d08ca0463f707b3147fd70d8bd74716765d8e72bf787e59191cf1.jpg">
                                        </div>
                                        <span>Desain Emoticon</span></li>
                                    <li>
                                        <div class="fc-entries__thumbnails u-mt--20 u-mr--5 u-ml--5">
                                            <img alt="Create Yours" class="img-responsive" src="./Template_User/Order_PilihKat_files/8-2e6b5c2d00c12ca18333a5b5dbd84cef18a2a09adbc7ec2de2a956cb2b31daeb.jpg">
                                        </div>
                                        <span>Stiker Aeropolis</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container">
                                <button class="btn btn-danger" data-dismiss="modal" type="button">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>ga('require', 'ec')
                ga('ec:addImpression', { 'name': 'Untitled Contest Category' })
                ga('ec:addProduct', { 'name': 'Untitled Contest Category' })
                ga('ec:setAction', 'detail')
                ga('send', 'pageview') </script>
        </div>
</asp:Content>
