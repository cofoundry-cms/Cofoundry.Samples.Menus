namespace Cofoundry.Samples.Menus;

public class MultiLevelMenuViewModel
{
    public string MenuId { get; set; }

    public ICollection<MultiLevelMenuNodeViewModel> Nodes { get; set; }
}
