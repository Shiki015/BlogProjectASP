using BlogProject.Application.Requests.Categories;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Commands.Categories
{
    public interface IAddCategoryCommand : ICommand<AddCategoryRequest>
    {
    }
}
