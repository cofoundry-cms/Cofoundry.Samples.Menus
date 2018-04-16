using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    public class NestedMenuItemViewModel
    {
        public string Title { get; set; }

        public PageRoute PageRoute { get; set; }

        public ICollection<NestedMenuChildItemViewModel> ChildItems { get; set; }
    }
}
