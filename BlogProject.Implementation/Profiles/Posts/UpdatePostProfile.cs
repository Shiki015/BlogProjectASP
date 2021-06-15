using AutoMapper;
using BlogProject.Application.Requests.Posts;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Posts
{
    public class UpdatePostProfile : Profile
    {
        public UpdatePostProfile()
        {
            CreateMap<UpdatePostRequest, Post>();

            CreateMap<Post, UpdatePostRequest>();
        }
    }
}
