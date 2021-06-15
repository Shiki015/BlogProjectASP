using BlogProject.Application.Commands.Comments;
using BlogProject.Application.Exceptions;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Coments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Comments
{
    public class EfDeleteCommentCommand : IDeleteCommentCommand
    {
        private readonly BlogProjectContext _context;
        private readonly DeleteCommentValidator _validator;

        public EfDeleteCommentCommand(BlogProjectContext context, DeleteCommentValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 44;

        public string Name => "EfDeleteCommentCommand";

        public void Execute(int request)
        {
            _validator.ValidateAndThrow(request);

            var comment = _context.Comments.Find(request);
            if (comment == null)
            {
                throw new EntityNotFoundException(request, typeof(Comment));
            }

            comment.IsDeleted = true;
            comment.DeletedAt = DateTime.UtcNow;


            _context.SaveChanges();
        }
    }
}
