//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Tsirk
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comments
    {
        public int id { get; set; }
        public int user_id { get; set; }
        public string comment { get; set; }
    
        public virtual Users Users { get; set; }
    }
}
