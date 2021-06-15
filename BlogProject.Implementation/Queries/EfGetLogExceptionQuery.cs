using AutoMapper;
using BlogProject.Application.DataTransfer;
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
    public class EfGetLogExceptionQuery : IGetLogsExceptionQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        public EfGetLogExceptionQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 701;

        public string Name => "EfGetLogExceptionQuery";

        public PagedResponse<LogExceptionDto> Execute(LogExceptionSearch search)
        {

            var query = _context.ExceptionLogs.OrderByDescending(x => x.Id).AsQueryable();

            if (!string.IsNullOrEmpty(search.Response) || !string.IsNullOrWhiteSpace(search.Response))
            {
                query = query.Where(x => x.Response.ToLower().Contains(search.Response.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.StatusCode.ToString()) || !string.IsNullOrWhiteSpace(search.StatusCode.ToString()))
            {
                query = query.Where(x => x.StatusCode.ToString().ToLower().Contains(search.StatusCode.ToString().ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Exception) || !string.IsNullOrWhiteSpace(search.Exception))
            {
                query = query.Where(x => x.Exception.ToLower().Contains(search.Exception.ToLower()));
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

            return query.Paged<LogExceptionDto, ExceptionLog>(search, _mapper);
        }
    }
}
