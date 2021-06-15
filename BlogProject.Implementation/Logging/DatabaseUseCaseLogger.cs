using BlogProject.Application;
using BlogProject.DataAccess;
using BlogProject.Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Implementation.Logging
{
    public class DatabaseUseCaseLogger : IUseCaselogger
    {
        private readonly BlogProjectContext _context;
        public DatabaseUseCaseLogger(BlogProjectContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            _context.UseCaseLogs.Add(new UseCaseLog
            {
                Actor = actor.Identity,
                Data = JsonConvert.SerializeObject(useCaseData),
                UseCaseName = useCase.Name
            });
            _context.SaveChanges();
        }
    }
}
