using AutoMapper;
using BlogProject.Application.DataTransfer;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles
{
    public class LogProfile : Profile
    {
        public LogProfile()
        {
            CreateMap<UseCaseLog, LogDto>();
            CreateMap<LogDto, UseCaseLog>();

        }
    }
}
