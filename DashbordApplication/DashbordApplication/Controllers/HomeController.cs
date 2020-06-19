using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DashbordApplication.Models;

namespace DashbordApplication.Controllers
{
    public class HomeController : Controller
    {
        //https://www.jqueryscript.net/form/jQuery-Plugin-For-Selecting-Multiple-Elements-Multiple-Select.html
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

            List<ChartResponseInformation> userLicenseData = new List<ChartResponseInformation>()
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

         ChartOptionInformation userLicenseChartConfig = new ChartOptionInformation()
            {
                X_axisCategoryType = "category",
                X_axisCategories = new[]
                {
                    "2020"
                }
            };

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                chartInfo = userLicenseData;
                opt = userLicenseChartConfig;
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                chartInfo = userLicenseData;
                opt = userLicenseChartConfig;
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                chartInfo = userLicenseData;
                opt = userLicenseChartConfig;
            }
            else
            {
                chartInfo = userLicenseData;
                opt = userLicenseChartConfig;
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

            #region Static Data area

            //if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "Used License",
            //            data = new[]
            //            {
            //                "34","45","30"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Unused License",
            //            data = new[]
            //            {
            //                "74", "65", "70"
            //            }
            //        },
            //    }; ;
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "2018",
            //            "2019",
            //            "2020"

            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "Used License",
            //            data = new[]
            //            {
            //                "34","45","30","23","54"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Unused License",
            //            data = new[]
            //            {
            //                "74", "65", "70","55","45"
            //            }
            //        },
            //    }; ;
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "Jan",
            //            "Feb",
            //            "Mar",
            //            "Apr",
            //            "May"

            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "Used License",
            //            data = new[]
            //            {
            //                "34","45","30","34","22","33","88","23"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Unused License",
            //            data = new[]
            //            {
            //                "74", "65", "70","22","44","23","11","33"
            //            }
            //        },
            //    }; ;
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "W1",
            //            "W2",
            //            "W3",
            //            "W4",
            //            "W5",
            //            "W6",
            //            "W7",
            //            "W8",

            //        }
            //    };
            //}
            //else
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "Used License",
            //            data = new[]
            //            {
            //                "34","22","18","45","30","33","88","23"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Unused License",
            //            data = new[]
            //            {
            //                "22","44","23","74", "65", "70","11","33"
            //            }
            //        },
            //    }; ;
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "1",
            //            "2",
            //            "3",
            //            "4",
            //            "5",
            //            "6",
            //            "7",
            //            "8",

            //        }
            //    };
            //}


            #endregion

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

            var result = new ChartResultResponse();

            if (reqObj.FilterByProjectId != null && reqObj.FilterByProjectId.Length > 0)
            {
                var seriesData = new List<string>();
                var seriesCategoryData = new List<string>();

                foreach (var project in reqObj.FilterByProjectId)
                {
                    var projectIndex = Array.IndexOf(chartOptions.X_axisCategories, project);

                    seriesData.Add(chartInfo.FirstOrDefault()?.data[projectIndex]);
                    seriesCategoryData.Add(project);
                }

                result = new ChartResultResponse()
                {
                    ChartInfo = chartInfo.Select(x => new ChartResponseInformation()
                    {
                        name = x.name,
                        titile = x.titile,
                        data = seriesData.ToArray()
                    })
                    ,
                    ChartOptions = new ChartOptionInformation()
                    {
                        X_axisCategoryType = chartOptions.X_axisCategoryType,
                        X_axisCategories = seriesCategoryData.ToArray()
                    }
                };
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

            #region Static Data Area

            //if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "ME",
            //            data = new[]
            //            {
            //                "31", "40", "28", "51"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "QAP",
            //            data = new[]
            //            {
            //                "11", "32", "45", "32"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "MEO",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28"
            //            }
            //        }
            //        ,
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR1",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR Outcome",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR2",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Coding Review",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "2017", "2018", "1019", "2020"
            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "ME",
            //            data = new[]
            //            {
            //                "40", "28", "31", "51"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "QAP",
            //            data = new[]
            //            {
            //                "32", "45", "11", "32"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "MEO",
            //            data = new[]
            //            {
            //                "45", "30", "15","28"
            //            }
            //        }
            //        ,
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR1",
            //            data = new[]
            //            {
            //                "30", "28", "15", "45"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR Outcome",
            //            data = new[]
            //            {
            //                "15",  "28","45", "30",
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR2",
            //            data = new[]
            //            {
            //                "28","15", "23", "45"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Coding Review",
            //            data = new[]
            //            {
            //                "15", "45","28", "30"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "Jan", "Feb", "Mar", "Apr"
            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "ME",
            //            data = new[]
            //            {
            //                "31", "40", "28", "51","22","17"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "QAP",
            //            data = new[]
            //            {
            //                "11","22","17", "32", "45", "32"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "MEO",
            //            data = new[]
            //            {
            //                "15", "45","22","17","30", "28"
            //            }
            //        }
            //        ,
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR1",
            //            data = new[]
            //            {
            //                "22","17" ,"15", "45", "30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR Outcome",
            //            data = new[]
            //            {
            //                "15",  "28","22","17","45", "30"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR2",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28","28","22"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Coding Review",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28","45", "30"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "w1", "w2", "w3", "w4","w5","w6"
            //        }
            //    };
            //}
            //else
            //{
            //    chartInfo = new List<ChartResponseInformation>{
            //        new ChartResponseInformation()
            //        {
            //            name = "ME",
            //            data = new[]
            //            {
            //                "31", "40", "28", "51","32", "45", "32","56"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "QAP",
            //            data = new[]
            //            {
            //                "11", "32", "45", "32","34","23","23","91"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "MEO",
            //            data = new[]
            //            {
            //                "15", "45","34","23", "30", "28","58","43"
            //            }
            //        }
            //        ,
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR1",
            //            data = new[]
            //            {
            //                "15","34","23","58","43", "45", "30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR Outcome",
            //            data = new[]
            //            {
            //                "34","23","58","43","15", "45", "30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "SJR2",
            //            data = new[]
            //            {
            //                "15", "45","34","23","58","43","30", "28"
            //            }
            //        },
            //        new ChartResponseInformation()
            //        {
            //            name = "Coding Review",
            //            data = new[]
            //            {
            //                "15", "45", "30", "28","34","23","58","43"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "1", "2", "3", "4","5","6","7","8"
            //        }
            //    };
            //}

            #endregion


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


            var result = new ChartResultResponse();

            if (reqObj.FilterByProjectId != null && reqObj.FilterByProjectId.Length > 0)
            {
                var seriesData = new List<ChartResponseInformation>();
                //var seriesCategoriesData = new List<string>();
                foreach (var projectId in reqObj.FilterByProjectId)
                {
                    seriesData.Add(chartInfo.FirstOrDefault(x => x.name == projectId));
                    //seriesCategoriesData.Add(projectId);
                }

                result = new ChartResultResponse()
                {
                    ChartInfo = seriesData,
                    ChartOptions = new ChartOptionInformation
                    {
                        X_axisCategoryType = "category",
                        X_axisCategories = new[]
                        {
                            "U1", "U2", "U3", "U4","U5"
                        }
                    }
                };
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

            var result = new ChartResultResponse();
            if (reqObj.FilterByUserId != null && reqObj.FilterByUserId.Length > 0)
            {

                var seriesDataArray = new List<string>();
                var categoriesDataArray = new List<string>();

                foreach (var userId in reqObj.FilterByUserId)
                {
                    if (!string.IsNullOrEmpty(userId))
                    {
                        var userNameIndex = Array.IndexOf(chartOptions.X_axisCategories, userId.ToUpper().Trim());

                        seriesDataArray.Add(chartInfo.FirstOrDefault()?.data[userNameIndex]);
                        categoriesDataArray.Add(userId);

                    }
                }

                result = new ChartResultResponse()
                {
                    ChartInfo = chartInfo.Select(x => new ChartResponseInformation
                    {
                        name = x.name,
                        titile = x.titile,
                        data = seriesDataArray.ToArray()
                    }),
                    ChartOptions = new ChartOptionInformation()
                    {
                        X_axisCategoryType = chartOptions.X_axisCategoryType,
                        X_axisCategories = categoriesDataArray.ToArray()
                    }
                };
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

            #region Static Data Area

            //if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>
            //    {
            //        new ChartResponseInformation()
            //        {
            //            name = "Session",
            //            data = new[]
            //            {
            //                "10", "41", "35", "51"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "2017", "2018", "2019", "2020"
            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>
            //    {
            //        new ChartResponseInformation()
            //        {
            //            name = "Session",
            //            data = new[]
            //            {
            //                "17", "14", "53", "26"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "Jan", "Feb", "Mar", "Apr", "May","Jun"
            //        }
            //    };
            //}
            //else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            //{
            //    chartInfo = new List<ChartResponseInformation>
            //    {
            //        new ChartResponseInformation()
            //        {
            //            name = "Session",
            //            data = new[]
            //            {
            //                "17", "26","23","45","14", "53","43","12"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "W1", "W2", "W3", "W4", "W5","W6","W7"
            //        }
            //    };
            //}
            //else
            //{
            //    chartInfo = new List<ChartResponseInformation>
            //    {
            //        new ChartResponseInformation()
            //        {
            //            name = "Session",
            //            data = new[]
            //            {
            //                "45","14", "53", "17", "26","23","43","12","24"
            //            }
            //        }
            //    };
            //    chartOptions = new ChartOptionInformation()
            //    {
            //        X_axisCategoryType = "category",
            //        X_axisCategories = new[]
            //        {
            //            "1", "2", "3", "4", "5","6","7","8","9"
            //        }
            //    };
            //}

            #endregion

            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetUsers()
        {
            var userList = GetUserList();
            return Json(userList, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetModules()
        {
            var projectList = GetProjectList();
            return Json(projectList, JsonRequestBehavior.AllowGet);
        }

        private static List<ModuleInformation> GetProjectList()
        {
            return new List<ModuleInformation>()
            {
                new ModuleInformation()
                {
                    ModuleId = "ME",
                    ModuleName = "ME"
                },
                new ModuleInformation()
                {
                    ModuleId = "QAP",
                    ModuleName = "QAP"
                },
                new ModuleInformation()
                {
                    ModuleId = "MEO",
                    ModuleName = "MEO"
                },
                new ModuleInformation()
                {
                    ModuleId = "SJR1",
                    ModuleName = "SJR1"
                },
                new ModuleInformation()
                {
                    ModuleId = "SJR Outcome",
                    ModuleName = "SJR Outcome"
                },
                new ModuleInformation()
                {
                    ModuleId = "SJR2",
                    ModuleName = "SJR2"
                },
                new ModuleInformation()
                {
                    ModuleId = "Coding Review",
                    ModuleName = "Coding Review"
                }
            };
        }

        private static List<UserInformation> GetUserList()
        {
            return new List<UserInformation>()
            {
                new UserInformation()
                {
                    Id = "U1",
                    UserName = "U1"
                },
                new UserInformation()
                {
                    Id = "U2",
                    UserName = "U2"
                },
                new UserInformation()
                {
                    Id = "U3",
                    UserName = "U3"
                },
                new UserInformation()
                {
                    Id = "U4",
                    UserName = "U4"
                },
                new UserInformation()
                {
                    Id = "U5",
                    UserName = "U5"
                },
                new UserInformation()
                {
                    Id = "U6",
                    UserName = "U6"
                },
            };
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