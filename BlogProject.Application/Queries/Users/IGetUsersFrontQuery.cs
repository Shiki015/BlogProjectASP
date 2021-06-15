using BlogProject.Application.DataTransfer.Users;
using BlogProject.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries.Users
{
    public interface IGetUsersFrontQuery : IQuery<UserSearch, PagedResponse<UserFrontDto>>
    {
    }
}
