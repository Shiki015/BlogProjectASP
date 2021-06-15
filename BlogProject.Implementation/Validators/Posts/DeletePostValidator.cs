using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Validators.Posts
{
    public class DeletePostValidator : AbstractValidator<int>
    {
        public DeletePostValidator()
        {
            RuleFor(x => x).NotEmpty();
        }
    }
}
