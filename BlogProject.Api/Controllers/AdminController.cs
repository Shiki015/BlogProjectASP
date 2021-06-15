using BlogProject.Application;
using BlogProject.Application.Commands.Users;
using BlogProject.Application.Queries.Users;
using BlogProject.Application.Requests.Users;
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
    public class AdminController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public AdminController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<AdminController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersQuery query)
        {
            return Ok(_executor.ExecuteQuery(query,search));
        }

        // GET api/<AdminController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<AdminController>
        [HttpPost]
        public IActionResult Post([FromForm] AddUserRequest request, [FromServices] IAddUserCommand command)
        {
            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<AdminController>/5
        [HttpPut("{id}")]
        public IActionResult Put([FromForm] UpdateUserRequest request, [FromServices] IUpdateUserCommand command, int id)
        {
            request.Id = id;

            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status204NoContent);

        }

        // DELETE api/<AdminController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete([FromServices] IDeleteUserCommand command, int id)
        {
            _executor.ExecuteCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
