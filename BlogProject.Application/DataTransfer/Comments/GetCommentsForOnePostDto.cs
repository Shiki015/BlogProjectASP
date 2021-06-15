using BlogProject.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.DataTransfer.Comments
{
    public class GetCommentsForOnePostDto
    {
        public int Id { get; set; }
        public string  CommentText { get; set; }
        public int ParentId { get; set; }
        public UserFrontDto User { get; set; }
        public DateTime CreatedAt { get; set; }
        public ICollection<GetCommentsForOnePostDto> Childs { get; set; } = new List<GetCommentsForOnePostDto>();
    }
}
