using Cofoundry.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cofoundry.Samples.Menus
{
    public class MenuController : Controller
    {
        public ActionResult FooterLinks(object model)
        {
            var pageViewModel = model as IPageRoutableViewModel;
            var footerViewModel = new FooterMenuViewModel();

            if (pageViewModel != null)
            {
                var routes = pageViewModel.PageRoutingHelper.PageRoutes;

                if (pageViewModel.PageRoutingHelper.VisualEditorMode == VisualEditorMode.Live)
                {
                    routes = routes.Where(r => r.IsPublished);
                }
                footerViewModel.PageRoutes = routes;
            }

            return View(footerViewModel);
        }
    }
}