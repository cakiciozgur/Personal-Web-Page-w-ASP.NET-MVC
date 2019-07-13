//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PersonalWebSite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class MakaleDetay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MakaleDetay()
        {
            this.Makale = new HashSet<Makale>();
        }
    
        public int makaleDetayID { get; set; }

        [Required(ErrorMessage = "Blog Başlığı boş geçilemez!")]
        [StringLength(200, ErrorMessage = "Blog Başlığı en az 10-200 karakter aralığında olmalıdır!", MinimumLength = 10)]
        public string baslik { get; set; }

        public string icerik { get; set; }

        public string fotograf { get; set; }

        public Nullable<System.DateTime> yayınlanmaTarihi { get; set; }
        public Nullable<int> goruntulenmeSayisi { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Makale> Makale { get; set; }
    }
}
