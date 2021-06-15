using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Posts
{
    public class AddVoteRequest
    {
        public int PostId { get; set; }
        public int UserId { get; set; }
        public VoteStatus Status { get; set; }
    }
}
