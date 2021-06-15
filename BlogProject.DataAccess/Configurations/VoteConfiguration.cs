using BlogProject.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.DataAccess.Configurations
{
    public class VoteConfiguration : IEntityTypeConfiguration<Vote>
    {
        public void Configure(EntityTypeBuilder<Vote> builder)
        {
            builder.Property(x => x.Status).HasColumnType("bigint");

            builder.Property(x => x.PostId).IsRequired();

            builder.Property(x => x.UserId).IsRequired();
        }
    }
}
