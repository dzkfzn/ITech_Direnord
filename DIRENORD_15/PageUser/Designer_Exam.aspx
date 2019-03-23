<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_User.master" AutoEventWireup="true" CodeFile="Designer_Exam.aspx.cs" Inherits="PageUser_PageDesigner_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="isi" runat="Server">
    <div class="fl-main-page with-hellobar">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="fc-alert alert alert-danger u-mb--no u-mt--40 text-center flash">Tolong selesaikan ujian anda terlebih dahulu</div>
                </div>
            </div>
        </div>
        <!--views/members/getstarted/index-->
        <div class="fl-getstarted">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <h1 class="fc-heading__bright--sm">Selamat datang di komunitas Direnord!</h1>
                        <p class="fc-subheading">Kami senang Anda telah bergabung bersama kami. Untuk mengikuti semua kontes di Direnord, Anda diharuskan untuk melewati tahap berikut ini.</p>
                        <div class="fl-getstarted__step fl-getstarted__muted">
                            <div class="fl-getstarted__detail">
                                <a aria-controls="verify-contact-number" aria-expanded="false" class="btn-link fl-getstarted__title-step" data-target="#verify-contact-number" data-toggle="collapse">1. Verifikasi kontak Anda</a><p class="fl-getstarted__subtitle-step">Selesai</p>
                            </div>
                        </div>
                        <div class="fl-getstarted__step fl-getstarted__muted">
                            <div class="fl-getstarted__detail">
                                <a aria-controls="update-profile" aria-expanded="false" class="btn-link fl-getstarted__title-step" data-target="#update-profile" data-toggle="collapse">2. Lengkapi profil publik Anda</a><p class="fl-getstarted__subtitle-step">Membuat kesan pemegang kontes dengan menjelaskan bio singkat Anda.</p>
                            </div>
                        </div>
                        <div class="fl-getstarted__step fl-getstarted__muted">
                            <div class="fl-getstarted__detail">
                                <a aria-controls="codeofconduct" aria-expanded="false" class="btn-link fl-getstarted__title-step" data-target="#codeofconduct" data-toggle="collapse">3. Kode etik desainer</a><p class="fl-getstarted__subtitle-step">Pahami pedoman kami sehingga Anda tidak merugikan siapa pun.</p>
                            </div>
                        </div>
                            <div class="fl-getstarted__step">
                                <div class="fl-getstarted__detail">
                                    <a aria-controls="exam-list" aria-expanded="false" class="btn-link fl-getstarted__title-step" data-target="#exam-list" data-toggle="collapse">4. Berpartisipasi ujian di Direnord</a><p class="fl-getstarted__subtitle-step">Kami akan melakukan tes kecil untuk desainer baru yang telah bergabung, tes ini akan digunakan untuk menguji kemampuan desain grafis Anda.</p>
                                    <div class="collapse in" id="exam-list">
                                        <div class="form-group">
                                            <p class="fl-getstarted__subtitle-step">PS: Direnord tidak akan pernah menggunakan desain Anda untuk keperluan apapun selain untuk kualifikasi ini tanpa seijin Anda terlebih dahulu.</p>
                                            <div aria-multiselectable="true" class="accordion-exam-list panel-group" id="accordion" role="tablist">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading" id="exam-heading-three" role="tab"><a aria-controls="collapseThree" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" data-target="#collapseThree" role="button"><span>Desain Logo</span><span class="pull-right"><i class="fa fa-angle-down"></i></span></a></div>
                                                    <div aria-labelledby="exam-heading-three" class="panel-collapse collapse" id="collapseThree" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                        <div class="panel-body">
                                                            <p class="fc-subheading">Desain Logo Direnord.com</p>
                                                            <h1 class="exam-list-title">Penjelasan mengenai perusahaan dan target marketnya</h1>
                                                            <p class="fc-subheading">Direnord.com adalah website yang menghubungkan antara klien yang membutuhkan desain dan komunitas desainer dari seluruh dunia. Direnord.com menawarkan 20 jenis kategori desain mulai dari logo, website, mascot, poster dan lain-lain. Konsep yang diterapkan di Direnord.com adalah bersifat kontes. Target market kami adalah perusahaan kecil dan menengah dengan total karyawan kurang dari 20 orang, Pengusaha, Entrepreneur dengan usia 24 - 58 tahun.</p>
                                                            <h1 class="exam-list-title">Industri</h1>
                                                            <p class="fc-subheading">Teknologi &amp; Kreatif</p>
                                                            <h1 class="exam-list-title">Ukuran Desain</h1>
                                                            <p class="fc-subheading">1 x 1</p>

                                                            <h1 class="exam-list-title">Warna yang diinginkan</h1>
                                                            <p class="fc-subheading">Warna bebas. Desainer bebas berkreasi dengan warna apapun. namun kami menyukai 3 kombinasi warna yaitu merah gelap, putih dan abu</p>
                                                            <h1 class="exam-list-title">Jenis file yang kami perlukan</h1>
                                                            <p class="fc-subheading">File yg di upload: JPEG atau PNG</p>
                                                            <h1 class="exam-list-title">Unggah File* <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDesainLogo_FileUpload" Text="(Harus diisi)"
                                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroupLogo" /></h1>
                                                            <br />
                                                            <img id="filedesainlogo" src="#" alt="" width="100" height="100" />
                                                            <br />

                                                            <asp:FileUpload
                                                                ID="txtDesainLogo_FileUpload"
                                                                runat="server"
                                                                CssClass="form-control input-lg"
                                                                accept=".png,.jpg,.jpeg,.gif"
                                                                onchange="readURLLogo(this)" />
                                                            <h1 class="exam-list-title">Deskripsi Logo* <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtDesainLogo_Deskripsi" Text="(Harus diisi)"
                                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroupLogo" /></h1>
                                                            
                                                            <asp:TextBox ID="txtDesainLogo_Deskripsi" TextMode="MultiLine" runat="server" CssClass="form-control input-lg" placeholder="Berikan deskripsi singkat dari logo yang anda buat" />
                                                            <asp:Button ID="btnUnggah_DesainLogo" OnClick="btnUnggah_DesainLogo_Click" ValidationGroup="valgroupLogo" runat="server" Text="Unggah Desain" CssClass="btn-block btn-lg btn-success exam-list-button" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading" id="headingFour" role="tab"><a aria-controls="collapseFour" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" data-target="#collapseFour" role="button"><span>Desain Kartu Nama</span><span class="pull-right"><i class="fa fa-angle-down"></i></span></a></div>
                                                    <div aria-labelledby="headingFour" class="panel-collapse collapse" id="collapseFour" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                        <div class="panel-body">
                                                            <p class="fc-subheading">Desain Kartu Nama Tim Direnord.com</p>
                                                            <h1 class="exam-list-title">Penjelasan mengenai desain kartu nama yang kami inginkan</h1>
                                                            <p class="fc-subheading">Informasi yang harus diikutsertakan ke dalam desain kartu nama: </p>
                                                            <ul class="fc-subheading">
                                                                <li>Kami membutuhkan desain kartu nama yang modern dan minimalis</li>
                                                                <li>Desain kartu nama harus memiliki logo dari Direnord.com</li>
                                                                <li>Usahakan tampilkan informasi yang paling penting saja (seperti profesi atau jabatan, nomor telepon atau hape, alamat kantor, nama perusahaan, dan lainnya)</li>
                                                                <li>Pastikan huruf terbaca dengan jelas</li>
                                                            </ul>
                                                            <p></p>
                                                            <h1 class="exam-list-title">Penjelasan mengenai usaha/perusahaan kami:</h1>
                                                            <p class="fc-subheading">Direnord.com adalah website yang menghubungkan antara klien yang membutuhkan desain dan komunitas desainer dari seluruh dunia. Direnord.com menawarkan 20 jenis kategori desain mulai dari logo, website, mascot, poster dan lain-lain. Konsep yang diterapkan di Direnord.com adalah bersifat kontes.</p>
                                                            <h1 class="exam-list-title">Target Market</h1>
                                                            <p class="fc-subheading">Target market kami adalah perusahaan kecil dan menengah dengan total karyawan kurang dari 20 orang. Pengusaha, Entrepreneur dengan usia 24 - 58 tahun.</p>
                                                            <h1 class="exam-list-title">Jenis warna yang kami inginkan</h1>
                                                            <p class="fc-subheading">Warna yang kami inginkan adalah kombinasi dari 2-3 warna apa saja, namun kami menyukai merah gelap dan putih.</p>
                                                            <h1 class="exam-list-title">Ukuran Desain</h1>
                                                            <p class="fc-subheading">90 x 55 mm</p>
                                                            <h1 class="exam-list-title">Jenis file yang kami perlukan</h1>
                                                            <p class="fc-subheading">File yg di upload: JPEG atau PNG</p>

                                                            <h1 class="exam-list-title">Unggah File* <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtDesainKartuNama_FileUpload" Text="(Harus diisi)"
                                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroupKartuNama" /></h1>
                                                            <br />
                                                            <img id="filedesainkartunama" src="#" alt="" width="99" height="55" />
                                                            <br />
                                                            <br />
                                                            <asp:FileUpload
                                                                ID="txtDesainKartuNama_FileUpload"
                                                                runat="server"
                                                                CssClass="form-control input-lg"
                                                                accept=".png,.jpg,.jpeg,.gif"
                                                                onchange="readURLKartuNama(this)" />
                                                            <h1 class="exam-list-title">Deskripsi Kartu Nama* <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtDesainKartuNama_Deskripsi" Text="(Harus diisi)"
                                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroupKartuNama" /></h1>
                                                            <asp:TextBox ID="txtDesainKartuNama_Deskripsi" TextMode="MultiLine" runat="server" CssClass="form-control input-lg" placeholder="Berikan deskripsi singkat dari kartu nama yang anda buat" />
                                                            <asp:Button ID="btnUnggah_DesainKartuNama" OnClick="btnUnggah_DesainKartuNama_Click" ValidationGroup="valgroupKartuNama" runat="server" Text="Unggah Desain" CssClass="btn-block btn-lg btn-success exam-list-button" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading" id="headingFive" role="tab"><a aria-controls="collapseFive" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" data-target="#collapseFive" role="button"><span>Desain Banner</span><span class="pull-right"><i class="fa fa-angle-down"></i></span></a></div>
                                                    <div aria-labelledby="headingFive" class="panel-collapse collapse" id="collapseFive" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                        <div class="panel-body">
                                                            <p class="fc-subheading">Desain Banner Acara Pameran Direnord.com</p>
                                                            <h1 class="exam-list-title">Deskripsi desain banner yang kami inginkan</h1>
                                                            <p class="fc-subheading">Kami ingin desain banner untuk event pameran kami. Event pameran yang kami ikuti adalah acara bisnis atau startup events.</p>
                                                            <h1 class="exam-list-title">Penjelasan mengenai usaha/perusahaan kami</h1>
                                                            <p class="fc-subheading">Direnord.com adalah website yang menghubungkan antara klien yang membutuhkan desain dan komunitas desainer dari seluruh dunia. Direnord.com menawarkan 20 jenis kategori desain mulai dari logo, website, mascot, poster dan lain-lain. Konsep yang diterapkan di Direnord.com adalah bersifat kontes.</p>
                                                            <h1 class="exam-list-title">Target Market</h1>
                                                            <p class="fc-subheading">Target market kami adalah perusahaan kecil dan menengah dengan total karyawan kurang dari 20 orang. Pengusaha, Entrepreneur dengan usia 24 - 58 tahun.</p>
                                                            <h1 class="exam-list-title">Ukuran desain banner yang kami butuhkan</h1>
                                                            <p class="fc-subheading">Ukuran banner yang kami butuhkan adalah 3 x 2 meter</p>
                                                            <h1 class="exam-list-title">Jenis warna yang kami inginkan</h1>
                                                            <p class="fc-subheading">Merah dan putih, atau merah dan orange, atau merah dan hitam, atau merah dan abu - abu.</p>
                                                            <h1 class="exam-list-title">Jenis file yang kami perlukan</h1>
                                                            <p class="fc-subheading">File yg di upload: JPEG atau PNG</p>

                                                            <h1 class="exam-list-title">Unggah File* <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtDesainBanner_FileUpload" Text="(Harus diisi)"
                                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroupBanner" /></h1>
                                                            <br />
                                                            <img id="filedesainbanner" src="#" alt="" width="300" height="200" />
                                                            <br />
                                                            <br />

                                                            <asp:FileUpload
                                                                ID="txtDesainBanner_FileUpload"
                                                                runat="server"
                                                                accept=".png,.jpg,.jpeg,.gif"
                                                                CssClass="form-control input-lg"
                                                                onchange="readURLBanner(this)" />
                                                            <h1 class="exam-list-title">Deskripsi Banner* <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtDesainBanner_Deskripsi" Text="(Harus diisi)"
                                                                Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="valgroupBanner" /></h1>
                                                            <asp:TextBox ID="txtDesainBanner_Deskripsi" TextMode="MultiLine" runat="server" CssClass="form-control input-lg" placeholder="Berikan deskripsi singkat dari banner yang anda buat" />
                                                            <asp:Button ID="btnUnggah_DesainBanner" OnClick="btnUnggah_DesainBanner_Click" ValidationGroup="valgroupBanner" runat="server" Text="Unggah Desain" CssClass="btn-block btn-lg btn-success exam-list-button" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="col-md-5 visible-md visible-lg text-center">
                        <img alt="Design-Direnorda" class="cs-image" src="./Template_User/Exam_First/cs-2-54c1f92d5f056b2de36f3fee10c4fd898e8199a16c91721c1a7843b6d4c6cf4d.png">
                    </div>
                </div>
                <div class="row">
                    <!--views/members/getstarted/modal_upload_exam-->
                    <div aria-hidden="true" aria-label="" class="modal modal-Direnord__fullscreen fade" id="modal_upload_exam" role="dialog" tabindex="-1">
                        <div class="modal-dialog modal-Direnord__dialog">
                            <div class="modal-content modal-Direnord__content">
                                <div class="modal-body modal-Direnord__body">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-8">
                                            <div class="modal-Direnord__header--mobile">
                                                <button class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button><h1 class="modal-Direnord__header-title">Upload Your Design</h1>
                                            </div>
                                            <div class="modal-Direnord__left-bar">
                                                <img id="cropper_canvas"><div class="modal-Direnord__text-dummy">
                                                    <i class="fa fa-image fa-5x"></i>
                                                    <p>PNG, GIF or JPG (RGB)</p>
                                                    <p>Maximum file size of 8mb</p>
                                                </div>
                                                <div class="modal-Direnord__upload-progress">
                                                    <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="0" class="progress-bar progress-bar-success" role="progressbar"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                                <input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="H3JnSHKtfBZaTC1zJs3gA6appCfZlx/X17XFXTL+AUe0mEsz3AvHzJpIrQyen1Y1t2I77EWkLzKjPi5qov7kWQ=="><div class="modal-Direnord__right-bar">
                                                    <div class="modal-Direnord__header">
                                                        <button class="close" data-dismiss="modal" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button><h1 class="modal-Direnord__header-title">Upload Your Design</h1>
                                                    </div>
                                                    <div class="modal-Direnord__content-image">
                                                        <div class="form-group">
                                                            <h1 class="modal-Direnord__label-title">Thumbnail Preview</h1>
                                                            <p class="modal-Direnord__label-subtitle">Your design on contest gallery and profile page</p>
                                                            <div class="modal-Direnord__image-preview">
                                                                <div class="modal-Direnord__dummy-image"><i class="fa fa-image fa-3x"></i></div>
                                                            </div>
                                                            <br>
                                                            <label class="btn btn-default" for="input_image" title="Upload image file">
                                                                <input type="file" name="attachment" id="input_image" accept="image/*" class="sr-only">Choose Image</label>
                                                        </div>
                                                        <div class="form-group">
                                                            <h1 class="modal-Direnord__label-title">Category Design</h1>
                                                            <p class="modal-Direnord__label-subtitle" id="category_label"></p>
                                                            <input class="form-control" id="category" name="category" type="hidden" value="">
                                                        </div>
                                                        <div class="form-group">
                                                            <h1 class="modal-Direnord__label-title">Description Design</h1>
                                                            <p class="modal-Direnord__label-subtitle">Tell your concept about your design</p>
                                                            <textarea class="form-control" cols="40" id="description" name="description" rows="5"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="modal-Direnord__footer">
                                                        <div class="form-group">
                                                            <button class="btn btn-lg btn-block btn-success" type="submit">Upload Desain</button>
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
        </div>
    </div>


    <script>
        function readURLLogo(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#filedesainlogo').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#filePhoto").change(function () {
            readURLLogo(this);
        });
    </script>

    <script>
        function readURLKartuNama(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#filedesainkartunama').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#filePhoto").change(function () {
            readURLKartuNama(this);
        });
    </script>

    <script>
        function readURLBanner(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#filedesainbanner').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#filePhoto").change(function () {
            readURLBanner(this);
        });
    </script>

</asp:Content>














