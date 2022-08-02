namespace Cofoundry.Samples.Menus;

public class NestedMenuItemViewModel
{
    public string Title { get; set; }

    public PageRoute PageRoute { get; set; }

    public ICollection<NestedMenuChildItemViewModel> ChildItems { get; set; }
}
