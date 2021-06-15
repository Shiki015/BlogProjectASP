using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Validators.Coments
{
    public class DeleteCommentValidator : AbstractValidator<int>
    {
        public DeleteCommentValidator()
        {
            RuleFor(x => x).NotEmpty();
        }
    }
}
