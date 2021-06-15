using AutoMapper;
using BlogProject.Application.Commands.Categories;
using BlogProject.Application.Requests.Categories;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Categories
{
    public class EfAddCategoryCommand : IAddCategoryCommand
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        private readonly AddCategoryValidator _validator;
        public EfAddCategoryCommand(BlogProjectContext context, IMapper mapper, AddCategoryValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => 22;
        public string Name => "EfAddCategoryCommand";

        public void Execute(AddCategoryRequest reqeust)
        {
            _validator.ValidateAndThrow(reqeust);

            var category = _mapper.Map<Category>(reqeust);
            _context.Categories.Add(category);

            _context.SaveChanges();
        }
    }
}
