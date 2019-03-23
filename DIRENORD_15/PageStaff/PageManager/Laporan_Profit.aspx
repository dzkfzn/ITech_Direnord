<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Laporan_Profit.aspx.cs" Inherits="PageStaff_PageManager_Laporan_Profit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Laporan Profit - Manager
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
                                <h3><b>Laporan Keuntungan Setiap Bulan pada Tahun 2019</b></h3>
                                <div class="row">

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                      
                                        <div id="container3"></div>

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


        Highcharts.chart('container3', {

            title: {
                text: 'Profit Direnord 2019'
            },

            subtitle: {
                text: 'Source: direnord.com'
            },
            xAxis: {
                categories: [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec'
                ],
                crosshair: true
            },

            yAxis: {
                title: {
                    text: 'Number of Employees'
                }
            },
            tooltip: {
                pointFormat: '{series.name} earned <b>Rp. {point.y:,.0f}</b>'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },


            series: [{
                name: 'Profit',
                 <%=Data1%>

            }],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

        });


    </script>
</asp:Content>

