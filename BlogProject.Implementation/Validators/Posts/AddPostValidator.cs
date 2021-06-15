using BlogProject.Application.Requests.Posts;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Posts
{
    public class AddPostValidator : AbstractValidator<AddPostRequest>
    {
        public AddPostValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.Title).NotEmpty();

            RuleFor(x => x.Description).NotEmpty();

            RuleFor(x => x.CategoryId).NotEmpty().Must(cat => _context.Categories.Any(x => x.Id == cat)).WithMessage("Not valid Category.");
        }
    }
}
