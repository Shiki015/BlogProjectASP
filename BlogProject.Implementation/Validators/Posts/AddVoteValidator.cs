using BlogProject.Application.Requests.Posts;
using BlogProject.DataAccess;
using BlogProject.Domain;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Validators.Posts
{
    public class AddVoteValidator : AbstractValidator<AddVoteRequest>
    {
        public AddVoteValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.UserId).NotEmpty();

            RuleFor(x => x.PostId).NotEmpty();

            RuleFor(x => x.Status).Must(v => Enum.IsDefined(typeof(VoteStatus), v)).WithMessage("Status is not valid.");
           

        }
    }
}
