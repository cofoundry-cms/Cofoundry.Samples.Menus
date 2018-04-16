using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    /// <summary>
    /// <para>
    /// The nested menu demonstrates how you can build menus
    /// with a pre-defined number of menu levels. This is achieved
    /// using nested data models and teh [NestedDataModelCollection]
    /// attribute.
    /// </para>
    /// <para>
    /// This example only contains one nested menu level,
    /// but you could define more by creating and nested more menu 
    /// types. To an indeterminate number of menu levels (i.e. a tree 
    /// structure) have a look at the MultiLevelMenuDataModel.
    /// </para>
    /// </summary>
    public class NestedMenuDataModel : ICustomEntityDataModel
    {
        [Required]
        [NestedDataModelCollection(IsOrderable = true)]
        public ICollection<NestedMenuItemDataModel> Items { get; set; }
    }
}
