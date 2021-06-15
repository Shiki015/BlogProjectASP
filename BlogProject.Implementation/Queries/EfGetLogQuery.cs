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
    public class EfGetLogQuery : IGetLogsQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        public EfGetLogQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 700;

        public string Name => "EfGetLogQuest";

        public PagedResponse<LogDto> Execute(LogSearch search)
        {
            var query = _context.UseCaseLogs.OrderByDescending(x => x.Id).AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
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

            return query.Paged<LogDto, UseCaseLog>(search, _mapper);



        }

    }
}
