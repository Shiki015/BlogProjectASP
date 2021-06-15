using BlogProject.Application.DataTransfer.Users;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.DataTransfer.Posts
{
    public class GetVotesForOnePostDto
    {
        public int Id { get; set; }
        public VoteStatus Status { get; set; }
        public UserFrontDto User { get; set; }
    }
}
