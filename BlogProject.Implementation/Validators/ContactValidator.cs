using BlogProject.Application.Requests;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Validators
{
    public  class ContactValidator : AbstractValidator<ContactRequest>
    {
        public ContactValidator()
        {
            RuleFor(x => x.Content).NotEmpty();

            RuleFor(x => x.SendFrom).NotEmpty().EmailAddress();

            RuleFor(x => x.Subject).NotEmpty();
        }
    }
}
