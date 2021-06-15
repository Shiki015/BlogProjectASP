using BlogProject.Application.Requests.Posts;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Commands.Posts
{
    public interface IAddVoteCommand : ICommand<AddVoteRequest>
    {
    }
}
