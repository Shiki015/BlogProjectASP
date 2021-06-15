using AutoMapper;
using BlogProject.Application.Commands.Users;
using BlogProject.Application.Email;
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
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        public int Id => 15;

        public string Name => "EfRegisterUserCommand";

        private IEnumerable<int> useCasesForUser = new List<int> { 16, 17, 18, 20, 30, 31, 32, 33, 35, 42, 43, 45, 400 };

        private readonly BlogProjectContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IMapper _mapper;

        public EfRegisterUserCommand(BlogProjectContext context, RegisterUserValidator validator, IEmailSender sender, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            _mapper = mapper;
        }



        public void Execute(RegisterUserRequest request)
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

            foreach (var c in useCasesForUser)
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
