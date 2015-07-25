namespace eToolsSystem
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Employee
    {
        public Employee()
        {
            PurchaseOrders = new HashSet<PurchaseOrder>();
            SaleRefunds = new HashSet<SaleRefund>();
            Sales = new HashSet<Sale>();
        }

        public int EmployeeID { get; set; }

        [Required]
        [StringLength(25)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(25)]
        public string LastName { get; set; }

        public DateTime DateHired { get; set; }

        public DateTime? DateReleased { get; set; }

        public int PositionID { get; set; }

        [StringLength(30)]
        public string LoginID { get; set; }

        public Guid? EmployeeUID { get; set; }

        [NotMapped]
        public string FullName { get { return string.Format("{0}, {1}", LastName, FirstName); } }

        public virtual Position Position { get; set; }

        public virtual ICollection<PurchaseOrder> PurchaseOrders { get; set; }

        public virtual ICollection<SaleRefund> SaleRefunds { get; set; }

        public virtual ICollection<Sale> Sales { get; set; }
    }
}
