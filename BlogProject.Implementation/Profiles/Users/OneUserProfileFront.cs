using AutoMapper;
using BlogProject.Application.DataTransfer.Users;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Users
{
    public class OneUserProfileFront : Profile
    {
        public OneUserProfileFront()
        {
            CreateMap<User, OneUserDtoFront>();
            CreateMap<OneUserDtoFront, User>();
        }
    }
}
