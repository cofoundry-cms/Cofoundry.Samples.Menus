using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    /// <summary>
    /// The interface INestedDataModel tells Cofoundry that
    /// is can be nested inside another data model. 
    public class NestedMenuChildItemDataModel : INestedDataModel
    {
        [Required]
        [MaxLength(30)]
        public string Title { get; set; }

        [Required]
        [Page]
        public int PageId { get; set; }
    }
}
