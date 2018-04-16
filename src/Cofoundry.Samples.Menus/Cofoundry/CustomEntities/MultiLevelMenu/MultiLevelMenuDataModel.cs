using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    public class MultiLevelMenuDataModel : ICustomEntityDataModel
    {
        [Required]
        [NestedDataModelCollection(IsOrderable = true)]
        public ICollection<MultiLevelMenuNodeDataModel> Items { get; set; }
    }
}
