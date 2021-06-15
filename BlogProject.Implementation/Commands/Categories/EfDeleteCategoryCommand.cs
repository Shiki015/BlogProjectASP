using BlogProject.Application.Commands.Categories;
using BlogProject.Application.Exceptions;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Categories
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly BlogProjectContext _context;
        private readonly DeleteCategoryValidator _validator;

        public EfDeleteCategoryCommand(BlogProjectContext context, DeleteCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 24;

        public string Name => "EfDeleteCategoryCommand";

        public void Execute(int request)
        {

            _validator.ValidateAndThrow(request);

            var findCategory = _context.Categories.Find(request);
            if (findCategory == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            findCategory.IsDeleted = true;
            findCategory.DeletedAt = DateTime.UtcNow;

            _context.SaveChanges();

        }
    }
}
