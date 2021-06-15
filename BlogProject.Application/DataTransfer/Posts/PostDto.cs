using BlogProject.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.DataTransfer.Posts
{
    public class PostDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
        public CategoriesDto Category { get; set; }
        public UserFrontDto User { get; set; }
    }
}
