using BlogProject.Application.Requests.Users;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Users
{
    public class LoginUserValidator : AbstractValidator<LoginRequest>
    {
        public LoginUserValidator(BlogProjectContext _context)
        {
            RuleFor(x=>x.Username).NotEmpty().MinimumLength(2).Matches("[A-z0-9]*").WithMessage("Username must contain numbers and letters")
                .Must(x => _context.Users.Any(user => user.Username == x)).WithMessage("Username doesnt exists");

            RuleFor(x => x.Password).NotEmpty().MinimumLength(6).Matches("[A-z0-9]*").WithMessage("Password must contain numbers and letters");


        }
    }
}
