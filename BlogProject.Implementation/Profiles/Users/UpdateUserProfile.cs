using AutoMapper;
using BlogProject.Application.Requests.Users;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Users
{
    public class UpdateUserProfile : Profile
    {
        public UpdateUserProfile()
        {
            CreateMap<User, UpdateUserRequest>();


            CreateMap<UpdateUserRequest, User>()
                .ForMember(x => x.ProfilePhoto, opt => opt.Ignore())
                .ForMember(x => x.Password, opt => opt.Ignore())
                .ForMember(x => x.UserUseCases, opt => opt.Ignore());
        }
    }
}
