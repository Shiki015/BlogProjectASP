using BlogProject.Application.Requests.Users;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Users
{
    public class UpdateUserValidator : AbstractValidator<UpdateUserRequest>
    {
        public UpdateUserValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.Id).NotEmpty();

            RuleFor(x => x.Username).NotEmpty().MinimumLength(2).Matches("[A-z0-9]*").WithMessage("Username need to contain numbers and letters")
                .Must((req, username) => !_context.Users.Any(x => x.Username == req.Username && x.Id != req.Id)).WithMessage("Username is taken.");

            RuleFor(x => x.Email).NotEmpty().EmailAddress().Must((request, email) => !_context.Users.Any(x => x.Email == request.Email && x.Id != request.Id))
               .WithMessage("Email is already taken");


            RuleFor(x => x.UserUseCases).NotEmpty();
        }
    }
}
