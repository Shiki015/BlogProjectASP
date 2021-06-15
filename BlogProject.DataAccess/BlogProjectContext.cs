using BlogProject.DataAccess.Configurations;
using BlogProject.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogProject.DataAccess
{
    public class BlogProjectContext : DbContext 
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            modelBuilder.ApplyConfiguration(new CommentConfiguration());
            modelBuilder.ApplyConfiguration(new VoteConfiguration());
            modelBuilder.ApplyConfiguration(new UseCaseLogConfiguration());
            modelBuilder.ApplyConfiguration(new ExceptionLogConfiguration());

            modelBuilder.Entity<User>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Category>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Post>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Comment>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Vote>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<UseCaseLog>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<ExceptionLog>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<UserUseCase>().HasQueryFilter(p => !p.IsDeleted);

        }
        public override int SaveChanges()
        {
            foreach(var entry in ChangeTracker.Entries())
            {
                if(entry.Entity is Entity entity)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            entity.IsActive = true;
                            entity.CreatedAt = DateTime.UtcNow;
                            entity.DeletedAt = null;
                            entity.IsDeleted = false;
                            entity.ModifiedAt = null;
                            break;
                        case EntityState.Modified:
                            entity.ModifiedAt = DateTime.UtcNow;
                            break;
                    }
                }
            }
            return base.SaveChanges();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-Q7TT736;Initial Catalog=blog;Integrated Security=True");
        }
        public DbSet<User> Users { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Vote> Votes { get; set; }
        public DbSet<ExceptionLog> ExceptionLogs { get; set; }
    }
}
