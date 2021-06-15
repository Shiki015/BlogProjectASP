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
    public class UserController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UserController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UserController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersFrontQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserFrontQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }


        // PUT api/<UserController>/5
        [HttpPut("{id}")]
        public IActionResult Put([FromForm] UpdateUserPersonalRequest request,[FromServices] IUpdateUserPersonalCommand command,int id)
        {
            request.Id = id;

            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status204NoContent);
        }

      
    }
}
