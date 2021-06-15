using AutoMapper;
using BlogProject.Application;
using BlogProject.Application.Commands.Posts;
using BlogProject.Application.Requests.Posts;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Commands.Posts
{
    public class EfAddVoteCommand : IAddVoteCommand
    {
        private readonly BlogProjectContext _context;
        private readonly IApplicationActor _actor;
        private readonly AddVoteValidator _validator;
        private readonly IMapper _mapper;

        public EfAddVoteCommand(BlogProjectContext context, IApplicationActor actor, AddVoteValidator validator, IMapper mapper)
        {
            _context = context;
            _actor = actor;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 35;

        public string Name => "EfAddVoteCommand";

        public void Execute(AddVoteRequest request)
        {
            _validator.ValidateAndThrow(request);

            var findVote = _context.Votes.Where(x => x.PostId == request.PostId && x.UserId == request.UserId).FirstOrDefault();

            if (findVote == null)
            {
                var newVote = _mapper.Map<Vote>(request);
                _context.Votes.Add(newVote);
                _context.SaveChanges();
            }
            else
            {
                findVote.Status = request.Status;
                _context.SaveChanges();
            }


        }
    }
}
