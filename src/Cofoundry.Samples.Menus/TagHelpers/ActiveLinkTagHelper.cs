using Cofoundry.Core;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cofoundry.Samples.Menus
{
    /// <summary>
    /// This tag helper detects if an anchor link is part of the current 
    /// request path and adds an 'active' class if it is. 
    /// </summary>
    [HtmlTargetElement("a", Attributes=ATTRIBUTE)]
    public class ActiveLinkTagHelper : TagHelper
    {
        private const string ATTR_CLASS = "class";
        private const string ATTR_HREF = "href";
        private const string CLASS_ACTIVE = "active";
        private const string ATTRIBUTE = "th-active-link";

        [ViewContext]
        public ViewContext ViewContext { get; set; }

        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            var request = ViewContext?.HttpContext?.Request;
            if (request == null) return;

            var href = ParseHref(output);
            if (href == null) return;

            var isActive = request.Path.StartsWithSegments(href);
            if (!isActive) return;

            var existingClassValue = output
                .Attributes
                .Where(a => a.Name == ATTR_CLASS)
                .Select(a => Convert.ToString(a.Value))
                .FirstOrDefault();

            if (existingClassValue == null)
            {
                output.Attributes.SetAttribute(ATTR_CLASS, CLASS_ACTIVE);
            }
            else if (!existingClassValue.Contains(CLASS_ACTIVE))
            {
                output.Attributes.SetAttribute(ATTR_CLASS, existingClassValue + " " + CLASS_ACTIVE);
            }

            output.Attributes.RemoveAll(ATTRIBUTE);

            base.Process(context, output);
        }

        private string ParseHref(TagHelperOutput output)
        {
            var href = output
                .Attributes
                .Where(a => a.Name == ATTR_HREF)
                .Select(a => Convert.ToString(a.Value))
                .FirstOrDefault();

            if (string.IsNullOrWhiteSpace(href) || !Uri.IsWellFormedUriString(href, UriKind.Relative)) return null;

            var queryStringIndex = href.IndexOfAny(new char[] { '?', '#' });

            if (queryStringIndex > -1)
            {
                href = href.Remove(queryStringIndex);
            }

            return href;
        }
    }
}
