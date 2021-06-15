using BlogProject.Application.Requests.Users;
using BlogProject.DataAccess;
using BlogProject.Implementation.Validators.Users;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BlogProject.Api.Core
{
    public class JwtManager 
    { 

        private readonly BlogProjectContext _context;
        private readonly LoginUserValidator _validator;
        public JwtManager(BlogProjectContext context, LoginUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public string MakeToken(LoginRequest request)
        {

            _validator.ValidateAndThrow(request);

            var pass = EasyEncryption.SHA.ComputeSHA256Hash(request.Password);
            var user = _context.Users.Include(u => u.UserUseCases)
                .FirstOrDefault(x => x.Username == request.Username && x.Password == EasyEncryption.SHA.ComputeSHA256Hash(request.Password));

            if (user == null)
            {
                return null;
            }

            var actor = new JwtActor
            {
                Id = user.Id,
                AllowedUseCases = user.UserUseCases.Select(x => x.UseCaseId),
                Identity = user.Username
            };

            var issuer = "blog_api";
            var secretKey = "ThisIsMyVerySecretKey!";
            var claims = new List<Claim> 
                {
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                    new Claim(JwtRegisteredClaimNames.Iss, "blog_api", ClaimValueTypes.String, issuer),
                    new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
                    new Claim("UserId", actor.Id.ToString(), ClaimValueTypes.String, issuer),
                    new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, issuer)
                };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddSeconds(1130),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
}
}
