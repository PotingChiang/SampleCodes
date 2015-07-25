namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class StockItem
    {
        public StockItem()
        {
            PurchaseOrderDetails = new HashSet<PurchaseOrderDetail>();
            SaleDetails = new HashSet<SaleDetail>();
            SaleRefundDetails = new HashSet<SaleRefundDetail>();
            ShoppingCartItems = new HashSet<ShoppingCartItem>();
        }

        [Key]
        public int StockItemID { get; set; }

        [Required]
        [StringLength(50)]
        public string Description { get; set; }

        [Column(TypeName = "money")]
        public decimal SellingPrice { get; set; }

        [Column(TypeName = "money")]
        public decimal PurchasePrice { get; set; }

        public int QuantityOnHand { get; set; }

        public int QuantityOnOrder { get; set; }

        public int ReOrderLevel { get; set; }

        public bool Discontinued { get; set; }

        public int VendorID { get; set; }

        [StringLength(25)]
        public string VendorStockNumber { get; set; }

        public int CategoryID { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<PurchaseOrderDetail> PurchaseOrderDetails { get; set; }

        public virtual ICollection<SaleDetail> SaleDetails { get; set; }

        public virtual ICollection<SaleRefundDetail> SaleRefundDetails { get; set; }

        public virtual ICollection<ShoppingCartItem> ShoppingCartItems { get; set; }

        public virtual Vendor Vendor { get; set; }
    }
}
