using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eToolsSystem.Entities.POCOs
{
    public class OutstandingPurchaseOrderDetail
    {
        public int PurchaseOrderID { get; set; }
	    public int StockItemID{get; set;}
	    public string Description {get; set;}
	    public int Quantity{get; set;}
    }
}
