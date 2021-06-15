using BlogProject.Application.Commands.Users;
using BlogProject.Application.Exceptions;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Users;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Users
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {

        private readonly BlogProjectContext _context;
        private readonly DeleteUserValidator _validator;

        public EfDeleteUserCommand(BlogProjectContext context, DeleteUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 14;

        public string Name => "EfDeleteUserCommand";

        public void Execute(int request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            user.IsDeleted = true;
            user.DeletedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }
}
