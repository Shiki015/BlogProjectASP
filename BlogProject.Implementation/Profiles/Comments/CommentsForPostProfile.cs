using AutoMapper;
using BlogProject.Application.DataTransfer.Comments;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Comments
{
    public class CommentsForPostProfile : Profile
    {
        public CommentsForPostProfile()
        {
            CreateMap<Comment, GetCommentsForOnePostDto>();
            CreateMap<GetCommentsForOnePostDto, Comment>();
        }
    }
}
