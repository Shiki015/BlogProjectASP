using BlogProject.Application.DataTransfer.Posts;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries.Posts
{
    public interface IGetOnePostQuery : IQuery<int, OnePostDto>
    {
    }
}
