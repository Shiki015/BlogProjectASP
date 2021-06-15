using System;
using AutoMapper;
using BlogProject.Application.DataTransfer;
using BlogProject.Domain;

namespace BlogProject.Implementation.Profiles.Categories
{
    public class CategoriesProfile : Profile
    {
        public CategoriesProfile()
        {
            CreateMap<Category, CategoriesDto>();
            CreateMap<CategoriesDto, Category>();
        }
    }
}
