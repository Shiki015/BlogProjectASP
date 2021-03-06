using BlogProject.Application.DataTransfer;
using BlogProject.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Queries
{
    public interface IGetLogsQuery : IQuery<LogSearch, PagedResponse<LogDto>>
    {
    }
}
