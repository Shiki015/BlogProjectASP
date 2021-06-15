using BlogProject.Application.Requests.Comments;
using BlogProject.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Validators.Coments
{
    public class AddCommentValidator : AbstractValidator<AddCommentRequest>
    {
        public AddCommentValidator(BlogProjectContext _context)
        {
            RuleFor(x => x.CommentText).NotEmpty();

            RuleFor(x => x.PostId).NotEmpty().Must(post => _context.Posts.Any(x => x.Id == post)).WithMessage("Post must exist to add Comment on it.");

            RuleFor(x => x.ParentId).Must(comment => _context.Comments.Any(x => x.Id == comment)).When(req => req.ParentId != null).WithMessage("Parent Comment does not exist.");
        }
    }
}
