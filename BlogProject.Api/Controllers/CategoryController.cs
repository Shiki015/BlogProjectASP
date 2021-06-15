using BlogProject.Application;
using BlogProject.Application.Commands.Categories;
using BlogProject.Application.Queries;
using BlogProject.Application.Requests.Categories;
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
    public class CategoryController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CategoryController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<CategoryController>
        [HttpGet]
        public IActionResult Get([FromQuery] CategoriesSearch search, [FromServices] IGetCategoriesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // POST api/<CategoryController>
        [HttpPost]
        public IActionResult Post([FromBody] AddCategoryRequest request, [FromServices] IAddCategoryCommand command)
        {
            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<CategoryController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateCategoryRequest request, [FromServices] IUpdateCategoryCommand command)
        {
            request.Id = id;

            _executor.ExecuteCommand(command, request);

            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<CategoryController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCategoryCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
