using BlogProject.Application;
using BlogProject.Application.Exceptions;
using FluentValidation;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlogProject.Api.Core
{
    public class GlobalExceptionHandler
    {
        private readonly RequestDelegate _next;
        private readonly IExceptionLogger _exLogger;
        public GlobalExceptionHandler(RequestDelegate next, IExceptionLogger exLogger)
        {
            _next = next;
            _exLogger = exLogger;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                httpContext.Response.ContentType = "application/json";
                object response = null;
                var statusCode = StatusCodes.Status500InternalServerError;

                switch (ex)
                {
                    case UnauthorizedUseCaseException _:
                        statusCode = StatusCodes.Status403Forbidden;
                        response = new
                        {
                            message = "You are not allowed to execute this operation."
                        };
                        break;
                    case EntityNotFoundException _:
                        statusCode = StatusCodes.Status404NotFound;
                        response = new
                        {
                            message = "Resource not found."
                        };
                        break;

                    case DateFromLessDateToException _:
                        statusCode = StatusCodes.Status416RangeNotSatisfiable;
                        response = new
                        {
                            message = "DateFrom cant be before DateTo."
                        };
                        break;
                    case ForbiddenAccessException _:
                        statusCode = StatusCodes.Status403Forbidden;
                        response = new
                        {
                            message = "You are not allowed to execute this operation."
                        };
                        break;
                    case ValidationException validationException:
                        statusCode = StatusCodes.Status422UnprocessableEntity;


                        response = new
                        {
                            message = "Failed due to validation errors.",
                            errors = validationException.Errors.Select(x => new
                            {
                                x.PropertyName,
                                x.ErrorMessage
                            })
                        };
                        break;
                }
                httpContext.Response.StatusCode = statusCode;
                _exLogger.LogEx(JsonConvert.SerializeObject(response), statusCode, ex.Message);
                if (response != null)
                {
                    await httpContext.Response.WriteAsync(JsonConvert.SerializeObject(response));
                    return;
                }

                await Task.FromResult(httpContext.Response);

            }
        }
    }
}
