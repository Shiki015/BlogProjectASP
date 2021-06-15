using BlogProject.Application.Requests.Comments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Validators.Coments
{
    public class UpdateCommentValidator : AbstractValidator<UpdateCommentPersonalRequest>
    {
        public UpdateCommentValidator()
        {
            RuleFor(x => x.Commenttext).NotEmpty();
        }
    }
}
