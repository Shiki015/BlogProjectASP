using BlogProject.Application.Requests.Comments;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Commands.Comments
{
    public interface IAddCommentCommand : ICommand<AddCommentRequest>
    {
    }
}
