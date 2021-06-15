using AutoMapper;
using BlogProject.Application.Requests.Comments;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Comments
{
    public class AddCommentProfile : Profile
    {
        public AddCommentProfile()
        {
            CreateMap<Comment, AddCommentRequest>();
            CreateMap<AddCommentRequest, Comment>();
        }
    }
}
