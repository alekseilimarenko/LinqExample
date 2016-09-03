using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinqExample
{
    public class CustomerOrderResult
    {
        public int CustomerId { get; set; }

        public string CustomerName { get; set; }

        public string CustomerAddress { get; set; }

        public int ResultAmount { get; set; }
    }
}