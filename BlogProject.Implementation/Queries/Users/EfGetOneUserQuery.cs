using AutoMapper;
using BlogProject.Application.DataTransfer.Users;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Queries.Users;
using BlogProject.DataAccess;
using BlogProject.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Queries.Users
{
    public class EfGetOneUserQuery : IGetOneUserQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;

        public EfGetOneUserQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 11;

        public string Name => "EfGetOneUserQuery";

        public OneUserDto Execute(int search)
        {
            var u = _context.Users.Find(search);

            if (u == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }
            var queryUser = _context.Users.Include(u => u.UserUseCases).Include(u => u.Posts).ThenInclude(c => c.Category).Where(u => u.Id == search).First();

            var user = _mapper.Map<OneUserDto>(queryUser);

            return user;
        }
    }
}
