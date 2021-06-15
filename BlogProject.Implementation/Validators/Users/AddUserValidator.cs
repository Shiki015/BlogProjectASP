using BlogProject.Application.Requests.Users;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Users
{
    public class AddUserValidator : AbstractValidator<AddUserRequest>
    {
        public AddUserValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.Username).NotEmpty().MinimumLength(2).Matches("[A-z0-9]*").WithMessage("Username must contains numbers and letters")
                .Must(x=> !_context.Users.Any(user => user.Username ==x)).WithMessage("Username is taken");

            RuleFor(x => x.Password).NotEmpty().MinimumLength(2).Matches("[A-z0-9]*").WithMessage("Password must contains numbers and letters");

            RuleFor(x => x.Email).NotEmpty().EmailAddress().Must(email => !_context.Users.Any(x => x.Email == email)).WithMessage("Email is taken.");

            RuleFor(x => x.ProfilePhoto).NotEmpty();

            RuleFor(x => x.UserUseCases).NotEmpty();
        }
    }
}
