using AutoMapper;
using BlogProject.Application.DataTransfer;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles
{
    public class LogExceptionProfile : Profile
    {
        public LogExceptionProfile()
        {
            CreateMap<LogExceptionDto, ExceptionLog>();
            CreateMap<ExceptionLog, LogExceptionDto>();

        }
    }
}
