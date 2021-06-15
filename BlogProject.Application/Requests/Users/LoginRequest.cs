using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Users
{
    public class LoginRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
