using BlogProject.Application.Requests.Comments;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Application.Exceptions
{
    public class EntityNotFoundException : Exception
    {
        private UpdateCommentPersonalRequest request;
        private Type type;

        public EntityNotFoundException(int id, Type type)
            : base($"Entity of type {type.Name} with and id of {id} was not found")
        {
        }

        public EntityNotFoundException(UpdateCommentPersonalRequest request, Type type)
        {
            this.request = request;
            this.type = type;
        }
    }
}
