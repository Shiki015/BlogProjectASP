using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Domain
{
    public class ExceptionLog : Entity
    {
        public string Response { get; set; }
        public int StatusCode { get; set; }
        public string Exception { get; set; }
    }
}
