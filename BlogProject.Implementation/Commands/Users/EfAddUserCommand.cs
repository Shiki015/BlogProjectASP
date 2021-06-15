using AutoMapper;
using BlogProject.Application.Commands.Users;
using BlogProject.Application.Requests.Users;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Users;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace BlogProject.Implementation.Commands.Users
{
    public class EfAddUserCommand : IAddUserCommand
    {
        private readonly BlogProjectContext _context;
        private readonly AddUserValidator _validator;
        private readonly IMapper _mapper;



        public EfAddUserCommand(BlogProjectContext context, AddUserValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 12;

        public string Name => "EfAddUserCommand";

        public void Execute(AddUserRequest request)
        {
            _validator.ValidateAndThrow(request);

            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(request.ProfilePhoto.FileName);

            var newFileName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                request.ProfilePhoto.CopyTo(fileStream);
            }

            var user = _mapper.Map<User>(request);

            user.Password = EasyEncryption.SHA.ComputeSHA256Hash(request.Password);
            user.ProfilePhoto = newFileName;

            _context.Add(user);
            _context.SaveChanges();

            int id = user.Id;

            foreach (var c in request.UserUseCases)
            {
                _context.UserUseCases.Add(new UserUseCase
                {
                    UserId = id,
                    UseCaseId = c
                });
            }

            _context.SaveChanges();

        }
    }
}
