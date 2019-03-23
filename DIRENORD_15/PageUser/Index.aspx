<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="PageUser_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <!--views/home/index-->
    <div class="fl-hero">
        <div class="bx-wrapper" style="max-width: 100%;">
            <div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 499px;">
                <ul class="fl-hero__slider" style="width: auto; position: relative;">
                    <li class="u-md__pt--15 u-md__pb--10 u-mt--30-i" aria-hidden="false" style="float: none; list-style: none; position: absolute; width: 1499px; z-index: 50; display: block;">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 col-md-5">
                                    <h1 class="fl-hero__title hidden-xs">Solusi Jasa Desain Berkualitas<br>
                                        Melayani Anda 24 Jam / 7 Hari</h1>
                                    <h1 class="fl-hero__title visible-xs">Solusi Jasa Desain Berkualitas<br>
                                        Melayani Anda 24 Jam / 7 Hari</h1>
                                    <p class="fl-hero__subtitle">Logo, website, kemasan dan 20 kategori desain lainnya</p>
                                    <div class="fl-hero__video visible-xs">
                                            <img class="img-responsive" style="width: 100%;" src="./Template_User/Index/index1.jpg" ></a>
                                    </div>
                                    <ul class="list-unstyled fl-hero__benefits">
                                        <li><i class="fa fa-check"></i>
                                            <p class="fl-hero__benefits-text">Puluhan desain berkualitas dalam 7 hari</p>
                                        </li>
                                        <li><i class="fa fa-check"></i>
                                            <p class="fl-hero__benefits-text">Desain pertama dalam 1 jam</p>
                                        </li>
                                        <li><i class="fa fa-check"></i>
                                            <p class="fl-hero__benefits-text">Revisi desain tanpa batas</p>
                                        </li>
                                        <li><i class="fa fa-check"></i>
                                            <p class="fl-hero__benefits-text">
                                                Cocok untuk semua bisnis. UKM,<br>
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restoran, startup IT dan lainnya</span>
                                            </p>
                                        </li>
                                    </ul>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div id="divTranOrd" runat="server">
                                                <a class="btn btn-lg btn-block btn-success u-mt--20 u-mb--15" href="./Client_Order_PilihKat.aspx">Order Desain<br>
                                                <div class="small">Lihat Harga</div></a>
                                            </div>
                                            
                                            <div id="divLihatKon0" runat="server">
                                                <a class="btn btn-lg btn-block btn-success u-mt--20 u-mb--15" href="./Designer_Exam.aspx">Lihat Kontes</a>
                                            </div>

                                            <div id="divLihatKon1" runat="server">
                                                <a class="btn btn-lg btn-block btn-success u-mt--20 u-mb--15" href="./Designer_Exam_Success.aspx">Lihat Kontes</a>
                                            </div>

                                            <div id="divLihatKon2" runat="server">
                                                <a class="btn btn-lg btn-block btn-success u-mt--20 u-mb--15" href="./Designer_Lihat_Kontes.aspx">Lihat Kontes</a>
                                            </div>
                                                
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-7 hidden-xs">
                                    <div class="fl-hero__video">
                                            <img class="img-responsive" style="width: 100%;" src="./Template_User/Index/index1.jpg" ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="bx-controls"></div>
        </div>
    </div>
    <div class="modal fade" id="modal-portfolio-client-list" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content"></div>
        </div>
    </div>




    <div class="fl-hiw-home">
        <div class="container">
            <div class="fl-hiw-home__wrapper">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="fc-heading__bright--md">Cara Kerja Direnord</h1>
                        <p class="fc-subheading">Hanya dalam 3 langkah mudah, Anda dapat mendapatkan desain berkualitas</p>
                    </div>
                </div>
            </div>
            <div class="row fl-hiw-home__content">
                <div class="col-sm-4">
                    <img alt="How it Works-Sribu" class="img-lazy fl-hiw__icon" data-src="https://www.sribu.com/assets/hiw/icon_client_1-47110519509258c3c4d26bd65e49f3fda768cfec59f990ee0c4f59b8b80ccc27.svg" src="./Template_User/Index/icon_client_1-47110519509258c3c4d26bd65e49f3fda768cfec59f990ee0c4f59b8b80ccc27.svg" width="150" height="150"><h3 class="fl-hiw-home__info-title">1. Jelaskan Kebutuhan Desain</h3>
                    <p class="fl-hiw-home__info-subtitle">Jelaskan tentang desain yang Anda inginkan melalui brief yang kami sediakan saat membuat kontes.</p>
                    <ul class="list-unstyled hidden-xs">
                        <li><i class="fa fa-check text-danger"></i><span class="fl-hiw-home__info-detil">Desain pertama dalam 1 jam</span></li>
                        <li><i class="fa fa-check text-danger"></i><span class="fl-hiw-home__info-detil">Tim kami siap membantu 24/7</span></li>
                    </ul>
                </div>
                <div class="col-sm-4">
                    <img alt="How it Works-Sribu" class="img-lazy fl-hiw__icon" data-src="https://www.sribu.com/assets/hiw/icon_client_2-11c378551594305a02f7078fe670b7bc7dd3356f80917afec5df298b59bd21c0.svg" src="./Template_User/Index/icon_client_2-11c378551594305a02f7078fe670b7bc7dd3356f80917afec5df298b59bd21c0.svg" width="150" height="150"><h3 class="fl-hiw-home__info-title">2. Bandingkan &amp; Beri Feedback</h3>
                    <p class="fl-hiw-home__info-subtitle">Dapatkan lebih 100+ pilihan desain berkualitas selama kontes berjalan dalam 7 hari. Anda dapat memberikan rating pada desain yang masuk dan feedback untuk para desainer.</p>
                    <ul class="list-unstyled hidden-xs">
                        <li><i class="fa fa-check text-danger"></i><span class="fl-hiw-home__info-detil">Dapatkan 100+ desain untuk dipilih</span></li>
                        <li><i class="fa fa-check text-danger"></i><span class="fl-hiw-home__info-detil">Desainer terverifikasi</span></li>
                    </ul>
                </div>
                <div class="col-sm-4">
                    <img alt="How it Works-Sribu" class="img-lazy fl-hiw__icon" data-src="https://www.sribu.com/assets/hiw/icon_client_3-aeba3ca9b98bbc08c5a1d00acdf8c20e7835355cb3f0c4838107c012c2ccd229.svg" src="./Template_User/Index/icon_client_3-aeba3ca9b98bbc08c5a1d00acdf8c20e7835355cb3f0c4838107c012c2ccd229.svg" width="150" height="150"><h3 class="fl-hiw-home__info-title">3. Pilih Desain Favorit</h3>
                    <p class="fl-hiw-home__info-subtitle">Pilih desain yang Anda suka sebagai pemenang kontes, dan dapatkan layanan revisi tanpa batas sampai desain tersebut memenuhi kebutuhan Anda.</p>
                    <ul class="list-unstyled hidden-xs">
                        <li><i class="fa fa-check text-danger"></i><span class="fl-hiw-home__info-detil">Revisi tanpa batas</span></li>
                        <li><i class="fa fa-check text-danger"></i><span class="fl-hiw-home__info-detil">Garansi uang kembali</span></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"><a class="btn btn-lg btn-info-outline u-mt--40" href="/PageUser/Cara_Kerja.aspx">Lihat Selengkapnya</a></div>
            </div>
        </div>
    </div>
    
</asp:Content>




