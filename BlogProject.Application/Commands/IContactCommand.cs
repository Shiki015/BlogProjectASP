using BlogProject.Application.Requests;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Commands
{
    public interface IContactCommand : ICommand<ContactRequest>
    {
    }
}
