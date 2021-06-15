using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Domain
{
    public class UseCaseLog : Entity
    {
        public string UseCaseName { get; set; }
        public string Data { get; set; }
        public string Actor { get; set; }
    }
}
