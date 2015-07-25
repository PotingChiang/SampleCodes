namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Sale
    {
        public Sale()
        {
            SaleDetails = new HashSet<SaleDetail>();
            SaleRefunds = new HashSet<SaleRefund>();
        }

        [Key]
        public int SaleID { get; set; }

        public DateTime SaleDate { get; set; }

        [StringLength(128)]
        public string UserName { get; set; }

        [Required]
        [StringLength(1)]
        public string PaymentType { get; set; }

        public int? EmployeeID { get; set; }

        [Column(TypeName = "money")]
        public decimal TaxAmount { get; set; }

        [Column(TypeName = "money")]
        public decimal SubTotal { get; set; }

        public int? CouponID { get; set; }

        public Guid PaymentToken { get; set; }

        public virtual Coupon Coupon { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual ICollection<SaleDetail> SaleDetails { get; set; }

        public virtual ICollection<SaleRefund> SaleRefunds { get; set; }
    }
}
