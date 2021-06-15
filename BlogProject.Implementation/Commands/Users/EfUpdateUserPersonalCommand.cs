using AutoMapper;
using BlogProject.Application;
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
    public class EfUpdateUserPersonalCommand : IUpdateUserPersonalCommand
    {
        private readonly BlogProjectContext _context;
        private readonly UpdateUserPersonalValidator _validator;
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;


        public EfUpdateUserPersonalCommand(BlogProjectContext context, UpdateUserPersonalValidator validator, IApplicationActor actor, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
            _mapper = mapper;
        }

        public int Id => 16;

        public string Name => "EfUpdateUserCommandPersonal";

        public void Execute(UpdateUserPersonalRequest request)
        {

            _validator.ValidateAndThrow(request);



            var findUser = _context.Users.Find(request.Id);
            if (findUser == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }

            if (_actor.Id != request.Id)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
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


            _mapper.Map(request, user);

            user.ProfilePhoto = newFileName;
            user.Password = EasyEncryption.SHA.ComputeSHA256Hash(request.Password);

            _context.SaveChanges();

        }
    }
}
