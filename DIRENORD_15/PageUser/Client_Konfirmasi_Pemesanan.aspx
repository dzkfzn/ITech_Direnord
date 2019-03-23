<%@ Page Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Client_Konfirmasi_Pemesanan.aspx.cs" Inherits="PageUser_PageClient_Konfirmasi_Pemesanan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar">
        <!--views/layouts/breadcrumbs/contest_breadcrumbs-->
        <div class="fc-breadcrumbs__step-four container hidden-xs">
            <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch"><span class="fc-breadcrumbs__icon">1</span></a><p class="fc-breadcrumbs__step-title">Pilih Kategori</p>
                </li>
                <li class="four-step is-success"><a href=""><span class="fc-breadcrumbs__icon">2</span></a><p class="fc-breadcrumbs__step-title">Pilih Paket</p>
                </li>
                <li class="four-step is-success"><a href=""><span class="fc-breadcrumbs__icon">3</span></a><p class="fc-breadcrumbs__step-title">Buat Brief</p>
                </li>
                <li class="four-step is-active"><a href=""><span class="fc-breadcrumbs__icon">4</span></a><p class="fc-breadcrumbs__step-title">Konfirmasi Pemesanan</p>
                </li>
            </ul>
        </div>
        <div class="fc-breadcrumbs__step-four container visible-xs">
            <ul class="nav nav-tabs fc-breadcrumbs__tabs" role="tablist">
                <li class="four-step is-success"><a href="https://www.sribu.com/id/launch">
                    <p class="fc-breadcrumbs__step-title">Kategori</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step is-success"><a href="">
                    <p class="fc-breadcrumbs__step-title">Paket</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step is-success"><a href="">
                    <p class="fc-breadcrumbs__step-title">Brief</p>
                </a></li>
                <li class="icon"><i class="fa fa-angle-right"></i></li>
                <li class="four-step is-active"><a href="">
                    <p class="fc-breadcrumbs__step-title">Konfirmasi</p>
                </a></li>
            </ul>
        </div>
        <!--views/payments/payments/summary-->
        <div class="fl-payment">
            <div class="container">
                <div class="row">
                    <div class="hidden-xs hidden-sm">
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-9 fl-payment__invoice" style="padding: 0;">
                            <div class="payment-tab-container" style="margin: 0;">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 payment-tab-menu">
                                    <div class="list-group">

                                        <asp:Repeater ID="rptMenuSamping" runat="server">
                                            <ItemTemplate>
                                                <asp:LinkButton
                                                    OnClick="btnMenu_Click"
                                                    ID="btnMenu"
                                                    runat="server"
                                                    CssClass="list-group-item text-center"
                                                    CausesValidation="false"
                                                    OnClientClick="return changeColor(this);"
                                                    CommandArgument='<%# Eval("BankID") %>'><%# Eval("BankName") %></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <script type="text/javascript">
                                            function changeColor(e) {
                                                e.setAttribute("class", "list-group-item text-center active");
                                            }
                                        </script>


                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 payment-tab" style="background-color: white; position: relative;">

                                    <div class="payment-tab-content active">
                                        <asp:Image CssClass="img-responsive fl-payment__detail-logo" runat="server" Width="150" ID="gambarBank" ImageUrl="#" />

                                        <h3 id="bankTitle" runat="server">BCA</h3>
                                        <ul>
                                            <li>Pembayaran dapat dilakukan melalui ATM/Internet Banking/m-banking</li>
                                            <li>Direnord akan menyimpan pembayaran Anda sampai kontes yang Anda jalankan selesai</li>
                                            <li>Proses verifikasi manual, harap lakukan konfirmasi setelah Anda melakukan pembayaran.</li>
                                        </ul>
                                        <div class="va-detail">
                                            <p>
                                                Account Number<br>
                                                <span class="data" id="txtNorek" runat="server"></span>
                                            </p>
                                            <p>
                                                Account Name<br>
                                                <span class="data">Direnord Digital Design</span>
                                            </p>
                                            <p>
                                                Total Transfer<br>
                                                <span class="data" id="txtTotalTransfer" runat="server">IDR 
                                                </span>
                                            </p>
                                            <p>&nbsp;</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <p>Sudah melakukan pembayaran?</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <asp:Button 
                                                    ID="btnKonfirmasi" 
                                                    runat="server" 
                                                    CssClass="btn btn-lg btn-block btn-success fl-payment__btn-completed bt-payment-other" 
                                                    data-toggle="modal" 
                                                    data-target="#modal-confirmation" 
                                                    Text="Konfirmasi Pembayaran" 
                                                    OnClientClick="return false;" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-9" style="background-color: white; position: relative;">
                            <div class="fl-payment__invoice">
                                <!--views/payments/payments/summaries/contest_summary-->
                                <div class="fl-payment__summary">
                                    <p>
                                        <b>Order ID:</b><br>
                                        <asp:Label ID="txtOrderID" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p class="u-mt--15">
                                        <b>Judul Kontes: </b>
                                        <br>
                                        <asp:Label ID="txtJudulKontes" runat="server" Text=""></asp:Label>
                                    </p>
                                    <p class="u-mt--15">
                                        <b>Durasi Kontes: </b>
                                        <br>
                                        <asp:Label ID="txtDurasiKontes" runat="server" Text=""></asp:Label>
                                        days
                                    </p>


                                </div>
                                <div class="box-left-red">
                                    <!--views/orders/orders/details/contest_order-->
                                    <table class="table table-responsive u-mt--30">
                                        <thead>
                                            <tr class="fl-payment__invoice-header">
                                                <th><span>Items</span></th>
                                                <th><span>Price</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="fl-payment__invoice-item">
                                                <td><span>Pembayaran Desainer</span></td>
                                                <td><span id="txtBiayaDesigner" runat="server">IDR 

                                                </span></td>
                                            </tr>
                                            <tr class="fl-payment__invoice-item">
                                                <td><span>Biaya Transaksi</span></td>
                                                <td><span id="txtBiayaAdmin" runat="server">IDR 
                                                </span></td>
                                            </tr>

                                            <tr class="fl-payment__invoice-header hidden-for-additional-charge">
                                                <td><span>Total (Nett)</span></td>
                                                <td><span id="txtBiayaTotal" runat="server">IDR 
                                                </span></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-center"><a class="btn btn-default fl-payment__btn-download" target="_blank" href="https://www.sribu.com/id/orders/proforma_invoices/5bedee0cfaaa264b6bad73e4.pdf?h=f3ceb8b3c1c1ff69153b36a4">Download Proforma Invoice</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal-confirmation" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span></button><div class="container">
                            <h1 class="modal-title fc-heading__bright--sm heading-confirmation">Konfirmasi Pembayaran</h1>
                        </div>
                    </div>
                    <div class="modal-body">
                        <input name="utf8" type="hidden" value="✓">
                        <input type="hidden" name="authenticity_token" value="UKbqCY/PzffCZiNG4bCWPhDMg5ygSy9Y6/jhQICRTjuIqf6nTnUAlzqzuE85fyQCcsrMYDx13+jQS2ZWhXTYZw==">
                        <input type="hidden" name="order_id" id="order_id" value="5bedee0cfaaa264b6bad73e3">
                        <input type="hidden" name="from_confirmation_page" id="from_confirmation_page" value="true">
                        <div class="form-group text-center">
                            <input class="upload_url" name="upload_url" type="hidden" value="/id/payments/add_attachment">
                            <input class="payment_id" name="payment_id" type="hidden" value="">
                            <input class="payment_confirmation_id" name="payment_confirmation_id" type="hidden" value="">
                            <input class="payment_method_type" name="payment_method_type" type="hidden" value="other">
                            <span class="btn btn-default fileinput-button"><i style="margin-right: 5px;" class="fa fa-paperclip"></i>
                                <span>Upload Bukti Pembayaran</span>
                                <asp:FileUpload runat="server" ClientIDMode="Static" ID="fuReferensi" AllowMultiple="true" />

                            </span>
                            <div class="gallery"></div>

                        </div>
                        <p class="u-mt--30 u-mb--30 text-center">- atau isi form di bawah ini -</p>
                        <div class="form-group">
                            <label for="sender_name">Rekening Atas Nama</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="valInp_NamaBarang" ControlToValidate="txtSenderName" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <asp:TextBox ID="txtSenderName" CssClass="form-control input-lg" placeholder="Nama rekening Anda" runat="server" />

                        </div>
                        <div class="form-group">
                            <label for="bank_name">Nama Bank Asal</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtBankName" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <asp:TextBox ID="txtBankName" CssClass="form-control input-lg" placeholder="Nama bank yang Anda gunakan" runat="server" />
                        </div>
                        <div class="form-group">
                            <label for="amount">Total Pembayaran</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtJumlah" Text="(Harus diisi)"
                                Display="Dynamic" runat="server" ForeColor="Red" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtJumlah" ErrorMessage="(Hanya Angka)"
                                        Display="Dynamic" runat="server" ForeColor="Red" ValidationExpression="\d+" />
                            <asp:TextBox ID="txtJumlah" CssClass="form-control input-lg" placeholder="Jumlah yang Anda transfer" runat="server" />
                        </div>
                        <%--<div class="form-group">
                            <label for="date">Tanggal Transfer</label>
                            <span style="color: red" class="glyphicon-asterisk"></span>
                            <div class="input-group date" id="myDatepicker2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtJumlah" Text="(Harus diisi)"
                                    Display="Dynamic" runat="server" ForeColor="Red" />
                                <asp:TextBox TextMode="DateTime" ID="txtDate" CssClass="form-control pc-datepicker" placeholder="Jumlah yang Anda transfer" runat="server" />
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <asp:Button ID="btnKonfirmasiPembayaran" CssClass="btn btn-lg btn-block btn-success fl-payment-confirm__btn" Text="Konfirmasi Pembayaran" OnClick="btnKonfirmasiPembayaran_Click" runat="server" />

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
