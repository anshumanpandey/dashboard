using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DashbordApplication.Models;
using NHS.Common;
using NHS.Data;
using LicenseUsage = DashbordApplication.Models.LicenseUsage;

namespace DashbordApplication.Controllers
{
    public class HomeController : Controller
    {
        //https://www.jqueryscript.net/form/jQuery-Plugin-For-Selecting-Multiple-Elements-Multiple-Select.html
        public ActionResult Index()
        {
            return View();
        }

        #region Chart Load

        //https://www.jqueryscript.net/form/jQuery-Plugin-For-Selecting-Multiple-Elements-Multiple-Select.html


        [HttpGet]
        public JsonResult AssignedLicenseBarChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = System.DateTime.Now.AddDays(-365);
            DateTime endDate = System.DateTime.Now;
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<NHS.Common.LicenseUsage> usage = dBEngine.GetUserCount(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            var filteredUsages = new List<LicenseUsage>();
            var noOfTotalUsedLicense = 0;
            foreach (var data in usage.GroupBy(x => x.DistinctYear).ToList())
            {
                noOfTotalUsedLicense += data.Sum(x => x.UsedLicense);
                var licenseData = new LicenseUsage()
                {
                    DistinctYear = data.Key,
                    LicenseCount = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key,
                    UnusedLicense = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key - noOfTotalUsedLicense,
                    UsedLicense = data.Sum(x => x.UsedLicense)
                };
                filteredUsages.Add(licenseData);
            }

            var licenseInfo = new LicenseInformation
            {
                //TotalNodLicenseAllocated = yearlyResult.LicenseCount.ToString(),
                NoOfUsedLicense = filteredUsages.Sum(x => x.UsedLicense).ToString(),
                NoOfUnusedLicense = (filteredUsages.FirstOrDefault().LicenseCount - filteredUsages.Sum(x => x.UsedLicense)).ToString(),
            };

            var serisData = new[]
                {
                  Convert.ToInt32(licenseInfo.NoOfUsedLicense),Convert.ToInt32(licenseInfo.NoOfUnusedLicense)
                };
            var LabelData = new[]
                {
                    "Used", "Unused"
                };
            var result = new
            {
                serisData,
                LabelData,
                licenseInfo
            };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UserLicenseChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<NHS.Common.LicenseUsage> usage = dBEngine.GetUserCount(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));

            List<NHS.Common.LicenseUsage> filteredUsages = new List<NHS.Common.LicenseUsage>();


            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                //filteredUsages = usage.GroupBy(x => x.DistinctYear)
                //    .Select(y => new LicenseUsage
                //    {
                //        DistinctYear = y.Key,
                //        LicenseCount = y.GroupBy(z => z.LicenseCount).FirstOrDefault().Key,
                //        UnusedLicense = y.GroupBy(z => z.LicenseCount).FirstOrDefault().Key - y.Sum(z => z.UsedLicense),
                //        UsedLicense = y.Sum(z => z.UsedLicense),
                //    }).ToList();
                var noOfTotalUsedLicense = 0;
                foreach (var data in usage.GroupBy(x => x.DistinctYear).ToList())
                {
                    noOfTotalUsedLicense += data.Sum(x => x.UsedLicense);
                    var licenseData = new NHS.Common.LicenseUsage()
                    {
                        DistinctYear = data.Key,
                        LicenseCount = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key,
                        UnusedLicense = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key - noOfTotalUsedLicense,
                        UsedLicense = data.Sum(x => x.UsedLicense)
                    };
                    filteredUsages.Add(licenseData);
                }
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                var noOfTotalUsedLicense = 0;
                foreach (var data in usage.GroupBy(x => x.Month).ToList())
                {
                    noOfTotalUsedLicense += data.Sum(x => x.UsedLicense);
                    var licenseData = new NHS.Common.LicenseUsage()
                    {
                        Month = data.Key,
                        LicenseCount = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key,
                        UnusedLicense = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key - noOfTotalUsedLicense,
                        UsedLicense = data.Sum(x => x.UsedLicense)
                    };
                    filteredUsages.Add(licenseData);
                }
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                var noOfTotalUsedLicense = 0;
                foreach (var data in usage.GroupBy(x => x.Week).ToList())
                {
                    noOfTotalUsedLicense += data.Sum(x => x.UsedLicense);
                    var licenseData = new NHS.Common.LicenseUsage()
                    {
                        Week = data.Key,
                        LicenseCount = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key,
                        UnusedLicense = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key - noOfTotalUsedLicense,
                        UsedLicense = data.Sum(x => x.UsedLicense)
                    };
                    filteredUsages.Add(licenseData);
                }
            }
            else if (reqObj.RequestType == DataTypeEnum.daily.ToString())
            {
                var noOfTotalUsedLicense = 0;
                foreach (var data in usage.GroupBy(x => x.Day).ToList())
                {
                    noOfTotalUsedLicense += data.Sum(x => x.UsedLicense);
                    var licenseData = new NHS.Common.LicenseUsage()
                    {
                        Day = data.Key,
                        LicenseCount = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key,
                        UnusedLicense = data.GroupBy(z => z.LicenseCount).FirstOrDefault().Key - noOfTotalUsedLicense,
                        UsedLicense = data.Sum(x => x.UsedLicense)
                    };
                    filteredUsages.Add(licenseData);
                }
            }
            else
            {
                filteredUsages = usage;
            }

            var licenseInfo = new LicenseInformation
            {
                TotalNodLicenseAllocated = filteredUsages.FirstOrDefault()?.LicenseCount.ToString(),
                //NoOfUsedLicense = filteredUsages.FirstOrDefault()?.UsedLicense.ToString(),
                //NoOfUnusedLicense = filteredUsages.FirstOrDefault()?.UnusedLicense.ToString(),
            };

            var usedData = new List<string>();
            var unUsedData = new List<string>();
            var years = new List<string>();
            var months = new List<string>();
            var weeks = new List<string>();
            var days = new List<string>();

            foreach (var row in filteredUsages)
            {
                usedData.Add(row.UsedLicense.ToString());
                unUsedData.Add(row.UnusedLicense.ToString());
                if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
                {
                    years.Add(row.DistinctYear);
                }
                if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
                {
                    months.Add(row.Month);
                }
                if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
                {
                    weeks.Add(row.Week);
                }
                if (reqObj.RequestType == DataTypeEnum.daily.ToString())
                {
                    days.Add(row.Day);
                }
            }

            List<ChartResponseInformation> userLicenseData = new List<ChartResponseInformation>()
            {
                new ChartResponseInformation()
                {
                    name = "Used",
                    data = usedData.ToArray()
                },
                new ChartResponseInformation()
                {
                    name = "Unused",
                    data = unUsedData.ToArray()
                }
            };

            ChartOptionInformation userLicenseChartConfig = new ChartOptionInformation()
            {
                X_axisCategoryType = "category",
                X_axisCategories = reqObj.RequestType == DataTypeEnum.yearly.ToString() ? years.ToArray()
                    : reqObj.RequestType == DataTypeEnum.monthly.ToString() ? months.ToArray() :
                    reqObj.RequestType == DataTypeEnum.weekly.ToString() ? weeks.ToArray() :
                    reqObj.RequestType == DataTypeEnum.daily.ToString() ? days.ToArray() : years.ToArray()
            };

            var chartInfo = userLicenseData;
            var opt = userLicenseChartConfig;

            var result = new ChartResultResponse()
            {
                LicenseInfo = licenseInfo,
                ChartInfo = chartInfo,
                ChartOptions = opt,
                UsersLicenseInformationTableData = usage
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UserOverTimeChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserCount> users = dBEngine.GetActiveUsers(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            List<UserCount> usersActivity =
                dBEngine.GetActiveUsersActivity(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));


            var filteredUserCount = new List<UserCount>();

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                filteredUserCount = users.GroupBy(x => new { x.DistinctYear })
                    .Select(y => new UserCount
                    {
                        DistinctYear = y.Key.DistinctYear,
                        ActivityCount = y.GroupBy(z => z.UserName).Count(),
                        //UserName = y.Key.UserName
                    }).ToList();
            }
            else if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                filteredUserCount = users.GroupBy(x => new { x.Month })
                    .Select(y => new UserCount
                    {
                        Month = y.Key.Month,
                        ActivityCount = y.GroupBy(z => z.UserName).Count(),
                        //UserName = y.Key.UserName
                    }).ToList();
            }
            else if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                filteredUserCount = users.GroupBy(x => new { x.Week })
                    .Select(y => new UserCount
                    {
                        Week = y.Key.Week,
                        ActivityCount = y.GroupBy(z => z.UserName).Count(),
                        //UserName = y.Key.UserName
                    }).ToList();
            }
            else if (reqObj.RequestType == DataTypeEnum.daily.ToString())
            {
                filteredUserCount = users.GroupBy(x => new { x.Day })
                    .Select(y => new UserCount
                    {
                        Day = y.Key.Day,
                        ActivityCount = y.GroupBy(z => z.UserName).Count(),
                        //UserName = y.Key.UserName
                    }).ToList();
            }
            else
            {
                filteredUserCount = users;
            }

            var userCounter = new List<string>();
            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            var years = new List<string>();
            var months = new List<string>();
            var weeks = new List<string>();
            var days = new List<string>();

            foreach (var row in filteredUserCount)
            {
                userCounter.Add(row.ActivityCount.ToString());
                if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
                {
                    years.Add(row.DistinctYear);
                }
                if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
                {
                    months.Add(row.Month);
                }
                if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
                {
                    weeks.Add(row.Week);
                }
                if (reqObj.RequestType == DataTypeEnum.daily.ToString())
                {
                    days.Add(row.Day);
                }
            }



            #region Static Data area

            chartInfo = new List<ChartResponseInformation>{
                    new ChartResponseInformation()
                    {
                        name = "Active Users",
                        data = userCounter.ToArray()
                    }
                };
            chartOptions = new ChartOptionInformation()
            {
                X_axisCategoryType = "category",
                X_axisCategories = reqObj.RequestType == DataTypeEnum.yearly.ToString() ? years.ToArray()
                : reqObj.RequestType == DataTypeEnum.monthly.ToString() ? months.ToArray() :
                reqObj.RequestType == DataTypeEnum.weekly.ToString() ? weeks.ToArray() :
                reqObj.RequestType == DataTypeEnum.daily.ToString() ? days.ToArray() : years.ToArray()
            };



            #endregion

            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions,
                UsersCountInformation = usersActivity
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AvgTimeModuleChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserModuleDetails> userModuleDetails = dBEngine.GetUserModuleDetails(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            List<UserModuleDetails> userModuleTimeSpan = dBEngine.GetUserModuleTimeSpan(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]), true);


            var filteredResult = userModuleDetails.GroupBy(x => x.ModuleName).Select(y => new UserModuleDetails
            {
                ModuleName = y.Key,
                TimeSpan = Convert.ToInt32(y.Average(z => z.TimeSpan))
            }).ToList();

            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            var modules = new List<string>();
            var times = new List<string>();
            var moduleInfoDic = new Dictionary<string, string>();

            foreach (var data in filteredResult)
            {
                modules.Add(data.ModuleName);
                times.Add(data.TimeSpan.ToString());
                moduleInfoDic.Add(data.ModuleName, data.TimeSpan.ToString());
            }

            chartInfo = new List<ChartResponseInformation>{
                new ChartResponseInformation()
                {
                    name = "AVG Time",
                    data = times.ToArray()
                },

            };

            chartOptions = new ChartOptionInformation()
            {
                X_axisCategoryType = "category",
                X_axisCategories = modules.ToArray()
            };

            var result = new ChartResultResponse();

            if (reqObj.FilterByProjectId != null && reqObj.FilterByProjectId.Length > 0)
            {
                var seriesData = new List<string>();
                var seriesCategoryData = new List<string>();

                foreach (var project in reqObj.FilterByProjectId)
                {
                    seriesData.Add(moduleInfoDic.FirstOrDefault(x => x.Key == project).Value);
                    seriesCategoryData.Add(moduleInfoDic.FirstOrDefault(x => x.Key == project).Key);
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
                    ChartOptions = chartOptions,
                    UserModuleTimeSpanInformation = userModuleTimeSpan
                };
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult TotalTimeSpentByModuleChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserModuleDetails> userModuleDetails = dBEngine.GetUserModuleDetails(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));

            List<UserModuleDetails> userModuleTimeSpan = dBEngine.GetUserModuleTimeSpan(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]), false);


            //var filteredResult = userModuleDetails.GroupBy(x => x.UserName).Select(y => new UserModuleDetails
            //{
            //    ModuleName = y.Key,
            //    ActivityCount = Convert.ToInt32(y.Average(z => z.TimeSpan))
            //}).ToList();
            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            var filteredUserModuleDetails = new List<UserModuleDetails>();

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                filteredUserModuleDetails = userModuleDetails.GroupBy(x => new { x.Year, x.ModuleName })
                    .Select(x => new UserModuleDetails
                    {
                        ModuleName = x.Key.ModuleName,
                        Year = x.Key.Year,
                        TimeSpan = x.Sum(y => y.TimeSpan)
                    }).ToList();
            }

            if (reqObj.RequestType == DataTypeEnum.quarter.ToString())
            {
                filteredUserModuleDetails = userModuleDetails.GroupBy(x => new { x.Quarter, x.ModuleName })
                    .Select(x => new UserModuleDetails
                    {
                        ModuleName = x.Key.ModuleName,
                        Quarter = x.Key.Quarter,
                        TimeSpan = x.Sum(y => y.TimeSpan)
                    }).ToList();
            }

            if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                filteredUserModuleDetails = userModuleDetails.GroupBy(x => new { x.Month, x.ModuleName })
                    .Select(x => new UserModuleDetails
                    {
                        ModuleName = x.Key.ModuleName,
                        Month = x.Key.Month,
                        TimeSpan = x.Sum(y => y.TimeSpan)
                    }).ToList();
            }

            if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                filteredUserModuleDetails = userModuleDetails.GroupBy(x => new { x.Week, x.ModuleName })
                    .Select(x => new UserModuleDetails
                    {
                        ModuleName = x.Key.ModuleName,
                        Week = x.Key.Week,
                        TimeSpan = x.Sum(y => y.TimeSpan)
                    }).ToList();
            }

            #region Static Data Area
            var xAxisCategories = new List<string>();
            var chartResponse = new List<ChartResponseInformation>();

            var serisData = new List<string>();

            var dResult = filteredUserModuleDetails.GroupBy(x => x.ModuleName).ToList();
            foreach (var row in dResult)
            {
                chartResponse.Add(new ChartResponseInformation
                {
                    name = row.Key,
                    data = filteredUserModuleDetails.Where(x => x.ModuleName == row.Key).Select(x => x.TimeSpan.ToString()).ToArray()
                });
            }
            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                var yearData = filteredUserModuleDetails.GroupBy(x => x.Year).ToList();
                foreach (var year in yearData)
                {
                    if (!xAxisCategories.Any(x => x == year.Key.ToString()))
                    {
                        xAxisCategories.Add((year.Key.ToString()));
                    }
                }
            }
            if (reqObj.RequestType == DataTypeEnum.quarter.ToString())
            {

                var quarterData = filteredUserModuleDetails.GroupBy(x => x.Quarter).ToList();
                foreach (var quarter in quarterData)
                {
                    if (!xAxisCategories.Any(x => x == quarter.Key.ToString()))
                    {
                        xAxisCategories.Add((quarter.Key.ToString()));
                    }
                }
            }

            if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {

                var monthData = filteredUserModuleDetails.GroupBy(x => x.Month).ToList();
                foreach (var month in monthData)
                {
                    if (!xAxisCategories.Any(x => x == month.Key.ToString()))
                    {
                        xAxisCategories.Add((month.Key.ToString()));
                    }
                }
            }

            if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {

                var weekData = filteredUserModuleDetails.GroupBy(x => x.Week).ToList();
                foreach (var week in weekData)
                {
                    if (!xAxisCategories.Any(x => x == week.Key.ToString()))
                    {
                        xAxisCategories.Add((week.Key.ToString()));
                    }
                }
            }


            chartInfo = chartResponse;
            chartOptions = new ChartOptionInformation
            {
                X_axisCategoryType = "category",
                X_axisCategories = xAxisCategories.ToArray()
            };


            #endregion


            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions,
                UserModuleTimeSpanInformation = userModuleTimeSpan
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SessionAvgTimeByUserByModuleChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserModuleDetails> userModuleDetails = dBEngine.GetUserModuleDetails(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            List<UserModuleInfo> userModuleInfo = dBEngine.GetUserModuleInfo(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            var chartInfo = new List<ChartResponseInformation>();

            var filteredResult = userModuleDetails.GroupBy(x => new { x.UserName, x.ModuleName }).Select(
                y => new UserModuleDetails
                {
                    UserName = y.Key.UserName,
                    ModuleName = y.Key.ModuleName,
                    ActivityCount = y.Count()
                }).ToList();

            var chartOptions = new ChartOptionInformation();
            var xAxisData = new List<string>();
            var chartData = new List<ChartResponseInformation>();
            var chartInfoData = new List<string>();

            var dResult = filteredResult.GroupBy(x => x.ModuleName).ToList();

            foreach (var moduleInfo in dResult)
            {
                chartData.Add(new ChartResponseInformation
                {
                    name = moduleInfo.Key,
                    data = filteredResult.Where(x => x.ModuleName == moduleInfo.Key).Select(x => x.ActivityCount.ToString()).ToArray()
                });

            }

            foreach (var userData in filteredResult.GroupBy(x => x.UserName).ToList())
            {
                if (!xAxisData.Any(x => x == userData.Key))
                {
                    xAxisData.Add(userData.Key);
                }
            }

            chartInfo = chartData;
            chartOptions = new ChartOptionInformation
            {
                X_axisCategoryType = "category",
                X_axisCategories = xAxisData.ToArray()
            };


            var result = new ChartResultResponse();

            if (reqObj.FilterByUserId != null && reqObj.FilterByUserId.Length > 0)
            {
                var seriesData = new List<ChartResponseInformation>();
                var seriesCategoriesData = new List<string>();
                foreach (var userId in reqObj.FilterByUserId)
                {
                    var seriesDataIndex = Array.IndexOf(chartOptions.X_axisCategories, userId);

                    seriesData.Add(chartInfo[seriesDataIndex]);
                    seriesCategoriesData.Add(userId);
                }

                result = new ChartResultResponse()
                {
                    ChartInfo = seriesData,
                    ChartOptions = new ChartOptionInformation
                    {
                        X_axisCategoryType = "category",
                        X_axisCategories = seriesCategoriesData.ToArray()
                    }
                };
            }
            else
            {
                result = new ChartResultResponse()
                {
                    ChartInfo = chartInfo,
                    ChartOptions = chartOptions,
                    UserModuleInformation = userModuleInfo
                };

            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SessionChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserCount> users = dBEngine.GetActiveUsers(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            List<UserSessionCount> userSessionCount = dBEngine.GetUsersSessionCount(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));

            var filteredUserCount = users.GroupBy(x => x.UserName)
                .Select(x => new UserCount
                {
                    UserName = x.Key,
                    ActivityCount = x.Sum(y => y.ActivityCount)
                }).ToList();

            var stringUserActivityCounter = new List<string>();
            var stringUsers = new List<string>();
            var userActivityInfo = new Dictionary<string, string>();

            foreach (var user in filteredUserCount)
            {
                stringUsers.Add(user.UserName);
                stringUserActivityCounter.Add(user.ActivityCount.ToString());
                userActivityInfo.Add(user.UserName, user.ActivityCount.ToString());
            }

            var chartInfo = new List<ChartResponseInformation>();

            var chartOptions = new ChartOptionInformation();

            chartInfo = new List<ChartResponseInformation> {
                new ChartResponseInformation
                {
                    name = "",
                    data = stringUserActivityCounter.ToArray()
                }
            };
            chartOptions = new ChartOptionInformation
            {
                X_axisCategoryType = "category",
                X_axisCategories = stringUsers.ToArray()
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
                        seriesDataArray.Add(userActivityInfo.FirstOrDefault(x => x.Key == userId).Value);
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
                    ChartOptions = chartOptions,
                    UserSessionCountInformation = userSessionCount
                };
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SessionTimeChartResult(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserCount> users = dBEngine.GetActiveUsers(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            List<UserModuleDetails> userModuleDetails = dBEngine.GetUserModuleDetails(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));

            var chartInfo = new List<ChartResponseInformation>();

            var filteredResult = new List<UserCount>();

            var chartOptions = new ChartOptionInformation();

            if (reqObj.RequestType == DataTypeEnum.yearly.ToString())
            {
                filteredResult = users.GroupBy(x => x.DistinctYear).Select(y => new UserCount
                {
                    DistinctYear = y.Key,
                    ActivityCount = y.Sum(z => z.ActivityCount)
                }).ToList();
            }
            if (reqObj.RequestType == DataTypeEnum.monthly.ToString())
            {
                filteredResult = users.GroupBy(x => x.Month).Select(y => new UserCount
                {
                    Month = y.Key,
                    ActivityCount = y.Sum(z => z.ActivityCount)
                }).ToList();
            }
            if (reqObj.RequestType == DataTypeEnum.weekly.ToString())
            {
                filteredResult = users.GroupBy(x => x.Week).Select(y => new UserCount
                {
                    Week = y.Key,
                    ActivityCount = y.Sum(z => z.ActivityCount)
                }).ToList();
            }
            if (reqObj.RequestType == DataTypeEnum.daily.ToString())
            {
                filteredResult = users.GroupBy(x => x.Day).Select(y => new UserCount
                {
                    Day = y.Key,
                    ActivityCount = y.Sum(z => z.ActivityCount)
                }).ToList();
            }

            var seriesData = new List<string>();
            var xAxisData = new List<string>();

            foreach (var userCountInfo in filteredResult)
            {
                seriesData.Add(userCountInfo.ActivityCount.ToString());
                xAxisData.Add(reqObj.RequestType == DataTypeEnum.yearly.ToString() ? userCountInfo.DistinctYear :
                    reqObj.RequestType == DataTypeEnum.monthly.ToString() ? userCountInfo.Month :
                    reqObj.RequestType == DataTypeEnum.weekly.ToString() ? userCountInfo.Week :
                    userCountInfo.Day);
            }

            #region Static Data Area


            chartInfo = new List<ChartResponseInformation>
                {
                    new ChartResponseInformation()
                    {
                        name = "Session",
                        data = seriesData.ToArray()
                    }
                };
            chartOptions = new ChartOptionInformation()
            {
                X_axisCategoryType = "category",
                X_axisCategories = xAxisData.ToArray()
            };


            #endregion

            var result = new ChartResultResponse()
            {
                ChartInfo = chartInfo,
                ChartOptions = chartOptions,
                UserModuleTimeSpanInformation = userModuleDetails
            };

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetUsers(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserModuleDetails> userModuleDetails = dBEngine.GetUserModuleDetails(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));
            var userList = userModuleDetails.GroupBy(x => x.UserName)
                .Select(y => new UserInformation
                {
                    Id = y.Key,
                    UserName = y.Key
                }).ToList();
            return Json(userList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSessionChartUsers(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserCount> users = dBEngine.GetActiveUsers(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));

            var userList = users.GroupBy(x => x.UserName)
                .Select(x => new UserInformation
                {
                    Id = x.Key,
                    UserName = x.Key
                }).ToList();
            return Json(userList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetModules(ChartLoadRequestObject reqObj)
        {
            DateTime startDate = string.IsNullOrEmpty(reqObj.StartDate) ? System.DateTime.Now.AddDays(-365) : DateTime.ParseExact(reqObj.StartDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime endDate = string.IsNullOrEmpty(reqObj.EndDate) ? System.DateTime.Now : DateTime.ParseExact(reqObj.EndDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string connectionString = ConfigurationManager.ConnectionStrings["NHSConStr"].ConnectionString;
            DBEngine dBEngine = new DBEngine(connectionString);
            List<UserModuleDetails> userModuleDetails = dBEngine.GetUserModuleDetails(startDate, endDate, Convert.ToInt32(Session["LoginUserID"]));

            var moduleList = userModuleDetails.GroupBy(x => x.ModuleName).Select(x => new ModuleInformation()
            {
                ModuleId = x.Key,
                ModuleName = x.Key
            }).ToList();
            return Json(moduleList, JsonRequestBehavior.AllowGet);
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


        #endregion


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