using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Requests.Users
{
    public class UpdateUserRequest
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public IFormFile ProfilePhoto { get; set; }
        public IEnumerable<int> UserUseCases { get; set; } = new List<int>();
    }
}
