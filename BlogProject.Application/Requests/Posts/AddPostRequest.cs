using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Posts
{
    public class AddPostRequest
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public int UserId { get; set; }
        public int CategoryId { get; set; }
    }
}
