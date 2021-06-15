using AutoMapper;
using BlogProject.Application.DataTransfer.Posts;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Posts
{
    public class OnePostProfile : Profile
    {
        public OnePostProfile()
        {
            CreateMap<OnePostDto, Post>();
            CreateMap<Post, OnePostDto>();
        }
    }
}
