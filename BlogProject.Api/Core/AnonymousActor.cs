using BlogProject.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlogProject.Api.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 11;

        public string Identity => "Anonymus";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 1000); 
    }
}
