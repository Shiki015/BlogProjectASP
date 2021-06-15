using BlogProject.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.DataAccess.Configurations
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x => x.CommentText).IsRequired();

            builder.HasMany(x => x.Childs).WithOne(x => x.Parent).HasForeignKey(x => x.ParentId).OnDelete(DeleteBehavior.Restrict);

           
        }
    }
}
