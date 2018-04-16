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
    public class MultiLevelMenuViewComponent : ViewComponent
    {
        private readonly ICustomEntityRepository _customEntityRepository;
        private readonly IPageRepository _pageRepository;

        public MultiLevelMenuViewComponent(
            ICustomEntityRepository customEntityRepository,
            IPageRepository pageRepository
            )
        {
            _customEntityRepository = customEntityRepository;
            _pageRepository = pageRepository;
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
            var allPages = await _pageRepository.GetPageRoutesByIdRangeAsync(allPageIds);

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

        /// <summary>
        /// Note that this query isn't optimal and does client side filtering. This
        /// will be fixed in an upcoming release. See issue #81.
        /// </summary>
        private async Task<CustomEntityRenderSummary> GetMenuByIdAsync(string menuId)
        {
            // To be relaced by a get custom entity by url slug query
            var customEntityQuery = new GetCustomEntityRenderSummariesByDefinitionCodeQuery(MultiLevelMenuDefinition.DefinitionCode);
            var menus = await _customEntityRepository.GetCustomEntityRenderSummariesByDefinitionCodeAsync(customEntityQuery);

            return menus.FirstOrDefault(s => s.UrlSlug == menuId);
        }
    }
}
