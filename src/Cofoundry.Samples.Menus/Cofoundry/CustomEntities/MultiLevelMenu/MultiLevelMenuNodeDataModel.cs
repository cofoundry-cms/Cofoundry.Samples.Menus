using System.ComponentModel.DataAnnotations;

namespace Cofoundry.Samples.Menus;

/// <summary>
/// This child node references itself recursively which 
/// allows you to have multiple levels of menu items.
/// </summary>
public class MultiLevelMenuNodeDataModel : INestedDataModel
{
    [Required]
    [MaxLength(30)]
    public string Title { get; set; }

    [Required]
    [Page]
    public int PageId { get; set; }

    [NestedDataModelCollection(IsOrderable = true)]
    public ICollection<MultiLevelMenuNodeDataModel> Items { get; set; }
}
