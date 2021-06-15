using AutoMapper;
using BlogProject.Application.Commands.Users;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Requests.Users;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Users;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Commands.Users
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly BlogProjectContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateUserCommand(BlogProjectContext context, UpdateUserValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 13;

        public string Name => "EfUpdateUserCommand";

        public void Execute(UpdateUserRequest request)
        {

            _validator.ValidateAndThrow(request);

            var findUser = _context.Users.Find(request.Id);
            if (findUser == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }


            var user = _context.Users.Include(x => x.UserUseCases).Where(x => x.Id == request.Id).First();

            var newFileName = "";
            if (request.ProfilePhoto != null)
            {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(request.ProfilePhoto.FileName);

                newFileName = guid + extension;

                var path = Path.Combine("wwwroot", "images", newFileName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    request.ProfilePhoto.CopyTo(fileStream);
                }
            }
            else
            {
                newFileName = user.ProfilePhoto;
            }

            foreach (var id in user.UserUseCases)
            {
                _context.Remove(id);
            }

            foreach (var idUc in request.UserUseCases)
            {
                _context.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = idUc,
                    UserId = request.Id
                });
            }
            _mapper.Map(request, user);

            user.ProfilePhoto = newFileName;

            _context.SaveChanges();

        }
    }
}
