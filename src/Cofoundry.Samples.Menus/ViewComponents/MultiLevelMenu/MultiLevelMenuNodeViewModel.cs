namespace Cofoundry.Samples.Menus;

public class MultiLevelMenuNodeViewModel
{
    public string Title { get; set; }

    public PageRoute PageRoute { get; set; }

    public ICollection<MultiLevelMenuNodeViewModel> ChildNodes { get; set; }
}
