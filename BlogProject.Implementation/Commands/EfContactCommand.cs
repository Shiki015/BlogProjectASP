using AutoMapper;
using BlogProject.Application.Commands;
using BlogProject.Application.DataTransfer;
using BlogProject.Application.Email;
using BlogProject.Application.Requests;
using BlogProject.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands
{
    public class EfContactCommand : IContactCommand
    {
        private readonly IEmailSender _sender;
        private readonly IMapper _mapper;
        private readonly ContactValidator _validator;

        public EfContactCommand(IEmailSender sender, IMapper mapper, ContactValidator validator)
        {
            _sender = sender;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => 400;

        public string Name => "ContactCommand";

        public void Execute(ContactRequest request)
        {

            _validator.ValidateAndThrow(request);


            var info = _mapper.Map<SendEmailDto>(request);
            info.Subject = $"Title: {request.Subject} Send From: {request.SendFrom}";
            info.SendTo = "smijailovic015@gmail.com";
            _sender.Send(info);
        }
    }
}
