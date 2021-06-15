using BlogProject.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries.Users
{
    public interface IGetOneUserQuery : IQuery<int, OneUserDto>
    {
    }
}
