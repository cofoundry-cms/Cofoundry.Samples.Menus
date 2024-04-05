namespace Cofoundry.Samples.Menus;

public class SimpleMenuViewModel
{
    public required string MenuId { get; set; }

    public required IReadOnlyCollection<PageRoute> Pages { get; set; }
}
