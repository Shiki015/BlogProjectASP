using AutoMapper;
using BlogProject.Application.DataTransfer.Users;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Queries;
using BlogProject.Application.Queries.Users;
using BlogProject.Application.Searches;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Queries.Users
{
    public class EfGetUsersFrontQuery : IGetUsersFrontQuery
    {
        public readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        public EfGetUsersFrontQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 17;

        public string Name => "EfGetUsersFrontQuery";

        public PagedResponse<UserFrontDto> Execute(UserSearch search)
        {
            var query = _context.Users.OrderByDescending(x => x.Id).AsQueryable();

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

            if (search.DateFrom > search.DateTo)
            {
                throw new DateFromLessDateToException(search.DateFrom, search.DateTo);
            }


            return query.Paged<UserFrontDto, User>(search, _mapper);
        }
    }
}
