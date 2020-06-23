using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NHS.Common;

namespace DashbordApplication.Models
{
    public class ChartResultResponse
    {
        public LicenseInformation LicenseInfo { get; set; }
        public IEnumerable<ChartResponseInformation> ChartInfo { get; set; }
        public ChartOptionInformation ChartOptions { get; set; }
        public IEnumerable<NHS.Common.LicenseUsage> UsersLicenseInformationTableData { get; set; }
        public IEnumerable<UserCount> UsersCountInformation { get; set; }
        public IEnumerable<UserModuleDetails> UserModuleTimeSpanInformation { get; set; }
        public IEnumerable<UserModuleInfo> UserModuleInformation { get; set; }
        public IEnumerable<UserSessionCount> UserSessionCountInformation { get; set; }
    }
}