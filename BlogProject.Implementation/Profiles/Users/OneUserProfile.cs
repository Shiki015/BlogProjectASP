using AutoMapper;
using BlogProject.Application.DataTransfer.Users;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Profiles.Users
{
    public class OneUserProfile : Profile
    {
        public OneUserProfile()
        {
            CreateMap<User, OneUserDto>()
                .ForMember(
                dto => dto.UserUseCase,
                opt => opt.MapFrom(x =>
                x.UserUseCases.Select(y => y.UseCaseId).ToList()
                ));

            CreateMap<OneUserDto, User>();
        }
    }
}
