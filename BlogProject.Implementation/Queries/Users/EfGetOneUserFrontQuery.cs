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
    public class EfGetOneUserFrontQuery : IGetOneUserFrontQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;

        public EfGetOneUserFrontQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 18;

        public string Name => "EfGetOneUserFrontQuery";

        public OneUserDtoFront Execute(int search)
        {
            var u = _context.Users.Find(search);

            if (u == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }
            var queryUser = _context.Users.Include(u => u.Posts).Where(u => u.Id == search).First();

            var user = _mapper.Map<OneUserDtoFront>(queryUser);

            return user;
        }
    }
}
