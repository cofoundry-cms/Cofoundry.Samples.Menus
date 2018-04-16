using Cofoundry.Core;
using Cofoundry.Domain;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    /// <summary>
    /// Here we use a view component to load the menu data
    /// from Cofoundry repositories, map it into a view model
    /// and then return a view for rendering.
    /// </summary>
    public class NestedMenuViewComponent : ViewComponent
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IPageRepository _pageRepository;

        public NestedMenuViewComponent(
            ICustomEntityRepository customEntityRepository,
            IPageRepository pageRepository
            )
        {
            _customEntityRepository = customEntityRepository;
            _pageRepository = pageRepository;
        }

        public async Task<IViewComponentResult> InvokeAsync(string menuId)
        {
            var viewModel = new NestedMenuViewModel();
            viewModel.MenuId = menuId;

            // Get the menu entity
            var menuEntity = await GetMenuByIdAsync(menuId);

            // If not exists, return empty model
            if (menuEntity == null) return View(viewModel);
            var dataModel = (NestedMenuDataModel)menuEntity.Model;

            // Gather all pages required for mapping
            var allPageIds = ExtractPageIds(dataModel);
            var allPages = await _pageRepository.GetPageRoutesByIdRangeAsync(allPageIds);

            // Map the menu items
            viewModel.Items = EnumerableHelper.Enumerate(dataModel.Items)
                .Select(i => MapNestedItemViewModel(i, allPages))
                .Where(i => i.PageRoute != null)
                .ToArray();

            // If you wanted different menu styles you could pass the 
            // menuId here as the view name e.g. "main" or "footer" menu
            return View(viewModel);
        }
        
        private NestedMenuItemViewModel MapNestedItemViewModel(NestedMenuItemDataModel dataModel, IDictionary<int, PageRoute> allPages)
        {
            var viewModelItem = new NestedMenuItemViewModel()
            {
                Title = dataModel.Title,
                PageRoute = allPages.GetOrDefault(dataModel.PageId)
            };

            viewModelItem.ChildItems = EnumerableHelper
                .Enumerate(dataModel.ChildItems)
                .Select(i => MapNestedChildItemViewModel(i, allPages))
                .Where(i => i.PageRoute != null)
                .ToArray();

            return viewModelItem;
        }

        private NestedMenuChildItemViewModel MapNestedChildItemViewModel(NestedMenuChildItemDataModel dataModel, IDictionary<int, PageRoute> allPages)
        {
            var viewModelItem = new NestedMenuChildItemViewModel()
            {
                Title = dataModel.Title,
                PageRoute = allPages.GetOrDefault(dataModel.PageId)
            };

            return viewModelItem;
        }

        private static IEnumerable<int> ExtractPageIds(NestedMenuDataModel dataModel)
        {
            var level1Itds = dataModel
                .Items
                .Select(i => i.PageId);

            var level2Ids = dataModel
                .Items
                .Where(i => i.ChildItems != null)
                .SelectMany(i => i.ChildItems)
                .Select(ci => ci.PageId);

            return level1Itds.Union(level2Ids);
        }

        /// <summary>
        /// Note that this query isn't optimal and does client side filtering. This
        /// will be fixed in an upcoming release. See issue #81.
        /// </summary>
        private async Task<CustomEntityRenderSummary> GetMenuByIdAsync(string menuId)
        {
            // To be relaced by a get custom entity by url slug query
            var customEntityQuery = new GetCustomEntityRenderSummariesByDefinitionCodeQuery(NestedMenuDefinition.DefinitionCode);
            var menus = await _customEntityRepository.GetCustomEntityRenderSummariesByDefinitionCodeAsync(customEntityQuery);

            return menus.FirstOrDefault(s => s.UrlSlug == menuId);
        }
    }
}
