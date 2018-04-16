using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    public class SimpleMenuViewModel
    {
        public string MenuId { get; set; }

        public ICollection<PageRoute> Pages { get; set; }
    }
}
