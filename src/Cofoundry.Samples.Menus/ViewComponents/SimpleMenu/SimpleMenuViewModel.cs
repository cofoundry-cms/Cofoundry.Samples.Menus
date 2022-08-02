namespace Cofoundry.Samples.Menus;

public class SimpleMenuViewModel
{
    public string MenuId { get; set; }

    public ICollection<PageRoute> Pages { get; set; }
}
