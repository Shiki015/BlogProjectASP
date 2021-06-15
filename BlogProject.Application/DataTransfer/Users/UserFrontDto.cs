using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.DataTransfer.Users
{
    public class UserFrontDto
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string ProfilePhoto { get; set; }
    }
}
