namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ReceiveOrder
    {
        public ReceiveOrder()
        {
            ReceiveOrderDetails = new HashSet<ReceiveOrderDetail>();
            ReturnedOrderDetails = new HashSet<ReturnedOrderDetail>();
        }

        public int ReceiveOrderID { get; set; }

        public int PurchaseOrderID { get; set; }

        public DateTime? ReceiveDate { get; set; }

        public virtual PurchaseOrder PurchaseOrder { get; set; }

        public virtual ICollection<ReceiveOrderDetail> ReceiveOrderDetails { get; set; }

        public virtual ICollection<ReturnedOrderDetail> ReturnedOrderDetails { get; set; }
    }
}
