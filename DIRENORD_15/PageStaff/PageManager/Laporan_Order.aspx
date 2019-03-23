<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Laporan_Order.aspx.cs" Inherits="PageStaff_PageManager_Laporan_Order" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Laporan Order - Manager
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
                                <h3><b>Laporan Jumlah Order Per Bulan pada Tahun</b></h3>
                            <asp:DropDownList AutoPostBack="true" ID="ddlTahun" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlTahun_SelectedIndexChanged"></asp:DropDownList>

                                <div class="row">

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div>

                                        </div>
                                        <div id="container"></div>

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

            title: {

                text: "Jumlah Order Direnord " + <%=tahun%> 
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
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },


            series: [{
                name: 'Order',
                <%=Data2%>
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

