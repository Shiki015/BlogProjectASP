using AutoMapper;
using BlogProject.Application.DataTransfer.Comments;
using BlogProject.Application.DataTransfer.Posts;
using BlogProject.Application.Exceptions;
using BlogProject.Application.Queries.Posts;
using BlogProject.DataAccess;
using BlogProject.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogProject.Implementation.Queries.Posts
{
    public class EfGetOnePostQuery : IGetOnePostQuery
    {
        private readonly BlogProjectContext _context;
        private readonly IMapper _mapper;
        private ICollection<GetCommentsForOnePostDto> MainComms { get; set; } = new List<GetCommentsForOnePostDto>();

        public EfGetOnePostQuery(BlogProjectContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 31;

        public string Name => "EfGetOnePostQuery";

        public OnePostDto Execute(int search)
        {
            var post = _context.Posts.Find(search);

            if (post == null)
            {
                throw new EntityNotFoundException(search, typeof(Post));
            }

            var postQuery = _context.Posts
                .Include(u => u.User)
                .Include(c => c.Category)
                .Include(x => x.Comments)
                .ThenInclude(x => x.User)
                .Include(x => x.Votes)
                .ThenInclude(x => x.User)
                .Where(x => x.Id == search)
                .FirstOrDefault();

            var result = _mapper.Map<OnePostDto>(postQuery);

            foreach (var r in result.Comments)
            {
                if (r.ParentId == 0)
                {
                    MainComms.Add(r);
                }
            }
            result.Comments = MainComms;

            return result;
        }
    }
}
