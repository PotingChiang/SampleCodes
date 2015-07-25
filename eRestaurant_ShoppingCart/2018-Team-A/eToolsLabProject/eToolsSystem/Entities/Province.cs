namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Province
    {
        public Province()
        {
            Vendors = new HashSet<Vendor>();
        }

        [StringLength(2)]
        public string ProvinceID { get; set; }

        [Required]
        [StringLength(50)]
        public string Description { get; set; }

        public virtual ICollection<Vendor> Vendors { get; set; }
    }
}
