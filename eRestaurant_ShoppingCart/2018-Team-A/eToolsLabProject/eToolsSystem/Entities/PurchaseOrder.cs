namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PurchaseOrder
    {
        public PurchaseOrder()
        {
            PurchaseOrderDetails = new HashSet<PurchaseOrderDetail>();
            ReceiveOrders = new HashSet<ReceiveOrder>();
        }

        public int PurchaseOrderID { get; set; }

        public DateTime? OrderDate { get; set; }

        public int VendorID { get; set; }

        public int EmployeeID { get; set; }

        [Column(TypeName = "money")]
        public decimal TaxAmount { get; set; }

        [Column(TypeName = "money")]
        public decimal SubTotal { get; set; }

        public bool Closed { get; set; }

        [StringLength(100)]
        public string Notes { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual ICollection<PurchaseOrderDetail> PurchaseOrderDetails { get; set; }

        public virtual Vendor Vendor { get; set; }

        public virtual ICollection<ReceiveOrder> ReceiveOrders { get; set; }
    }
}
