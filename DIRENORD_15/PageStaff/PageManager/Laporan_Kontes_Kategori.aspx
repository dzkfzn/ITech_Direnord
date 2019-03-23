<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Laporan_Kontes_Kategori.aspx.cs" Inherits="PageStaff_PageManager_Laporan_Kontes_Kategori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Laporan Kontes Kategori - Manager
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://code.highcharts.com/modules/drilldown.js"></script>
    <div class="right_col" role="main">
        <div class="">


            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <div class="x_title">
                                <div class="clearfix"></div>
                                <h3><b>Laporan Jumlah Order pada Bulan Januari Berdasarkan Kategori</b></h3>
                                <div class="row">

                                     <div class="col-md-6 col-sm-6 col-xs-6">
                      
                        <div id="container"></div>

                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <div id="container2"></div>

                    </div>
                                   
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">

        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Jumlah Order Berdasarkan Kategori Bulan Ini'
            },
            subtitle: {
                text: 'Source: direnord.com'
            },
            xAxis: {
                categories: [
                    'Januari'
                    
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Jumlah'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.0f} Buah </b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: 'Logo',
                data: [<%=valLogo1%>]

            }, {
                name: 'Kartu Nama',
                data: [<%=valKartuNama1%>]

            }, {
                name: 'Banner',
                data: [<%=valBanner1%>]

            }]
        });
    </script>

    <script type="text/javascript">
        Highcharts.chart('container2', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Kontes Berdasarkan Kategori'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [
                    {
                        name: 'Desain Logo',
                        y:  <%=valLogo%>,
                        sliced: true,
                        selected: true

                    }, {
                        name: 'Desain Kartu Nama',
                        y:  <%=valKartuNama%>

                }, {
                        name: 'Desain Banner',
                        y:  <%=valBanner%>

                }]
            }]
        });

    </script>
</asp:Content>

