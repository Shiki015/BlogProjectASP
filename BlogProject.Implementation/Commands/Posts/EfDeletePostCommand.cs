using BlogProject.Application.Commands.Posts;
using BlogProject.Application.Exceptions;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Posts
{
    public class EfDeletePostCommand : IDeletePostCommand
    {
        private readonly BlogProjectContext _context;
        private readonly DeletePostValidator _validator;


        public EfDeletePostCommand(BlogProjectContext context, DeletePostValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 34;

        public string Name => "EfDeletePostCommand";

        public void Execute(int request)
        {
            _validator.ValidateAndThrow(request);

            var post = _context.Posts.Find(request);

            if (post == null)
            {
                throw new EntityNotFoundException(request, typeof(Post));
            }


            post.IsDeleted = true;
            post.DeletedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }

}
