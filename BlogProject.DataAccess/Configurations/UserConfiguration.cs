using BlogProject.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.DataAccess.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.Username).IsRequired().HasMaxLength(30);

            builder.HasIndex(x => x.Username).IsUnique();

            builder.Property(x => x.Password).IsRequired().HasMaxLength(255);

            builder.Property(x => x.Email).IsRequired();

            builder.Property(x => x.ProfilePhoto).IsRequired();

            builder.HasMany(u => u.UserUseCases).WithOne(uu => uu.User).HasForeignKey(uu => uu.UserId);

            builder.HasMany(u => u.Posts).WithOne(p => p.User).HasForeignKey(p => p.UserId).OnDelete(DeleteBehavior.Restrict); 

            builder.HasMany(x => x.Comments).WithOne(c => c.User).HasForeignKey(u => u.UserId).OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.Votes).WithOne(v => v.User).HasForeignKey(v => v.UserId).OnDelete(DeleteBehavior.Cascade);
        }
    }
}
