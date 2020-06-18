using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DashbordApplication.Models
{
    public class ChartLoadRequestObject
    {
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string RequestType { get; set; }
    }
}