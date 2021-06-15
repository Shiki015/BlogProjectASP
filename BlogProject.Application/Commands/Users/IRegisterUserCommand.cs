using BlogProject.Application.Requests.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Commands.Users
{
    public interface IRegisterUserCommand : ICommand<RegisterUserRequest>
    {
    }
}
