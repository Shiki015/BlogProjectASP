using AutoMapper;
using BlogProject.Application.Commands.Posts;
using BlogProject.Application.Requests.Posts;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Commands.Posts
{
    public class EfAddPostCommand : IAddPostCommand
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        private readonly AddPostValidator _validator;
        public EfAddPostCommand(BlogProjectContext context, IMapper mapper, AddPostValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => 32;

        public string Name => "EfAddPostCommand";

        public void Execute(AddPostRequest reqeust)
        {
            _validator.ValidateAndThrow(reqeust);
            
            var post = _mapper.Map<Post>(reqeust);

            _context.Posts.Add(post);

            _context.SaveChanges();
        }
    }
}
