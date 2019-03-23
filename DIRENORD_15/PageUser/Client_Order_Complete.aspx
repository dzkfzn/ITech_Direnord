<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Order_Complete.aspx.cs" Inherits="PageUser_Client_Order_Complete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" Runat="Server">
    <div class="fl-main-page with-hellobar">
            <!--views/layouts/breadcrumbs/contest_breadcrumbs-->
            <div class="fc-breadcrumbs__step-four container hidden-xs">
                <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                    <li class="four-step is-success"><a href="https://www.Direnord.com/id/launch"><span class="fc-breadcrumbs__icon">1</span></a><p class="fc-breadcrumbs__step-title">Pilih Kategori</p>
                    </li>
                    <li class="four-step is-success"><a href="https://www.Direnord.com/id/payments/thank-you?order_id=5bedee0cfaaa264b6bad73e3#"><span class="fc-breadcrumbs__icon">2</span></a><p class="fc-breadcrumbs__step-title">Pilih Paket</p>
                    </li>
                    <li class="four-step is-success"><a href="https://www.Direnord.com/id/payments/thank-you?order_id=5bedee0cfaaa264b6bad73e3#"><span class="fc-breadcrumbs__icon">3</span></a><p class="fc-breadcrumbs__step-title">Buat Brief</p>
                    </li>
                    <li class="four-step is-completed"><a href="https://www.Direnord.com/id/payments/select_payment"><span class="fc-breadcrumbs__icon">4</span></a><p class="fc-breadcrumbs__step-title">Konfirmasi Pemesanan</p>
                    </li>
                </ul>
            </div>
            <div class="fc-breadcrumbs__step-four container visible-xs">
                <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                    <li class="four-step is-success"><a href="https://www.Direnord.com/id/launch">
                        <p class="fc-breadcrumbs__step-title">Kategori</p>
                    </a></li>
                    <li class="icon"><i class="fa fa-angle-right"></i></li>
                    <li class="four-step is-success"><a href="https://www.Direnord.com/id/payments/thank-you?order_id=5bedee0cfaaa264b6bad73e3#">
                        <p class="fc-breadcrumbs__step-title">Paket</p>
                    </a></li>
                    <li class="icon"><i class="fa fa-angle-right"></i></li>
                    <li class="four-step is-success"><a href="https://www.Direnord.com/id/payments/thank-you?order_id=5bedee0cfaaa264b6bad73e3#">
                        <p class="fc-breadcrumbs__step-title">Brief</p>
                    </a></li>
                    <li class="icon"><i class="fa fa-angle-right"></i></li>
                    <li class="four-step is-completed"><a href="https://www.Direnord.com/id/payments/select_payment">
                        <p class="fc-breadcrumbs__step-title">Konfirmasi</p>
                    </a></li>
                </ul>
            </div>
            <!--views/payments/payments/thank_you-->
            <div class="fl-payment-done">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 class="fc-heading__bright--sm">Terima kasih atas kepercayaan Anda menggunakan jasa Direnord!</h1>
                            <p class="fc-subheading">Kami sedang memproses pesanan Anda. Anda bisa langsung save atau print invoice dan bukti pembayaran.</p>
                        </div>
                        <div class="col-sm-12 u-mt--20">
                            <h1 class="fc-heading__bright--sm">Tahap Selanjutnya</h1>
                            <ul class="u-mt--10 list-unstyled">
                                <li>
                                    <p class="fc-subheading">1. Tim kami akan memeriksa kembali brief kreatif yang telah Anda buat untuk memastikan kelengkapannya. Brief yang jelas dan detail dapat mempermudah desainer untuk memahami kebutuhan desain yang Anda inginkan dengan tepat - sehingga kualitas hasil desain yang Anda dapatkan lebih sesuai.</p>
                                </li>
                                <li>
                                    <p class="fc-subheading">2. Kontes akan langsung dijalankan dalam kurang dari 12 jam. Anda akan menerima email pemberitahuan dari direnord.information@gmail.com apabila kontes sudah dimulai.</p>
                                </li>
                                <li>
                                    <p class="fc-subheading">3. Jika kami membutuhkan informasi tambahan mengenai brief Anda, kami akan menghubungi Anda melalui email atau telepon.</p>
                                </li>
                            </ul>
                            <a data-no-turbolink="true" class="btn btn-lg btn-default u-mb--10 u-mt--20 u-mr--10" href="Client_Lihat_Order.aspx">Lihat Transaksi Saya</a><a class="btn btn-lg btn-success u-mb--10 u-mt--20" href="Client_Lihat_Kontes.aspx">Show My Order</a></div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

