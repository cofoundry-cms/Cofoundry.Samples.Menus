using Cofoundry.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    public class MultiLevelMenuViewModel
    {
        public string MenuId { get; set; }

        public ICollection<MultiLevelMenuNodeViewModel> Nodes { get; set; }
    }
}
