using BlogProject.Application.DataTransfer.Posts;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.DataTransfer.Users
{
    public class OneUserDtoFront
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string ProfilePhoto { get; set; }
        public ICollection<PostDto> Posts { get; set; } = new List<PostDto>();
    }
}
