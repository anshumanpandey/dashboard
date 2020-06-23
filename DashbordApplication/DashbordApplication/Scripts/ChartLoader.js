$(function () {
    $('#startDate').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true

    });
    $('#endDate').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true
    });

    $('body').on('click',
        '#btnSearch',
        function () {
            UpdateUserLicenseChart();
            UpdateUserOverTime();
            UpdateAvgTimeChartByModule();
            UpdateTotalTimeSpentChartByModule();
            UpdateSessionAvgTimeByUserByModule();
            UpdateSessionChart();
            UpdateSessionTimeChart();

            PopulateUsersDDL();

            PopulateModulesDDL();
        });

    LoadAllChart();

    $('body').on('click',
        '.userLicenseChartButton',
        function () {
            UpdateUserLicenseChart($(this).data('reqtype'));
        });

    $('body').on('click',
        '.userOverTimeChartButton',
        function () {
            UpdateUserOverTime($(this).data('reqtype'));
        });

    $('body').on('click',
        '.avgTimeModuleButton',
        function () {
            UpdateAvgTimeChartByModule($(this).data('reqtype'));
        });

    $('body').on('click',
        '.avgTimeSpentModuleButton',
        function () {
            UpdateTotalTimeSpentChartByModule($(this).data('reqtype'));
        });
    $('body').on('click',
        '.sessionAvgTimeByUserByModuleButton',
        function () {
            UpdateSessionAvgTimeByUserByModule($(this).data('reqtype'));
        });
    $('body').on('click',
        '.sessionChartButton',
        function () {
            UpdateSessionChart($(this).data('reqtype'));
        });
    $('body').on('click',
        '.sessionTimeChart',
        function () {
            UpdateSessionTimeChart($(this).data('reqtype'));
        });
    $('body').on('change',
        '#ddlUserSessionChart',
        function () {

            UpdateSessionChart();
        });

    $('body').on('change',
        '#ddlUserSessionByUserByModule',
        function () {
            //console.log($('#ddlProjectSessionByUserByModule').val())
            UpdateSessionAvgTimeByUserByModule();
        });
    $('body').on('change',
        '#ddlProjectAvgTimeModule',
        function () {
            UpdateAvgTimeChartByModule();
        });
    $('#ddlUserSessionChart').multipleSelect({
        placeholder: 'Select User'
    });
    $('#ddlUserSessionByUserByModule').multipleSelect({
        placeholder: 'Select User'
    });
    $('#ddlProjectAvgTimeModule').multipleSelect({
        placeholder: 'Select Module',
    });

    PopulateUsersDDL();

    PopulateModulesDDL();

    $('body').on('click',
        '.dataModalPopup',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#dataExportModal').modal();
        });

    $('body').on('click',
        '.licenseInformationModalPopUp',
        function() {
            $('.modal-title').text($(this).data('title'));
            $('#modalLicenseInformation').modal();
        });

    $('body').on('click',
        '.usersLicenseInfoModalPopUp',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalUsersLicenseInformation').modal();
        });

    $('body').on('click',
        '.userOverTimeModalPopUp',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalUserOverTime').modal();
        });
    $('body').on('click',
        '.avgTimeModuleModalPopUp',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalAvgTimeModule').modal();
        });
    

    $('body').on('click',
        '.totalTimeSpentModuleModalPopup',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalTotalTimeSpentModule').modal();
        });

    $('body').on('click',
        '.sessionAvgByUserModuleModalPopUp',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalSessionAvgByUserModule').modal();
        });

    $('body').on('click',
        '.sessionChartModalPopUp',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalSessionChart').modal();
        });

    $('body').on('click',
        '.sessionTimeChartModalPopUp',
        function () {
            $('.modal-title').text($(this).data('title'));
            $('#modalSessionTimeChart').modal();
        });
});


var assignedBarChartOptions = {
    series: [],
    chart: {
        width: 380,
        type: 'donut',
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
    },
    dataLabels: {
        enabled: false
    },
    fill: {
        type: 'gradient',
    },
    noData: {
        text: 'Loading...'
    },
    responsive: [{
        breakpoint: 480,
        options: {
            chart: {
                width: 200
            },
            legend: {
                position: 'bottom'
            }
        }
    }],
    labels: [],
    colors: ['#008000', '#D3D3D3']
};


//var assignedBarChartOptions = {
//    series: [],
//    chart: {
//        height: 350,
//        type: 'radialBar',
//        toolbar: {
//            show: false
//        }
//    },
//    plotOptions: {
//        radialBar: {
//            hollow: {
//                size: '70%',
//            }
//        },
//    },
//    labels: ['Assigned'],
//    noData: {
//        text: 'loading...'
//    }
//};

// Assigned radial bar chart Ends

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
    series: [],
    chart: {
        type: 'bar',
        height: 350,
        stacked: true,
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
        zoom: {
            enabled: true
        },
        selection: {
            enabled: true,
        }
    },
    noData: {
        text: 'Loading...'
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
        categories: [],
        axisBorder: {
            show: true,
        },
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

// User chart Ends

function minTommss(minutes) {
    var sign = minutes < 0 ? "-" : "";
    var min = Math.floor(Math.abs(minutes));
    var sec = Math.floor((Math.abs(minutes) * 60) % 60);
    return sign + (min < 10 ? "0" : "") + min + ":" + (sec < 10 ? "0" : "") + sec;
}

// m:ss to minute decimal
function minDecimal(min, sec) {
    return (min + sec * 0.0168).toFixed(2);
}

var avgTimeByModuleChartOptions = {
    series: [],
    grid: {
        show: false,
    },
    chart: {
        height: 350,
        type: 'bar',
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
    },
    noData: {
        text: 'Loading...'
    },
    plotOptions: {
        bar: {
            dataLabels: {
                position: 'top', // top, center, bottom
            },
        }
    },
    dataLabels: {
        enabled: true,
        formatter: function (val) {
            return minTommss(val);
        },
        offsetY: -20,
        style: {
            fontSize: '12px',
            colors: ["#304758"]
        }
    },
    xaxis: {
        type: '',
        categories: [],
        position: 'bottom',
        axisBorder: {
            show: true
        },
        axisTicks: {
            show: false
        },
        crosshairs: {
            fill: {
                type: 'gradient',
                gradient: {
                    colorFrom: '#D8E3F0',
                    colorTo: '#BED1E6',
                    stops: [0, 100],
                    opacityFrom: 0.4,
                    opacityTo: 0.5,
                }
            }
        },
        tooltip: {
            enabled: true,
        }
    },
    yaxis: {
        labels: {
            show: false,
            //formatter: function (value) {
            //    return minTommss(value);
            //}
        },
        axisBorder: {
            show: true,
        }
    },
    title: {
        //text: 'AVG Time - Module',
        //floating: true,
        offsetY: 0,
        align: 'center',
        style: {
            color: '#444'
        }
    }
};

// End AVG Time - Module

var sessionAvgTimeByUserByModuleOpt = {
    title: {
        // text: 'Sessions (AVG) by User by Module',
        floating: true,
        offsetY: 0,
        align: 'center',
        style: {
            color: '#444'
        }
    },
    grid: {
        show: false,
    },
    series: [],
    chart: {
        type: 'bar',
        height: 350,
        stacked: true,
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
        zoom: {
            enabled: true
        }
    },
    noData: {
        text: 'Loading...'
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
        categories: [],
        axisBorder: {
            show: true,
        },
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

// End Session AVG Time By user By Module

var userOverTimeOpt = {
    title: {
        //text: 'Users Over Time',
        floating: true,
        offsetY: 0,
        align: 'center',
        style: {
            color: '#444'
        }
    },
    grid: {
        show: false,
    },
    series: [],
    chart: {
        type: 'line',
        height: 350,
        stacked: true,
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
        events: {
            legendClick: function (chartContext, seriesIndex, config) {
                alert('Legend clicked event fired');
            }
        }
    },
    noData: {
        text: "Loading..."
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'smooth'
    },
    xaxis: {
        // title: 'Day',
        type: '',
        categories: [],
        axisBorder: {
            show: true,

        },
    },
    yaxis: {
        axisBorder: {
            show: true,
        }
    }

};


// End User Over time Chart
var avgTimeSpentModuleOpt = {
    title: {
        //text: 'AVG Time Spent Module',
        floating: true,
        offsetY: 0,
        align: 'center',
        style: {
            color: '#444'
        }
    },
    grid: {
        show: false,
    },
    series: [],
    chart: {
        type: 'line',
        height: 350,
        stacked: true,
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
    },
    noData: {
        text: 'Loading...'
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'smooth'
    },
    xaxis: {
        // title: 'Day',
        type: '',
        categories: [],
        axisBorder: {
            show: true,

        },
    },
    yaxis: {
        axisBorder: {
            show: true,

        },
    }

};


// End AVG Time spent by Module
var sessionChartOpt = {
    series: [],
    grid: {
        show: false,
    },
    chart: {
        type: 'bar',
        height: 350,
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
    },
    noDate: {
        text: 'Loading...'
    },
    plotOptions: {
        bar: {
            horizontal: true,
            dataLabels: {
                position: 'top',
            },
        }
    },
    dataLabels: {
        enabled: true,
        offsetX: -6,
        style: {
            fontSize: '12px',
            colors: ['#fff']
        }
    },
    xaxis: {
        categories: [],
        axisBorder: {
            show: true,

        },
    },
    yaxis: {
        axisBorder: {
            show: true,

        },
    }
};

// End of session chart

var sessionTimeChartOpt = {
    series: [],
    chart: {
        height: 350,
        type: 'line',
        zoom: {
            enabled: false
        },
        toolbar: {
            show: true,
            tools: {
                download: true,
                selection: true,
                zoom: true,
                zoomin: true,
                zoomout: true,
                pan: true,
                reset: true | '<img src="/static/icons/reset.png" width="20">',
                customIcons: []
            },
        },
    },
    noData: {
        text: 'Loading...'
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        curve: 'straight'
    },
    grid: {
        show: false
    },
    xaxis: {
        categories: []
    }
};

var userChart = '', userOverTimeChart = '', avgTimeChartByModule = '', avgTimeSpentModuleChart = ''
    , sessionAvgTimeByUserByModuleChart = '', sessionChart = '', sessionTimeChart = '';

function LoadAllChart() {
    var assignedRadialBarChart = new ApexCharts(document.querySelector("#assignedBarChart"), assignedBarChartOptions);
    assignedRadialBarChart.render();


    $.getJSON('/Home/AssignedLicenseBarChartResult', function (response) {

        assignedRadialBarChart.updateOptions({
            labels: response.LabelData
        });
        assignedRadialBarChart.updateSeries(response.serisData);

        $('#lblNoOfUnusedLicense').html(response.licenseInfo.NoOfUnusedLicense);
        $('#lblNofUsedLicense').html(response.licenseInfo.NoOfUsedLicense);

        // Table generation code

        var table = $("#tblLicenseInformation tbody");

        table.append("<tr>" +
            "<td>" + ( parseInt(response.licenseInfo.NoOfUnusedLicense) + parseInt(response.licenseInfo.NoOfUsedLicense)) + "</td>" +
            "<td>" + response.licenseInfo.NoOfUnusedLicense + "</td>" +
            "<td>" + response.licenseInfo.NoOfUsedLicense + "</td>" +
            "</tr>");
    });

    userChart = new ApexCharts(document.querySelector("#userChart"), userChartOptions);
    userChart.render();
    UpdateUserLicenseChart('yearly');

    //$.getJSON('/Home/UserLicenseChartResult', function (response) {

    //    $('#lblNoOfLicenseAllocated').html(response.LicenseInfo.TotalNodLicenseAllocated);
    //    $('#lblNoOfUnusedLicense').html(response.LicenseInfo.NoOfUnusedLicense);
    //    $('#lblNofUsedLicense').html(response.LicenseInfo.NoOfUsedLicense);

    //    userChart.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,
    //        }
    //    });

    //    userChart.updateSeries(response.ChartInfo);
    //});

    userOverTimeChart = new ApexCharts(document.querySelector("#usersOverTime"), userOverTimeOpt);
    userOverTimeChart.render();
    UpdateUserOverTime('yearly');

    //$.getJSON('/Home/UserOverTimeChartResult', function (response) {

    //    userOverTimeChart.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,
    //        }
    //    });

    //    userOverTimeChart.updateSeries(response.ChartInfo);
    //});

    avgTimeChartByModule =
        new ApexCharts(document.querySelector("#avgTimeChartByModule"), avgTimeByModuleChartOptions);
    avgTimeChartByModule.render();
    UpdateAvgTimeChartByModule('yearly');

    //$.getJSON('/Home/AvgTimeModuleChartResult', function (response) {

    //    avgTimeChartByModule.updateSeries(response.ChartInfo);
    //    avgTimeChartByModule.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,

    //        },
    //        yaxis: {
    //            labels: {
    //                show: false,
    //                formatter: function (value) {
    //                    return minTommss(value);
    //                }
    //            },
    //            axisBorder: {
    //                show: true,
    //            }
    //        },
    //    });
    //});


    avgTimeSpentModuleChart =
        new ApexCharts(document.querySelector("#avgTimeSpentModule"), avgTimeSpentModuleOpt);
    avgTimeSpentModuleChart.render();
    UpdateTotalTimeSpentChartByModule('yearly');
    //$.getJSON('/Home/AvgSpentTimeByModuleChartResult', function (response) {

    //    avgTimeSpentModuleChart.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,
    //        }
    //    });

    //    avgTimeSpentModuleChart.updateSeries(response.ChartInfo);
    //});


    sessionAvgTimeByUserByModuleChart = new ApexCharts(document.querySelector("#sessionSvgByUserByModule"),
        sessionAvgTimeByUserByModuleOpt);
    sessionAvgTimeByUserByModuleChart.render();
    UpdateSessionAvgTimeByUserByModule('yearly');
    //$.getJSON('/Home/SessionAvgTimeByUserByModuleChartResult', function (response) {

    //    sessionAvgTimeByUserByModuleChart.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,
    //        }
    //    });

    //    sessionAvgTimeByUserByModuleChart.updateSeries(response.ChartInfo);
    //});

    sessionChart = new ApexCharts(document.querySelector("#sessionChart"), sessionChartOpt);
    sessionChart.render();
    UpdateSessionChart('yearly');
    //$.getJSON('/Home/SessionChartResult', function (response) {

    //    sessionChart.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,
    //        }
    //    });

    //    sessionChart.updateSeries(response.ChartInfo);
    //});


    sessionTimeChart = new ApexCharts(document.querySelector("#sessionTimeChart"), sessionTimeChartOpt);
    sessionTimeChart.render();
    UpdateSessionTimeChart('yearly');
    //$.getJSON('/Home/SessionTimeChartResult', function (response) {

    //    sessionTimeChart.updateOptions({
    //        xaxis: {
    //            type: response.ChartOptions.X_axisCategoryType,
    //            categories: response.ChartOptions.X_axisCategories,
    //        }
    //    });

    //    sessionTimeChart.updateSeries(response.ChartInfo);
    //});
}

function UpdateUserLicenseChart(requestType = 'yearly') {
    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType
    };

    $.ajax({
        url: '/Home/UserLicenseChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            //userChart.destroy();

            $('#lblNoOfLicenseAllocated').html(response.LicenseInfo.TotalNodLicenseAllocated);
            //$('#lblNoOfUnusedLicense').html(response.LicenseInfo.NoOfUnusedLicense);
            //$('#lblNofUsedLicense').html(response.LicenseInfo.NoOfUsedLicense);

            userChart.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,
                }
            });

            userChart.updateSeries(response.ChartInfo);

            //table generation
            var tableBody = $('#tbUserLicenseInformation tbody');
            tableBody.empty();

            $.each(response.UsersLicenseInformationTableData,
                function(i, data) {
                    tableBody.append('<tr>' +
                        '<td>' +
                        data.Month +
                        '</td>' +
                        '<td>' +
                        data.Week +
                        '</td>' +
                        '<td>' +
                        data.Day +
                        '</td>' +
                        '<td>' +
                        data.DistinctYear +
                        '</td>' +
                        '<td>' +
                        data.LicenseCount +
                        '</td>' +
                        '<td>' +
                        data.UnusedLicense +
                        '</td>' +
                        '<td>' +
                        data.UsedLicense +
                        '</td>' +
                        '</tr>');
                });
        }
    });


}

function UpdateUserOverTime(requestType = 'yearly') {
    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType
    };

    $.ajax({
        url: '/Home/UserOverTimeChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            
            userOverTimeChart.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,
                }
            });

            userOverTimeChart.updateSeries(response.ChartInfo);
            var usersOverTimeTable = $('#tblUserOverTime tbody');
            usersOverTimeTable.empty();

            $.each(response.UsersCountInformation,
                function(i, data) {
                    usersOverTimeTable.append('<tr>' +
                        '<td>'+data.UserName+'</td>' +
                        '<td>'+data.ActivityCount+'</td>' +
                        '</tr>')
                });
        }
    });
}

function UpdateAvgTimeChartByModule(requestType = 'yearly') {

    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType,
        FilterByProjectId: $('#ddlProjectAvgTimeModule').val()
    };

    $.ajax({
        url: '/Home/AvgTimeModuleChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            avgTimeChartByModule.updateSeries(response.ChartInfo);
            avgTimeChartByModule.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,

                },
                yaxis: {
                    labels: {
                        show: false,
                        formatter: function (value) {
                            return minTommss(value);
                        }
                    },
                    axisBorder: {
                        show: true,
                    }
                },
            });

            var tableHeader = $('#tblAvgTimeModule thead tr');
            tableHeader.empty();

            var tableBody = $('#tblAvgTimeModule tbody');
            tableBody.empty();
            $.each(response.UserModuleTimeSpanInformation,
                function (i, data) {
                    tableHeader.append('<th>' + data.ModuleName + '</th>');
                    tableBody.append('<td>' + data.AvgTimeSpan + '</td>');
                });
        }
    });
}

function UpdateTotalTimeSpentChartByModule(requestType = 'yearly') {
    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType
    };

    $.ajax({
        url: '/Home/TotalTimeSpentByModuleChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            avgTimeSpentModuleChart.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,
                }
            });

            avgTimeSpentModuleChart.updateSeries(response.ChartInfo);

            var totalTimeSpentTableHeader = $('#tblTotalTimeSpentModule thead tr');
            totalTimeSpentTableHeader.empty();

            var tableBody = $('#tblTotalTimeSpentModule tbody');
            tableBody.empty();
            $.each(response.UserModuleTimeSpanInformation,
                function (i, data) {
                    totalTimeSpentTableHeader.append('<th>' + data.ModuleName + '</th>');
                    tableBody.append('<td>' + data.AvgTimeSpan + '</td>');
                });
        }
    });
}

function UpdateSessionAvgTimeByUserByModule(requestType = 'yearly') {
    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType,
        FilterByUserId: $('#ddlUserSessionByUserByModule').val()
    };

    $.ajax({
        url: '/Home/SessionAvgTimeByUserByModuleChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            sessionAvgTimeByUserByModuleChart.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,
                }
            });

            sessionAvgTimeByUserByModuleChart.updateSeries(response.ChartInfo);

            //table header Geneartion

            var sessionAvgByUserByModal = $('#tblSessionAvgByUserModule tbody');
            sessionAvgByUserByModal.empty();

            $.each(response.UserModuleInformation,
                function (i, data) {
                    sessionAvgByUserByModal.append('<tr>' +
                        '<td>'+data.UserName+'</td>' +
                        '<td>'+data.QAP+'</td>' +
                        '<td>'+data.ME+'</td>' +
                        '<td>'+data.MEO+'</td>' +
                        '<td>'+data.SJR1+'</td>' +
                        '<td>'+data.SJROutcome+'</td>' +
                        '<td>'+data.SJR2+'</td>' +
                        '<td>' + data.CodingReview+'</td>' +
                        '</tr>');
                });
        }
    });
}

function UpdateSessionChart(requestType = 'yearly') {
    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType,
        FilterByUserId: $('#ddlUserSessionChart').val()
    };

    //console.log($('#ddlUserSessionChart').multipleSelect('getSelects'));

    $.ajax({
        url: '/Home/SessionChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            //console.log(response);
            sessionChart.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,
                }
            });

            sessionChart.updateSeries(response.ChartInfo);

            // table section
            var tableHeader = $('#tblSessionChart thead tr');
            tableHeader.empty();

            var tableBody = $('#tblSessionChart tbody');
            tableBody.empty();

            $.each(response.UserSessionCountInformation,
                function(i, data) {
                    tableHeader.append('<th>' + data.UserName + '</th>');
                    tableBody.append('<td>' + data.SessionCount + '</td>');
                });
        }
    });
}

function UpdateSessionTimeChart(requestType = 'yearly') {
    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val(),
        RequestType: requestType
    };

    $.ajax({
        url: '/Home/SessionTimeChartResult',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {
            sessionTimeChart.updateOptions({
                xaxis: {
                    type: response.ChartOptions.X_axisCategoryType,
                    categories: response.ChartOptions.X_axisCategories,
                }
            });

            sessionTimeChart.updateSeries(response.ChartInfo);

            var tableBody = $('#tblSessionTimeChart tbody');
            tableBody.empty();

            $.each(response.UserModuleTimeSpanInformation,
                function (i, data) {
                    tableBody.append('<tr>' +
                        '<td>' + data.ID + '</td>' +
                        '<td>' + data.PatientID + '</td>' +
                        '<td>' + data.ModuleName + '</td>' +
                        '<td>' + data.UserName + '</td>' +
                        '<td>' + data.StartTime + '</td>' +
                        '<td>' + data.EndTime + '</td>' +
                        '<td>' + data.Year + '</td>' +
                        '<td>' + data.Month + '</td>' +
                        '<td>' + data.Quarter + '</td>' +
                        '<td>' + data.Week + '</td>' +
                        '<td>' + data.TimeSpan + '</td>' +
                        '<td>' + data.ActivityCount + '</td>' +
                        '</tr>');
                    
                });
        }

    });
}

function PopulateUsersDDL() {


    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val()
    };

    $.ajax({
        url: '/Home/GetSessionChartUsers',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {


           
            var s = '';
            for (var i = 0; i < response.length; i++) {
                s += '<option value="' + response[i].Id + '">' + response[i].UserName + '</option>';
            }
            $("#ddlUserSessionChart").html(s);
            $('#ddlUserSessionChart').multipleSelect('refresh');

        }
    });

    $.ajax({
        url: '/Home/GetUsers',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {

            var s = '';
            for (var i = 0; i < response.length; i++) {
                s += '<option value="' + response[i].Id + '">' + response[i].UserName + '</option>';
            }

            $("#ddlUserSessionByUserByModule").html(s);
            $('#ddlUserSessionByUserByModule').multipleSelect('refresh');

        }
    })

    //$.getJSON('/Home/GetSessionChartUsers',
    //    function (response) {
    //        var s = '';
    //        for (var i = 0; i < response.length; i++) {
    //            s += '<option value="' + response[i].Id + '">' + response[i].UserName + '</option>';
    //        }
    //        $("#ddlUserSessionChart").html(s);  
    //        $('#ddlUserSessionChart').multipleSelect('refresh');


    //    });
    //$.getJSON('/Home/GetUsers',
    //                                function (response) {
    //                                    var s = '';
    //                                    for (var i = 0; i < response.length; i++) {
    //                                        s += '<option value="' + response[i].Id + '">' + response[i].UserName + '</option>';
    //                                    }

    //                                    $("#ddlUserSessionByUserByModule").html(s);
    //                                    $('#ddlUserSessionByUserByModule').multipleSelect('refresh');
    //                                });
}

function PopulateModulesDDL() {


    var reqObj = {
        StartDate: $('#startDate').val(),
        EndDate: $('#endDate').val()
    };

    $.ajax({
        url: '/Home/GetModules',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify(reqObj),
        contentType: 'application/json; charset=utf-8',
        success: function (response) {

            var s = '';
            for (var i = 0; i < response.length; i++) {
                s += '<option value="' + response[i].ModuleId + '">' + response[i].ModuleName + '</option>';
            }


            $("#ddlProjectAvgTimeModule").html(s);
            $('#ddlProjectAvgTimeModule').multipleSelect('refresh');

            
        }
    });

    //$.getJSON('/Home/GetModules',
    //    function (response) {
    //        var s = '';
    //        for (var i = 0; i < response.length; i++) {
    //            s += '<option value="' + response[i].ModuleId + '">' + response[i].ModuleName + '</option>';
    //        }


    //        $("#ddlProjectAvgTimeModule").html(s);
    //        $('#ddlProjectAvgTimeModule').multipleSelect('refresh');

    //    });


}