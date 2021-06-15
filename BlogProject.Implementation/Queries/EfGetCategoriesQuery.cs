using AutoMapper;
using BlogProject.Application.DataTransfer;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Queries;
using BlogProject.Application.Searches;
using BlogProject.DataAccess;
using BlogProject.Domain;
using BlogProject.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Queries
{
    public class EfGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;


        public EfGetCategoriesQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 20;

        public string Name => "EfGetCategoriesQuery";

        public PagedResponse<CategoriesDto> Execute(CategoriesSearch search)
        {
            var query = _context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
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


            return query.Paged<CategoriesDto, Category>(search, _mapper);
        }
    }
}
