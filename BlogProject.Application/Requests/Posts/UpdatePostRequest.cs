using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Posts
{
    public class UpdatePostRequest
    {
        public int Id { get; set; }
        public string  Title { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
    }
}
