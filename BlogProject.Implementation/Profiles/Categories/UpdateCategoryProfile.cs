using System;
using AutoMapper;
using BlogProject.Application.Requests.Categories;
using BlogProject.Domain;

namespace BlogProject.Implementation.Profiles.Categories
{
    public class UpdateCategoryProfile : Profile
    {
        public UpdateCategoryProfile()
        {
            CreateMap<Category, UpdateCategoryRequest>();
            CreateMap<UpdateCategoryRequest, Category>();
        }
    }
}
