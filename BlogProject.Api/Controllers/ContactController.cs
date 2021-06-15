using BlogProject.Application;
using BlogProject.Application.Commands;
using BlogProject.Application.Requests;
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
    public class ContactController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        public ContactController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        

        // POST api/<ContactController>
        [HttpPost]
        public IActionResult Post([FromBody] ContactRequest request, [FromServices] IContactCommand command)
        {
            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status201Created);
        }

    }
}
