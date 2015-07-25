namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Coupon
    {
        public Coupon()
        {
            Sales = new HashSet<Sale>();
        }

        [Key]
        public int CouponID { get; set; }

        [Required]
        [StringLength(10)]
        public string CouponIDValue { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public int CouponDiscount { get; set; }

        public virtual ICollection<Sale> Sales { get; set; }
    }
}
