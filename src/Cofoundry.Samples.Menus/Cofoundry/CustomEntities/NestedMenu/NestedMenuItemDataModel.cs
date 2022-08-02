using System.ComponentModel.DataAnnotations;

namespace Cofoundry.Samples.Menus;

public class NestedMenuItemDataModel : INestedDataModel
{
    [MaxLength(30)]
    [Required]
    public string Title { get; set; }

    [Required]
    [Page]
    public int PageId { get; set; }

    [Display(Name = "Level 2 Items")]
    [NestedDataModelCollection]
    public ICollection<NestedMenuChildItemDataModel> ChildItems { get; set; }
}
