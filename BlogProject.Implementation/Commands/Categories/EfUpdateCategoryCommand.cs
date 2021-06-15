using AutoMapper;
using BlogProject.Application.Commands.Categories;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Requests.Categories;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Commands.Categories
{
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {

        private readonly BlogProjectContext _context;
        private readonly UpdateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateCategoryCommand(BlogProjectContext context, UpdateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 23;

        public string Name => "EfUpdateCategoryCommand";

        public void Execute(UpdateCategoryRequest request)
        {
            _validator.ValidateAndThrow(request);
            var findCategory = _context.Categories.Find(request.Id);
            if (findCategory == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            var category = _context.Categories.Where(x => x.Id == request.Id).FirstOrDefault();
            _mapper.Map(request, category);
            _context.SaveChanges();

        }
    }

}
