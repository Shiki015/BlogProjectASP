using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Comments
{
    public class AddCommentRequest
    {
        public string CommentText { get; set; }
        public int PostId { get; set; }
        public int? ParentId { get; set; }
        public int UserId { get; set; }
    }
}
