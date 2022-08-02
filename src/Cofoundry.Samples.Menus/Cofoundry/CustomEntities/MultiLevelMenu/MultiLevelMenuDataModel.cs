using System.ComponentModel.DataAnnotations;

namespace Cofoundry.Samples.Menus;

public class MultiLevelMenuDataModel : ICustomEntityDataModel
{
    [Required]
    [NestedDataModelCollection(IsOrderable = true)]
    public ICollection<MultiLevelMenuNodeDataModel> Items { get; set; }
}
