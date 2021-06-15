using BlogProject.Application;
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
    public class EfDeleteCommentPersonalCommand : IDeleteCommentPersonalCommand
    {
        private readonly BlogProjectContext _context;
        private readonly DeleteCommentValidator _validator;
        private readonly IApplicationActor _actor;

        public EfDeleteCommentPersonalCommand(BlogProjectContext context, DeleteCommentValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => 45;

        public string Name => "EfDeleteCommentPersonalCommand";

        public void Execute(int request)
        {


            _validator.ValidateAndThrow(request);

            var comment = _context.Comments.Find(request);
            if (comment == null)
            {
                throw new EntityNotFoundException(request, typeof(Comment));
            }

            if (_actor.Id != comment.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }


            comment.IsDeleted = true;
            comment.DeletedAt = DateTime.UtcNow;


            _context.SaveChanges();
        }
    }
}
