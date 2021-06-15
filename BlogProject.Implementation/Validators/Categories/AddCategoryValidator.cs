using BlogProject.Application.Requests.Categories;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Categories
{
    public class AddCategoryValidator : AbstractValidator<AddCategoryRequest>
    {

        public AddCategoryValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.Name).NotEmpty().MinimumLength(2).Must(x => !_context.Categories.Any(c => c.Name == x)).WithMessage("Category NAME must be unique.");

        }
    }
}
