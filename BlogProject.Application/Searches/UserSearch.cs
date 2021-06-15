using BlogProject.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string Email { get; set; }
        public string Username { get; set; }
    }
}
