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
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult AssignedLicenseBarChartResult(ChartLoadRequestObject reqObj)
        {
            var assignedLicense = "30"; 
            return Json(assignedLicense, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult UserLicenseChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                LicenseInfo = new LicenseInformation
                {
                    TotalNodLicenseAllocated = "100",
                    NoOfUsedLicense = "30",
                    NoOfUnusedLicense = "70"
                },
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation()
                    {
                        name = "Used",
                        data = new []
                        {
                            "44","55","41"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Unused",
                        data = new []
                        {
                            "30","42","60"
                        }
                    }
                },
                ChartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new []
                    {
                        "Jan",
                        "Feb",
                        "Mar"
                    }
                }
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult AvgTimeModuleChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation()
                    {
                        name = "AVG Time",
                        data = new []
                        {
                            $"{MinuteToDecimal(10,0):##.##}",
                            $"{MinuteToDecimal(8,0):##.##}",
                            $"{MinuteToDecimal(11,25):##.##}"
                        }
                    },
                    
                },
                ChartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "ME",
                        "STR",
                        "SJRL"
                    }
                }
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult UserOverTimeChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation()
                    {
                        name = "Used License",
                        data = new []
                        {
                            "31", "40", "28", "51", "42", "109", "100"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "Unused License",
                        data = new []
                        {
                            "11", "32", "45", "32", "34", "52", "41"
                        }
                    },
                },
                ChartOptions = new ChartOptionInformation
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
                }
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult AvgSpentTimeByModuleChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation()
                    {
                        name = "MZ",
                        data = new []
                        {
                            "31", "40", "28", "51", "42", "109", "100"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJRI",
                        data = new []
                        {
                            "11", "32", "45", "32", "34", "52", "41"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJRL",
                        data = new []
                        {
                            "15", "45", "30", "28", "48", "55", "67"
                        }
                    }
                },
                ChartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "1", "2", "3", "4", "5", "6", "7"
                    }
                }
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult SessionAvgTimeByUserByModuleChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation()
                    {
                        name = "ME",
                        data = new []
                        {
                            "20","50","13","18"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "STR",
                        data = new []
                        {
                            "46","0","28","32"
                        }
                    },
                    new ChartResponseInformation()
                    {
                        name = "SJRL",
                        data = new []
                        {
                            "30","30","25","15"
                        }
                    }
                },
                ChartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "U1", "U2", "U3", "U4"
                    }
                }
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult SessionChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation
                    {
                        name = "",
                        data = new[]
                        {
                            "30", "46", "25", "50","38"
                        }
                    }
                },
                ChartOptions = new ChartOptionInformation
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "U1", "U2", "U3", "U4","U5"
                    }
                }
            };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult SessionTimeChartResult(ChartLoadRequestObject reqObj)
        {
            var result = new
            {
                ChartInfo = new List<ChartResponseInformation>()
                {
                    new ChartResponseInformation()
                    {
                        name = "Session",
                        data = new[]
                        {
                            "10", "41", "35", "51", "49", "62", "69", "91", "148"
                        }
                    }
                },
                ChartOptions = new ChartOptionInformation()
                {
                    X_axisCategoryType = "category",
                    X_axisCategories = new[]
                    {
                        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
                    }
                }
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