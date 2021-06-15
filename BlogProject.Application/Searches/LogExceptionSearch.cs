using BlogProject.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Searches
{
    public class LogExceptionSearch : PagedSearch
    {
        public string Response { get; set; }
        public int StatusCode { get; set; }
        public string Exception { get; set; }
    }
}
