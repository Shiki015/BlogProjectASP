using BlogProject.Application;
using BlogProject.Application.Commands.Posts;
using BlogProject.Application.Queries.Posts;
using BlogProject.Application.Requests.Posts;
using BlogProject.Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BlogProject.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        private readonly IApplicationActor _actor;

        public PostController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }

        // GET: api/<PostController>
        [HttpGet]
        public IActionResult Get([FromServices] IGetPostsQuery query, [FromQuery] PostSearch search)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices]IGetOnePostQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<PostController>
        [HttpPost]
        public IActionResult Post([FromBody] AddPostRequest request, [FromServices] IAddPostCommand command)
        {
            request.UserId = _actor.Id;
            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<PostController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdatePostRequest request, [FromServices] IUpdatePostCommand command)
        {
            request.Id = id;
            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<PostController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        [HttpPost]
        [Route("vote")]
        public IActionResult Vote([FromBody] AddVoteRequest request, [FromServices] IAddVoteCommand command)
        {
            request.UserId = _actor.Id;

            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status201Created);
        }
    }
}
