using AutoMapper;
using BlogProject.Application.DataTransfer.Posts;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Queries;
using BlogProject.Application.Queries.Posts;
using BlogProject.Application.Searches;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Queries.Posts
{
    public class EfGetPostsQuery : IGetPostsQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;

        public EfGetPostsQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 30;

        public string Name => "EfGetPostsQuery";

        public PagedResponse<PostDto> Execute(PostSearch search)
        {
            var query = _context.Posts.OrderByDescending(x => x.Id).Include(u => u.User).Include(c => c.Category).AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword) || !string.IsNullOrWhiteSpace(search.Keyword))
            {
                query = query.Where(x => x.Title.ToLower().Contains(search.Keyword.ToLower()));
                query = query.Where(x => x.Description.ToLower().Contains(search.Keyword.ToLower()));
            }

            if (search.CategoryIds.Any())
            {
                query = query.Where(x => search.CategoryIds.Contains(x.CategoryId));
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



            return query.Paged<PostDto, Post>(search, _mapper);

        }
    }
}
