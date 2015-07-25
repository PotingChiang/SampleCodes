using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eToolsSystem.Entities.POCOs
{
    public class ShoppingCart
    {
        public int ShoppingCartID { get; set; }
        public int StockItemID { get; set; }
        public string ProductDes { get; set; }
        public int QOB { get; set; }
        public Decimal SellingPrice { get; set; }
        public Decimal SingleItemtotalPrice { get; set; }
        public Decimal SubTotal { get; set; }

    }
}
