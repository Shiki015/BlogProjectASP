using BlogProject.Application.Requests.Posts;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Posts
{
    public class UpdatePostValidator : AbstractValidator<UpdatePostRequest>
    {
        public UpdatePostValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.Title).NotEmpty();

            RuleFor(x => x.Description).NotEmpty();

            RuleFor(x => x.CategoryId).NotEmpty().Must(category => _context.Categories.Any(p => p.Id == category)).WithMessage("Category is not valid.");
        }
    }
}
