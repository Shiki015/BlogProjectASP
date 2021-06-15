using BlogProject.Application;
using BlogProject.Application.Queries;
using BlogProject.Application.Searches;
using Microsoft.AspNetCore.Authorization;
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
    public class LogController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public LogController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<LogController>
        [HttpGet]
        public IActionResult Get([FromQuery] LogSearch search,[FromServices] IGetLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        [HttpGet]
        [Route("exception")]
        public IActionResult Get([FromQuery] LogExceptionSearch search,[FromServices] IGetLogsExceptionQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        
    }
}
