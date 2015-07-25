using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eToolsSystem.Entities.POCOs
{
    public class OutstandingPurchaseOrder
    {
        public int PurchaseOrderID {get; set;}
		public DateTime? OrderDate {get; set;}
	    public string Vendor {get; set;}
        public string ContactPhone { get; set; }
    }
}
