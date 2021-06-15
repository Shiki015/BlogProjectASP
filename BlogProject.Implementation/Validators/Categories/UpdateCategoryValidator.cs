using BlogProject.Application.Requests.Categories;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Categories
{
    public class UpdateCategoryValidator : AbstractValidator<UpdateCategoryRequest>
    {
        public UpdateCategoryValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.Name).NotEmpty().MinimumLength(2).Must((request, n) => !_context.Categories.Any(x => x.Name == request.Name && x.Id != request.Id))
                .WithMessage("Category must be unique.");
        }
    }
}
