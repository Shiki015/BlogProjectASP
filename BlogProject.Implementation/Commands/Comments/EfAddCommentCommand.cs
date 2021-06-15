using AutoMapper;
using BlogProject.Application;
using BlogProject.Application.Commands.Comments;
using BlogProject.Application.Requests.Comments;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Coments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Comments
{
    public class EfAddCommentCommand : IAddCommentCommand
    {
        private readonly BlogProjectContext _context;
        private readonly IApplicationActor _actor;
        private readonly AddCommentValidator _validator;
        private readonly IMapper _mapper;


        public EfAddCommentCommand(BlogProjectContext context, IApplicationActor actor, AddCommentValidator validator, IMapper mapper)
        {
            _context = context;
            _actor = actor;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 42;

        public string Name => "EfAddCommentCommand";

        public void Execute(AddCommentRequest request)
        {
            _validator.ValidateAndThrow(request);
            request.UserId = _actor.Id;
            var comment = _mapper.Map<Comment>(request);

            _context.Add(comment);
            _context.SaveChanges();
        }
    }
}
