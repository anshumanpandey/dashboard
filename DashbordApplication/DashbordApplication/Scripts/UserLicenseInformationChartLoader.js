var obj1 = [
    {
        name: 'Used',
        //x: '2020',
        data: [30],
        monthly: [
            {
                x: "Jan",
                y: "19",
                weekly: [
                    {
                        x: "W1",
                        y: "5"
                    },
                    {
                        x: "W2",
                        y: "3"
                    },
                    {
                        x: "W3",
                        y: "3"
                    },
                    {
                        x: "W4",
                        y: "2"
                    },
                ]
            },
            {
                x: "Feb",
                y: "11",
                weekly: [
                    {
                        x: "W5",
                        y: "0"
                    },
                    {
                        x: "W6",
                        y: "7"
                    }, {
                        x: "W7",
                        y: "5"
                    },
                    {
                        x: "W8",
                        y: "7"
                    },
                ]
            }
        ],
        weekly: [
            {
                x: "W1",
                y: "5"
            },
            {
                x: "W2",
                y: "3"
            },
            {
                x: "W3",
                y: "3"
            },
            {
                x: "W4",
                y: "2"
            },
            {
                x: "W5",
                y: "0"
            },
            {
                x: "W6",
                y: "7"
            }, {
                x: "W7",
                y: "5"
            },
            {
                x: "W8",
                y: "7"
            },
        ]
    },
    {
        name: 'Unused',
        //x: '2020',
        data: [70],
        monthly: [
            {
                x: "Jan",
                y: "81",
                weekly: [
                    {
                        x: "W1",
                        y: "95"
                    },
                    {
                        x: "W2",
                        y: "92"
                    },
                    {
                        x: "W3",
                        y: "89"
                    },
                    {
                        x: "W4",
                        y: "87"
                    },
                ]
            },
            {
                x: "Feb",
                y: "70",
                weekly: [
                    {
                        x: "W5",
                        y: "87"
                    },
                    {
                        x: "W6",
                        y: "80"
                    }, {
                        x: "W7",
                        y: "75"
                    },
                    {
                        x: "W8",
                        y: "70"
                    },
                ]
            }
        ],
        weekly: [
            {
                x: "W1",
                y: "95"
            },
            {
                x: "W2",
                y: "92"
            },
            {
                x: "W3",
                y: "89"
            },
            {
                x: "W4",
                y: "87"
            },
            {
                x: "W5",
                y: "87"
            },
            {
                x: "W6",
                y: "80"
            }, {
                x: "W7",
                y: "75"
            },
            {
                x: "W8",
                y: "70"
            },
        ]
    }
]

var userChartOptions = {
    title: {
        // text: 'Users',
        floating: true,
        offsetY: 0,
        align: 'center',
        style: {
            color: '#444'
        }
    },
    series: obj1,
    chart: {
        type: 'bar',
        height: 350,
        stacked: true,
        toolbar: {
            show: false
        },
        zoom: {
            enabled: true
        },
        selection: {
            enabled: true,
        },
        events: {
            dataPointSelection: function (e, chart, opts) {
                console.log(opts);
                UpdateMonthlyChart(chart, chart, opts);
            }
        }
    },
    responsive: [
        {
            breakpoint: 480,
            options: {
                legend: {
                    position: 'bottom',
                    offsetX: -10,
                    offsetY: 0
                }
            }
        }
    ],
    plotOptions: {
        bar: {
            horizontal: false,
        },
    },
    xaxis: {
        type: '',
        categories: [2020],
        axisBorder: {
            show: true,
        },
        title: ''
    },
    grid: {
        show: false,
    },
    yaxis: {
        labels: {
            show: false
        },
        axisBorder: {
            show: true,
        }
    },
    legend: {
        position: 'right',
        offsetY: 40
    },
    fill: {
        opacity: 1
    }
};


function LoadUserLicenseChart() {
    var userChart = new ApexCharts(document.querySelector("#userChart"), userChartOptions);
    userChart.render();

}

function UpdateMonthlyChart(sourceChart, destinationChart, options) {
    var series = [];
    var selectedIndex = options.seriesIndex;
    debugger;
    if (sourceChart.w.globals.selectedDataPoints) {
        var selectedPoints = sourceChart.w.globals.selectedDataPoints;
        for (var i = 0; i < selectedPoints[selectedIndex].length; i++) {
            var monthSeries = sourceChart.w.config.series[selectedIndex];
            series.push({
                name: monthSeries.name,
                data: monthSeries.monthly
            });
        }

        if (series.length === 0)
            series = [
                {
                    data: []
                }
            ];

        //return ApexCharts.exec(destinationChart,
        //    'updateOptions',
        //    {
        //        series: series
        //    });

        destinationChart.updateSeries(series);
    }
}