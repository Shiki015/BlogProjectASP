using BlogProject.Application;
using BlogProject.Application.Commands;
using BlogProject.Application.Commands.Categories;
using BlogProject.Application.Commands.Comments;
using BlogProject.Application.Commands.Posts;
using BlogProject.Application.Commands.Users;
using BlogProject.Application.Email;
using BlogProject.Application.Queries;
using BlogProject.Application.Queries.Posts;
using BlogProject.Application.Queries.Users;
using BlogProject.Implementation.Commands;
using BlogProject.Implementation.Commands.Categories;
using BlogProject.Implementation.Commands.Comments;
using BlogProject.Implementation.Commands.Posts;
using BlogProject.Implementation.Commands.Users;
using BlogProject.Implementation.Email;
using BlogProject.Implementation.Logging;
using BlogProject.Implementation.Queries;
using BlogProject.Implementation.Queries.Posts;
using BlogProject.Implementation.Queries.Users;
using BlogProject.Implementation.Validators;
using BlogProject.Implementation.Validators.Categories;
using BlogProject.Implementation.Validators.Coments;
using BlogProject.Implementation.Validators.Posts;
using BlogProject.Implementation.Validators.Users;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogProject.Api.Core
{
    public static class Container
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            //connecting interfaces
            services.AddTransient<IEmailSender, SmtpEmailSender>();
            services.AddTransient<IGetLogsQuery, EfGetLogQuery>();
            services.AddTransient<IExceptionLogger, DatabaseExceptionLogger>();
            services.AddTransient<IGetLogsExceptionQuery, EfGetLogExceptionQuery>();
            services.AddTransient<IUseCaselogger, DatabaseUseCaseLogger>();

            //users

            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IAddUserCommand, EfAddUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IUpdateUserPersonalCommand, EfUpdateUserPersonalCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            services.AddTransient<IGetOneUserFrontQuery, EfGetOneUserFrontQuery>();
            services.AddTransient<IGetUsersFrontQuery, EfGetUsersFrontQuery>();

            //categories

            services.AddTransient<IAddCategoryCommand, EfAddCategoryCommand>();
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();

            //comments

            services.AddTransient<IAddCommentCommand, EfAddCommentCommand>();
            services.AddTransient<IUpdateCommentPersonalComment, EfUpdateCommentPersonalCommand>();
            services.AddTransient<IDeleteCommentCommand, EfDeleteCommentCommand>();
            services.AddTransient<IDeleteCommentPersonalCommand, EfDeleteCommentPersonalCommand>();

            //posts

            services.AddTransient<IGetPostsQuery, EfGetPostsQuery>();
            services.AddTransient<IGetOnePostQuery, EfGetOnePostQuery>();
            services.AddTransient<IAddPostCommand, EfAddPostCommand>();
            services.AddTransient<IUpdatePostCommand, EfUpdatePostCommand>();
            services.AddTransient<IDeletePostCommand, EfDeletePostCommand>();

            //votes

            services.AddTransient<IAddVoteCommand, EfAddVoteCommand>();


            //contact

            services.AddTransient<IContactCommand, EfContactCommand>();

            //email

            services.AddTransient<IEmailSender, SmtpEmailSender>();
        }

        public static void AddValidators(this IServiceCollection services)
        {
            //users

            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<LoginUserValidator>();
            services.AddTransient<AddUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<UpdateUserPersonalValidator>();
            services.AddTransient<DeleteUserValidator>();

            //categories

            services.AddTransient<AddCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();
            services.AddTransient<DeleteCategoryValidator>();

            //comments

            services.AddTransient<AddCommentValidator>();
            services.AddTransient<DeleteCommentValidator>();
            services.AddTransient<UpdateCommentValidator>();

            //posts

            services.AddTransient<AddPostValidator>();
            services.AddTransient<UpdatePostValidator>();
            services.AddTransient<DeletePostValidator>();

            //votes

            services.AddTransient<AddVoteValidator>();

            //contact

            services.AddTransient<ContactValidator>();

        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();
             
                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
        }
        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtManager>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "blog_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey!")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

    }
}
