using BlogProject.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Email
{
    public interface IEmailSender
    {
        void Send(SendEmailDto dto);
    }
}
