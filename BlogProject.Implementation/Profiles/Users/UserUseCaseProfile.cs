using AutoMapper;
using BlogProject.Application.DataTransfer.Users;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles.Users
{
    public class UserUseCaseProfile : Profile
    {
        public UserUseCaseProfile()
        {
            CreateMap<UserUseCase, UserUseCaseDto>();

            CreateMap<UserUseCaseDto, UserUseCase>();
        }
    }
}
