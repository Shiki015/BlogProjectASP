using AutoMapper;
using BlogProject.Application.DataTransfer;
using BlogProject.Application.Requests;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Profiles
{
    public class ContactProfile : Profile
    {
        public ContactProfile()
        {
            CreateMap<SendEmailDto, ContactRequest>();
            CreateMap<ContactRequest, SendEmailDto>();
        }
    }
}
