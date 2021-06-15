using AutoMapper;
using BlogProject.Application.DataTransfer.Posts;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Posts
{
    public class VotesForPostProfile : Profile
    {
        public VotesForPostProfile()
        {
            CreateMap<GetVotesForOnePostDto, Vote>();
            CreateMap<Vote, GetVotesForOnePostDto>();
        }
    }
}
