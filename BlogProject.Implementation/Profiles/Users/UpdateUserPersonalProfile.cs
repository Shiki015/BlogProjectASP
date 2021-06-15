using AutoMapper;
using BlogProject.Application.Requests.Users;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Users
{
    public class UpdateUserPersonalProfile : Profile
    {
        public UpdateUserPersonalProfile()
        {
            CreateMap<User, UpdateUserPersonalRequest>();


            CreateMap<UpdateUserPersonalRequest, User>()
                .ForMember(x => x.ProfilePhoto, opt => opt.Ignore())
                .ForMember(x => x.Password, opt => opt.Ignore());
        }
    }
}
