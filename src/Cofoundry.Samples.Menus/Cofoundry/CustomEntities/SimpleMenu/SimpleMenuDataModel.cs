using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    /// <summary>
    /// The simple menu demonstrates how you can build a content
    /// manageable list of pages using the [PageCollection] attribute.
    /// </summary>
    public class SimpleMenuDataModel : ICustomEntityDataModel
    {
        [Required]
        [PageCollection(IsOrderable = true)]
        public ICollection<int> PageIds { get; set; }
    }
}

