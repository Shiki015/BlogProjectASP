using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries
{
    public abstract class PagedSearch
    {
        public int PerPage { get; set; } = 10;
        public int Page { get; set; } = 1;
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; } = DateTime.UtcNow;
    }
}
