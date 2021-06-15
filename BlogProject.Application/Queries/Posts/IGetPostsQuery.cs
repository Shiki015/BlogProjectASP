using BlogProject.Application.DataTransfer.Posts;
using BlogProject.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries.Posts
{
    public interface IGetPostsQuery : IQuery<PostSearch, PagedResponse<PostDto>>
    {
    }
}
