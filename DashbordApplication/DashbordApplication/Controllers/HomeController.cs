using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DashbordApplication.Models;

namespace DashbordApplication.Controllers
{
    public class HomeController : Controller
    {
        private List<ChartResponseInformation> yearlyUserLicenseData = new List<ChartResponseInformation>()
        {
            new ChartResponseInformation()
            {
                name = "Used",
                data = new[]
                {
                    "30"
                }
            },
            new ChartResponseInformation()
            {
                name = "Unused",
                data = new[]
                {
                    "70"
                }
            }
        };

        private ChartOptionInformation yearlyChartConfig = new ChartOptionInformation()
        {
            X_axisCategoryType = "category",
            X_axisCategories = new[]
            {
                "2020"
            }
        };

        private List<ChartResponseInformation> monthlyUserLicenseData = new List<ChartResponseInformation>()
        {
            new ChartResponseInformation()
            {
                name = "Used",
                data = new[]
                {
                    "29","11"
                }
            },
            new ChartResponseInformation()
            {
                name = "Unused",
                data = new[]
                {
                    "71","89"
                }
            }
        };

        private ChartOptionInformation monthlyChartConfig = new ChartOptionInformation()
        {
            X_axisCategoryType = "category",
            X_axisCategories = new[]
            {
                "Jan",
                "Feb"
            }
        };
        private List<ChartResponseInformation> weeklyUserLicenseData = new List<ChartResponseInformation>()
        {
            new ChartResponseInformation()
            {
                name = "Used",
                data = new[]
                {
                    "5","3","8","3","7","12","4","1"
                }
            },
            new ChartResponseInformation()
            {
                name = "Unused",
                data = new[]
                {
                    "15","13","18","23","17","12","24","11"
                }
            }
        };

        private ChartOptionInformation weeklyChartConfig = new ChartOptionInformation()
        {
            X_axisCategoryType = "category",
            X_axisCategories = new[]
            {
                "w1","w2","w3","w4","w5","w6","w7","w8"
            }
        };

        private List<ChartResponseInformation> dailyUserLicenseData = new List<ChartResponseInformation>()
        {
            new ChartResponseInformation()
            {
                name = "Used",
                data = new[]
                {
                    "2","3","5","7","8","3","7"
                }
            },
            new ChartResponseInformation()
            {
                name = "Unused",
                data = new[]
                {
                    "7","23","12","3","6","15","27"
                }
            }
        };

        private ChartOptionInformation dailyChartConfig = new ChartOptionInformation()
        {
            X_axisCategoryType = "category",
            X_axisCategories = new[]
            {
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
            }
        };

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult AssignedLicenseBarChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                serisData = new[]
                {
                    30, 70
                },
                LabelData = new[]
                {
                    "Used", "Unused"
                }
            };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UserLicenseChartResult(ChartLoadRequestObject reqObj)
        {
            var licenseInfo = new LicenseInformation
            {
                TotalNodLicenseAllocated = "100",
                NoOfUsedLicense = "30",
                NoOfUnusedLicense = "70"
            };

            var chartInfo = new List<ChartResponseInformation>();

            var opt = new ChartOptionInformation();



            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = yearlyUserLicenseData;
                opt = yearlyChartConfig;
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = monthlyUserLicenseData;
                opt = monthlyChartConfig;
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = weeklyUserLicenseData;
                opt = weeklyChartConfig;
            }
            else
            {
                chartInfo = dailyUserLicenseData;
                opt = dailyChartConfig;
            }


            var result = new ChartResultResponse()
            {
                LicenseInfo = licenseInfo,
                ChartInfo = chartInfo,
                ChartOptions = opt
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult UserOverTimeChartResult(ChartLoadRequestObject reqObj)
        {
            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();


            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "Used License",
                        data = new[]
                        {
                            "34","45","30"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Unused License",
                        data = new[]
                        {
                            "74", "65", "70"
                        }
                    },
                }; ;
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "2018",
                        "2019",
                        "2020"

                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "Used License",
                        data = new[]
                        {
                            "34","45","30","23","54"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Unused License",
                        data = new[]
                        {
                            "74", "65", "70","55","45"
                        }
                    },
                }; ;
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May"

                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "Used License",
                        data = new[]
                        {
                            "34","45","30","34","22","33","88","23"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Unused License",
                        data = new[]
                        {
                            "74", "65", "70","22","44","23","11","33"
                        }
                    },
                }; ;
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "W1",
                        "W2",
                        "W3",
                        "W4",
                        "W5",
                        "W6",
                        "W7",
                        "W8",

                    }
                };
            }
            else
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "Used License",
                        data = new[]
                        {
                            "34","22","18","45","30","33","88","23"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Unused License",
                        data = new[]
                        {
                            "22","44","23","74", "65", "70","11","33"
                        }
                    },
                }; ;
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",

                    }
                };
            }

            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AvgTimeModuleChartResult(ChartLoadRequestObject reqObj)
        {
            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            chartInfo = new List<ChartResponseInformation>{
                new ChartResponseInformation()
                {
                    name = "AVG Time",
                    data = new[]
                    {
                        $"{MinuteToDecimal(10, 0):##.##}",
                        $"{MinuteToDecimal(8, 0):##.##}",
                        $"{MinuteToDecimal(11, 25):##.##}",
                        $"{MinuteToDecimal(3, 15):##.##}",
                        $"{MinuteToDecimal(12, 00):##.##}",
                        $"{MinuteToDecimal(18, 24):##.##}",
                        $"{MinuteToDecimal(9, 12):##.##}",
                    }
                },

            };

            chartOptions = new ChartOptionInformation()
            {
                X_axisCategoryType = "category",
                X_axisCategories = new[]
                {
                    "ME", "QAP", "MEO", "SJR1", "SJR Outcome", "SJR2", "Coding Review"
                }
            };

            //if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            //{

            //}
            //else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "AVG Time",
            //            data = new[]
            //            {
            //                $"{MinuteToDecimal(3, 15):##.##}",
            //                $"{MinuteToDecimal(12, 00):##.##}",
            //                $"{MinuteToDecimal(8, 0):##.##}",
            //                $"{MinuteToDecimal(4, 0):##.##}",
            //                $"{MinuteToDecimal(10, 25):##.##}",
            //                $"{MinuteToDecimal(22, 24):##.##}",
            //                $"{MinuteToDecimal(9, 12):##.##}",
            //            }
            //        },

            //    };

            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "ME", "QAP", "MEO", "SJR1", "SJR Outcome", "SJR2", "Coding Review"
            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "AVG Time",
            //            data = new[]
            //            {
            //                $"{MinuteToDecimal(8, 0):##.##}",
            //                $"{MinuteToDecimal(4, 0):##.##}",
            //                $"{MinuteToDecimal(10, 25):##.##}",
            //                $"{MinuteToDecimal(3, 15):##.##}",
            //                $"{MinuteToDecimal(12, 00):##.##}",
            //                $"{MinuteToDecimal(9, 12):##.##}",
            //                $"{MinuteToDecimal(23, 24):##.##}",
            //            }
            //        },

            //    };

            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "ME", "QAP", "MEO", "SJR1", "SJR Outcome", "SJR2", "Coding Review"
            //        }
            //    };
            //}
            //else
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "AVG Time",
            //            data = new[]
            //            {
            //                $"{MinuteToDecimal(3, 15):##.##}",
            //                $"{MinuteToDecimal(22, 24):##.##}",
            //                $"{MinuteToDecimal(9, 12):##.##}",
            //                $"{MinuteToDecimal(4, 0):##.##}",
            //                $"{MinuteToDecimal(10, 25):##.##}",
            //                $"{MinuteToDecimal(12, 00):##.##}",
            //                $"{MinuteToDecimal(8, 0):##.##}",
            //            }
            //        },

            //    };

            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "ME", "QAP", "MEO", "SJR1", "SJR Outcome", "SJR2", "Coding Review"
            //        }
            //    };
            //}

            var result = new ChartResultResponse();

            if (reqObj.FilterByProjectId != null && reqObj.FilterByProjectId.Length > 0)
            {
                foreach (var project in reqObj.FilterByProjectId)
                {
                    var projectIndex = Array.IndexOf(chartOptions.X_axisCategories, project);

                    result = new ChartResultResponse()
                    {
                        ChartInfo = chartInfo.Select(x => new ChartResponseInformation()
                        {
                            name = x.name,
                            titile = x.titile,
                            data = new []
                            {
                                x.data[projectIndex].ToString()
                            }
                        })
                        ,
                        ChartOptions = new ChartOptionInformation()
                        {
                            X_axisCategoryType = chartOptions.X_axisCategoryType,
                            X_axisCategories = chartOptions.X_axisCategories
                                .Where(x => x.ToUpper() == project.ToUpper().Trim()).ToArray()
                        }
                    };
                }
            }
            else
            {
                result = new ChartResultResponse()
                {
                    ChartInfo = chartInfo,
                    ChartOptions = chartOptions
                };
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AvgSpentTimeByModuleChartResult(ChartLoadRequestObject reqObj)
        {
            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "31", "40", "28", "51"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                            "11", "32", "45", "32"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "15", "45", "30", "28"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                            "15", "45", "30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "15", "45", "30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "15", "45", "30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "15", "45", "30", "28"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "2017", "2018", "1019", "2020"
                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "40", "28", "31", "51"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                            "32", "45", "11", "32"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                             "45", "30", "15","28"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                            "30", "28", "15", "45"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "15",  "28","45", "30",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                             "28","15", "23", "45"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "15", "45","28", "30"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "Jan", "Feb", "Mar", "Apr"
                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "31", "40", "28", "51","22","17"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                            "11","22","17", "32", "45", "32"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "15", "45","22","17","30", "28"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                            "22","17" ,"15", "45", "30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "15",  "28","22","17","45", "30"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "15", "45", "30", "28","28","22"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "15", "45", "30", "28","45", "30"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "w1", "w2", "w3", "w4","w5","w6"
                    }
                };
            }
            else
            {
                chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "31", "40", "28", "51","32", "45", "32","56"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                            "11", "32", "45", "32","34","23","23","91"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "15", "45","34","23", "30", "28","58","43"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                            "15","34","23","58","43", "45", "30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "34","23","58","43","15", "45", "30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "15", "45","34","23","58","43","30", "28"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "15", "45", "30", "28","34","23","58","43"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "1", "2", "3", "4","5","6","7","8"
                    }
                };
            }


            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SessionAvgTimeByUserByModuleChartResult(ChartLoadRequestObject reqObj)
        {
            var chartInfo = new List<ChartResponseInformation>();


            var chartOptions = new ChartOptionInformation();


            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "20", "50", "13", "18","12"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                            "46","12", "0", "28", "32"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "30", "30","12", "25", "15"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                            "12", "18", "45", "36", "21"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "24", "14", "56", "44","23"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "22", "11", "33", "44","55"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "23", "12", "34", "54","22"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                            "U1", "U2", "U3", "U4","U5"
                        }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "20",  "18","12","50", "13"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                             "0", "28", "32","46","12",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "30",  "15","30","12", "25",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                             "36", "21","12", "18", "45"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "56", "44","23",  "24", "14"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "22",  "44","55","11", "33",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "54","22", "23", "12", "34",
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                            "U1", "U2", "U3", "U4","U5"
                        }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "20", "18","12","50"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                             "0", "28", "32","46"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "30",  "15","12", "25",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                             "21","12", "18", "45"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "56", "44" , "24", "14"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "44","55","11", "33",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "54","22", "23", "12"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                            "U1", "U2", "U3", "U5"
                        }
                };
            }
            else
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new[]
                        {
                            "20", "50", "13"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "QAP",
                        data = new[]
                        {
                             "0", "28", "12",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "MEO",
                        data = new[]
                        {
                            "30","12", "25",
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJR1",
                        data = new[]
                        {
                             "36",  "18", "45"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR Outcome",
                        data = new[]
                        {
                            "56", "44","23"
                        }
                    }
                    ,
                    new ChartResponseInformation()
                    {
                        name = "SJR2",
                        data = new[]
                        {
                            "55","11", "33"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Coding Review",
                        data = new[]
                        {
                            "54","22",  "34",
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                            "U3", "U4","U5"
                        }
                };
            }

            var result = new ChartResultResponse();

            if (reqObj.FilterByProjectId != null && reqObj.FilterByProjectId.Length > 0)
            {
                foreach (var projectId in reqObj.FilterByProjectId)
                {
                    result = new ChartResultResponse()
                    {
                        ChartInfo = chartInfo.Where(x => x.name.ToUpper() == projectId.ToUpper()),
                        ChartOptions = chartOptions
                    };
                }
            }
            else
            {
                result = new ChartResultResponse()
                {
                    ChartInfo = chartInfo,
                    ChartOptions = chartOptions
                };

            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SessionChartResult(ChartLoadRequestObject reqObj)
        {
            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = new List<ChartResponseInformation> {
                    new ChartResponseInformation
                    {
                        name = "",
                        data = new[]
                        {
                            "30", "46", "25", "50", "38"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "U1", "U2", "U3", "U4", "U5"
                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = new List<ChartResponseInformation> {
                    new ChartResponseInformation
                    {
                        name = "",
                        data = new[]
                        {
                            "23", "26", "52", "35", "42"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "U1", "U2", "U3", "U4", "U5"
                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = new List<ChartResponseInformation> {
                    new ChartResponseInformation
                    {
                        name = "",
                        data = new[]
                        {
                            "12", "18", "28", "38", "25"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "U1", "U2", "U3", "U4", "U5"
                    }
                };
            }
            else
            {
                chartInfo = new List<ChartResponseInformation> {
                    new ChartResponseInformation
                    {
                        name = "",
                        data = new[]
                        {
                            "31", "12", "18", "28", "24"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "U1", "U2", "U3", "U4", "U5"
                    }
                };
            }

            var result = new ChartResultResponse();
            if (reqObj.FilterByUserId != null && reqObj.FilterByUserId.Length > 0)
            {
                foreach (var userId in reqObj.FilterByUserId)
                {
                    if (!string.IsNullOrEmpty(userId))
                    {
                        var userNameIndex = Array.IndexOf(chartOptions.X_axisCategories, userId.ToUpper().Trim());

                        
                        result = new ChartResultResponse()
                        {
                            ChartInfo = chartInfo.Select(x => new ChartResponseInformation
                            {
                                name = x.name,
                                titile = x.titile,
                                data = new[]
                                {
                                    x.data[userNameIndex].ToString()
                                }
                            }),
                            ChartOptions = new ChartOptionInformation()
                            {
                                X_axisCategoryType = chartOptions.X_axisCategoryType,
                                X_axisCategories = chartOptions.X_axisCategories.Where(x => x.ToUpper() == userId.ToUpper().Trim()).ToArray()
                            }
                        };
                    }
                }

            }
            else
            {
                result = new ChartResultResponse()
                {
                    ChartInfo = chartInfo,
                    ChartOptions = chartOptions
                };
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SessionTimeChartResult(ChartLoadRequestObject reqObj)
        {
            var chartInfo = new List<ChartResponseInformation>();


            var chartOptions = new ChartOptionInformation();

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "Session",
                        data = new[]
                        {
                            "10", "41", "35", "51"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "2017", "2018", "2019", "2020"
                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "Session",
                        data = new[]
                        {
                            "17", "14", "53", "26"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "Jan", "Feb", "Mar", "Apr", "May","Jun"
                    }
                };
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "Session",
                        data = new[]
                        {
                            "17", "26","23","45","14", "53","43","12"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "W1", "W2", "W3", "W4", "W5","W6","W7"
                    }
                };
            }
            else
            {
                chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "Session",
                        data = new[]
                        {
                            "45","14", "53", "17", "26","23","43","12","24"
                        }
                    }
                };
                chartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "1", "2", "3", "4", "5","6","7","8","9"
                    }
                };
            }

            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        private decimal MinuteToDecimal(int min, int sec)
        {
            return Convert.ToDecimal(min + sec * 0.0168);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}