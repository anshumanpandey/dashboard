using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DashbordApplication.Models
{
    public class ChartResultResponse
    {
        public LicenseInformation LicenseInfo { get; set; }
        public IEnumerable<ChartResponseInformation> ChartInfo { get; set; }
        public ChartOptionInformation ChartOptions { get; set; }
    }
}