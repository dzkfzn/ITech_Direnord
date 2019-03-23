<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Dashboard - Manager
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
                                <h3><b>Laporan Transaksi Tahun ini</b></h3>
                                <div class="row">

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div>
                                        </div>
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

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <div class="x_title">
                                <div class="clearfix"></div>
                                <h3><b>Minat Kontes Berdasarkan</b></h3>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div id="container3"></div>

                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div id="container4"></div>

                                    </div>
                                </div>
                                <br />

                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content">
                            <div class="x_title">
                                <div class="clearfix"></div>
                                <h3><b>Laporan Data User</b></h3>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div id="container6"></div>
                                        <!-- Data from www.netmarketshare.com. Select Browsers => Desktop share by version. Download as tsv. -->

                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div id="container5"></div>

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

                    text: 'Jumlah Order Direnord <%=tahun%>'
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
        <script type="text/javascript">

            Highcharts.chart('container4', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Kontes Berdasarkan Paket'
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
                            name: 'Bronze',
                            y:  <%=valBronze%>,
                        sliced: true,
                        selected: true

                    }, {
                        name: 'Silver',
                        y:  <%=valSilver%>

                }, {
                        name: 'Gold',
                        y:  <%=valGold%>

                }]
            }]
            });

        </script>
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

        <script type="text/javascript">

            // Create the chart
            Highcharts.chart('container5', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Browser market shares. January, 2018'
                },
                subtitle: {
                    text: 'Click the slices to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}: {point.y:.1f}%'
                        }
                    }
                },

                tooltip: {
                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                },

                "series": [
                    {
                        "name": "Browsers",
                        "colorByPoint": true,
                        "data": [
                            {
                                "name": "Chrome",
                                "y": 62.74,
                                "drilldown": "Chrome"
                            },
                            {
                                "name": "Firefox",
                                "y": 10.57,
                                "drilldown": "Firefox"
                            }
                        ]
                    }
                ],
                "drilldown": {
                    "series": [
                        {
                            "name": "Chrome",
                            "id": "Chrome",
                            "data": [
                                [
                                    "v65.0",
                                    0.1
                                ],
                                [
                                    "v64.0",
                                    1.3
                                ],
                                [
                                    "v63.0",
                                    53.02
                                ],
                                [
                                    "v62.0",
                                    1.4
                                ],
                                [
                                    "v61.0",
                                    0.88
                                ],
                                [
                                    "v60.0",
                                    0.56
                                ],
                                [
                                    "v59.0",
                                    0.45
                                ],
                                [
                                    "v58.0",
                                    0.49
                                ],
                                [
                                    "v57.0",
                                    0.32
                                ],
                                [
                                    "v56.0",
                                    0.29
                                ],
                                [
                                    "v55.0",
                                    0.79
                                ],
                                [
                                    "v54.0",
                                    0.18
                                ],
                                [
                                    "v51.0",
                                    0.13
                                ],
                                [
                                    "v49.0",
                                    2.16
                                ],
                                [
                                    "v48.0",
                                    0.13
                                ],
                                [
                                    "v47.0",
                                    0.11
                                ],
                                [
                                    "v43.0",
                                    0.17
                                ],
                                [
                                    "v29.0",
                                    0.26
                                ]
                            ]
                        },
                        {
                            "name": "Firefox",
                            "id": "Firefox",
                            "data": [
                                [
                                    "v58.0",
                                    1.02
                                ],
                                [
                                    "v57.0",
                                    7.36
                                ],
                                [
                                    "v56.0",
                                    0.35
                                ],
                                [
                                    "v55.0",
                                    0.11
                                ],
                                [
                                    "v54.0",
                                    0.1
                                ],
                                [
                                    "v52.0",
                                    0.95
                                ],
                                [
                                    "v51.0",
                                    0.15
                                ],
                                [
                                    "v50.0",
                                    0.1
                                ],
                                [
                                    "v48.0",
                                    0.31
                                ],
                                [
                                    "v47.0",
                                    0.12
                                ]
                            ]
                        }

                    ]
                }
            });
        </script>
        <script type="text/javascript">


            Highcharts.chart('container6', {
                title: {
                    text: 'Report Registrasi User 2019'
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
                labels: {
                    items: [{
                        html: 'Total fruit consumption',
                        style: {
                            left: '50px',
                            top: '18px',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                        }
                    }]
                },
                series: [{
                    type: 'column',
                    name: 'Client',
                <%=valClient %>
            }, {
                type: 'column',
                name: 'Designer',
                <%=valDesigner%>
                }, {
                    type: 'spline',
                    name: 'Jumlah User Mendaftar',
                <%=valTotalCD%>,
                marker: {
                    lineWidth: 2,
                    lineColor: Highcharts.getOptions().colors[3],
                    fillColor: 'white'
                }
            }]
        });


        </script>

        
    <script type="text/javascript">


            Highcharts.chart('container5', {

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
                    pointFormat: '{series.name} earned <b> {point.y:,.0f} person</b>'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },


                series: [{
                    name: 'Client',
                 <%=ds%>
            }, {
                name: 'Designer',
                 <%=cl%>

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

