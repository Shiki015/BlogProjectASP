using AutoMapper;
using BlogProject.Application.Requests.Comments;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Comments
{
    public class UpdateCommentPersonalProfile : Profile
    {
        public UpdateCommentPersonalProfile()
        {
            CreateMap<Comment, UpdateCommentPersonalRequest>();
            CreateMap<UpdateCommentPersonalRequest, Comment>();
        }
    }
}
