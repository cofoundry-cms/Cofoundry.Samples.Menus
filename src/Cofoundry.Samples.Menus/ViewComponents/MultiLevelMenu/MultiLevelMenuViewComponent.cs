using Microsoft.AspNetCore.Mvc;

namespace Cofoundry.Samples.Menus;

/// <summary>
/// Here we use a view component to load the menu data
/// from Cofoundry repositories, map it into a view model
/// and then return a view for rendering.
/// </summary>
public class MultiLevelMenuViewComponent : ViewComponent
{
    private readonly IContentRepository _contentRepository;

    public MultiLevelMenuViewComponent(
        IContentRepository contentRepository
        )
    {
        _contentRepository = contentRepository;
    }

    public async Task<IViewComponentResult> InvokeAsync(string menuId)
    {
        var viewModel = new MultiLevelMenuViewModel();
        viewModel.MenuId = menuId;

        // Get the menu entity
        var menuEntity = await GetMenuByIdAsync(menuId);

        // If not exists, return empty model
        if (menuEntity == null) return View(viewModel);
        var dataModel = (MultiLevelMenuDataModel)menuEntity.Model;

        // Gather all pages required for mapping
        var allPageIds = ExtractPageIds(dataModel.Items).Distinct();
        var allPages = await _contentRepository
            .Pages()
            .GetByIdRange(allPageIds)
            .AsRoutes()
            .ExecuteAsync();

        // Map the menu items recusively
        viewModel.Nodes = EnumerableHelper.Enumerate(dataModel.Items)
            .Select(i => MapMenuNodeViewModel(i, allPages))
            .Where(i => i.PageRoute != null)
            .ToArray();

        return View(viewModel);
    }

    private MultiLevelMenuNodeViewModel MapMenuNodeViewModel(MultiLevelMenuNodeDataModel dataModel, IDictionary<int, PageRoute> allPages)
    {
        var viewModelItem = new MultiLevelMenuNodeViewModel()
        {
            Title = dataModel.Title,
            PageRoute = allPages.GetOrDefault(dataModel.PageId)
        };

        // recusively map the view models
        viewModelItem.ChildNodes = EnumerableHelper
            .Enumerate(dataModel.Items)
            .Select(i => MapMenuNodeViewModel(i, allPages))
            .Where(i => i.PageRoute != null)
            .ToArray();

        return viewModelItem;
    }

    private static IEnumerable<int> ExtractPageIds(ICollection<MultiLevelMenuNodeDataModel> nestedNodes)
    {
        foreach (var node in EnumerableHelper.Enumerate(nestedNodes))
        {
            yield return node.PageId;

            // recursively extract the ids from child items
            foreach (var pageId in ExtractPageIds(node.Items))
            {
                yield return pageId;
            }
        }
    }

    private async Task<CustomEntityRenderSummary> GetMenuByIdAsync(string menuId)
    {
        var customEntityQuery = new GetCustomEntityRenderSummariesByUrlSlugQuery(MultiLevelMenuDefinition.DefinitionCode, menuId);
        var menus = await _contentRepository.ExecuteQueryAsync(customEntityQuery);

        // Forcing UrlSlug uniqueness is a setting on the custom entity definition and therefpre
        // the query has to account for multiple return items. Here we only expect one item.
        return menus.FirstOrDefault();
    }
}
