using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Cofoundry.Web;
using Cofoundry.Plugins.DependencyInjection.AutoFac.Web;

[assembly: OwinStartup(typeof(Cofoundry.Samples.Menus.App_Start.Startup))]

namespace Cofoundry.Samples.Menus.App_Start
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCofoundryAutoFacIntegration();
            app.UseCofoundry();
        }
    }
}
