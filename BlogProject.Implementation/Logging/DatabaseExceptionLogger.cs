using BlogProject.Application;
using BlogProject.DataAccess;
using BlogProject.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Logging
{
    public class DatabaseExceptionLogger : IExceptionLogger
    {
        private readonly BlogProjectContext _context;
        public DatabaseExceptionLogger(BlogProjectContext context)
        {
            _context = context;
        }

        public void LogEx(string response, int statusCode, string exception)
        {
            var newException = new ExceptionLog
            {
                Response = response,
                StatusCode = statusCode,
                Exception = exception
            };

            _context.ExceptionLogs.Add(newException);
            _context.SaveChanges();
        }
    }
}
