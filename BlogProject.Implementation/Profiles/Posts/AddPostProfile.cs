using AutoMapper;
using BlogProject.Application.Requests.Posts;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Posts
{
    public class AddPostProfile : Profile
    {
        public AddPostProfile()
        {
            CreateMap<Post, AddPostRequest>();
            CreateMap<AddPostRequest, Post>();
        }
    }
}
