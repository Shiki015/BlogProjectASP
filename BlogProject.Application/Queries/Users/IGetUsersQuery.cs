using BlogProject.Application.DataTransfer.Users;
using BlogProject.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries.Users
{
    public interface IGetUsersQuery : IQuery<UserSearch, PagedResponse<UserDto>>
    {
    }
}
