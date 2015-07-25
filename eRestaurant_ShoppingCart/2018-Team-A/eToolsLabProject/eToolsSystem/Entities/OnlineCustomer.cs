namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OnlineCustomer")]
    public partial class OnlineCustomer
    {
        public OnlineCustomer()
        {
            ShoppingCarts = new HashSet<ShoppingCart>();
        }

        [Key]
        public int OnlineCustomerID { get; set; }

        [StringLength(128)]
        public string UserName { get; set; }

        public Guid? TrackingCookie { get; set; }

        public DateTime CreatedOn { get; set; }

        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
