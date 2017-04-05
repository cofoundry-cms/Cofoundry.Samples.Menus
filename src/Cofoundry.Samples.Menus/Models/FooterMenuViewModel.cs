using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cofoundry.Samples.Menus
{
    public class FooterMenuViewModel
    {
        public IEnumerable<PageRoute> PageRoutes { get; set; }
    }
}