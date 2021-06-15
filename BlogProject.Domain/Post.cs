using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.Domain
{
    public class Post : Entity
    {
        public string Title { get; set; }
        public int CategoryId { get; set; }
        public int UserId { get; set; }
        public string Description { get; set; }
        public virtual Category Category { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<Vote> Votes { get; set; } = new HashSet<Vote>(); 
    }
}
