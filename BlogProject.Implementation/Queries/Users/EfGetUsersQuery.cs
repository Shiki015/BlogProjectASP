using AutoMapper;
using BlogProject.Application.DataTransfer.Users;
using BlogProject.Application.Queries;
using BlogProject.Application.Queries.Users;
using BlogProject.Application.Searches;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Queries.Users
{
    public class EfGetUsersQuery : IGetUsersQuery
    {
        public readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        public EfGetUsersQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "EfGetUsersQuery";

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = _context.Users.OrderByDescending(x => x.Id).Include(x => x.UserUseCases).AsQueryable();

            if (!string.IsNullOrEmpty(search.Email) || !string.IsNullOrWhiteSpace(search.Email))
            {
                query = query.Where(x => x.Email.ToLower().Contains(search.Email.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(search.Username.ToLower()));
            }

            if (search.DateFrom != DateTime.MinValue)
            {
                query = query.Where(x => x.CreatedAt.Date >= search.DateFrom.Date);
            }

            if (search.DateTo != DateTime.MinValue && search.DateTo >= search.DateFrom)
            {
                query = query.Where(x => x.CreatedAt.Date <= search.DateTo.Date);
            }

            query.CheckDateTime(search);


            return query.Paged<UserDto, User>(search, _mapper);
        }
    }
}
