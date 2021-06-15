using AutoMapper;
using BlogProject.Application.Requests.Categories;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Categories
{
    public class AddCategoryProfile : Profile
    {
        public AddCategoryProfile()
        {
            CreateMap<Category, AddCategoryRequest>();
            CreateMap<AddCategoryRequest, Category>();
        }
    }
}
