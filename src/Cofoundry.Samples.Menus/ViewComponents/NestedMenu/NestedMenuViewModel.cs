namespace Cofoundry.Samples.Menus;

public class NestedMenuViewModel
{
    public string MenuId { get; set; }

    public ICollection<NestedMenuItemViewModel> Items { get; set; }
}
