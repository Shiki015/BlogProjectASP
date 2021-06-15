using AutoMapper;
using BlogProject.Application;
using BlogProject.Application.Commands.Comments;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Requests.Comments;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Coments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Commands.Comments
{
    public class EfUpdateCommentPersonalCommand : IUpdateCommentPersonalComment
    {
        private readonly BlogProjectContext _context;
        private readonly UpdateCommentValidator _validator;
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public EfUpdateCommentPersonalCommand(BlogProjectContext context, UpdateCommentValidator validator, IApplicationActor actor, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
            _mapper = mapper;
        }

        public int Id => 43;

        public string Name => "EfUpdateCommentPersonalCommand";

        public void Execute(UpdateCommentPersonalRequest request)
        {
            _validator.ValidateAndThrow(request);

            var comment = _context.Comments.Find(request.Id);
            if (comment == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Comment));
            }

            if (_actor.Id != comment.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }

            var commentQuery = _context.Comments.Where(x => x.Id == request.Id).FirstOrDefault();

            _mapper.Map(request, commentQuery);

            _context.SaveChanges();
        }
    }
}
