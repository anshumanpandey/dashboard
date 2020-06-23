using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DashbordApplication.Models
{
    public class LicenseUsage
    {
       // public LicenseUsage();

        public string Day { get; set; }
        public string DistinctYear { get; set; }
        public int LicenseCount { get; set; }
        public string Month { get; set; }
        public int UnusedLicense { get; set; }
        public int UsedLicense { get; set; }
        public string Week { get; set; }
    }
}