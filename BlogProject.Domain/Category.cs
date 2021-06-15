using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Domain
{
    public class Category : Entity
    {
        public string Name { get; set; }
        public virtual ICollection<Post> Posts { get; set; } = new HashSet<Post>();
    }
}
