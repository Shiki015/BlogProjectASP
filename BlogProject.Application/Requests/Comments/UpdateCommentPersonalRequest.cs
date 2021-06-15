using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Comments
{
    public class UpdateCommentPersonalRequest
    {
        public int Id { get; set; }
        public string Commenttext { get; set; }
    }
}
