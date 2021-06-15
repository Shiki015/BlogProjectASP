using AutoMapper;
using BlogProject.Application;
using BlogProject.Application.Commands.Posts;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Requests.Posts;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Posts;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Commands.Posts
{
    public class EfUpdatePostCommand : IUpdatePostCommand
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;
        private readonly UpdatePostValidator _validator;

        public EfUpdatePostCommand(BlogProjectContext context, IMapper mapper, IApplicationActor actor, UpdatePostValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
            _validator = validator;
        }

        public int Id => 33;

        public string Name => "EfUpdatePostCommand";

        public void Execute(UpdatePostRequest request)
        {
            _validator.ValidateAndThrow(request);

            var findPost = _context.Posts.Find(request.Id);

            if (findPost == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Post));
            }

            if (_actor.Id != findPost.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }

            var post = _context.Posts.Include(x => x.User).Include(x => x.Category)
                .Where(x => x.Id == request.Id).FirstOrDefault();

            _mapper.Map(request, post);

            _context.SaveChanges();
        }
    }
}
