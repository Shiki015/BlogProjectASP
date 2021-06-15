using BlogProject.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Searches
{
    public class LogSearch : PagedSearch
    {
        public string Actor { get; set; }
        public string UseCaseName { get; set; }
    }
}
