using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using BusinessAccessLayer.Models.Auth;

namespace BusinessAccessLayer.Services;

public class TokenService
{
    private readonly string _issuer, _audience, _secret;

    public TokenService(IConfiguration config)
    {
        _issuer = config.GetSection("tokenValidation").GetSection("issuer").Value;
        _audience = config.GetSection("tokenValidation").GetSection("audience").Value;
        _secret = config.GetSection("tokenValidation").GetSection("secret").Value;

    }
    public string GenerateJwt(JwtUser user)
    {
        if (user.Login is null)
        {
            return "No Login inserted";
        }

        SymmetricSecurityKey securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_secret));
        SigningCredentials credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);


        Claim[] myClaims = new[]
        {
            new Claim(ClaimTypes.Surname, user.Login),
            new Claim(ClaimTypes.Name, user.Name),
            new Claim(ClaimTypes.Sid, user.IdUser.ToString()),
            new Claim(ClaimTypes.Role, user.Role)
        };

        JwtSecurityToken token = new JwtSecurityToken
        (
            claims: myClaims,
            signingCredentials: credentials,
            audience: _audience,
            issuer: _issuer,
            expires: DateTime.Now.AddDays(1)
        );
        JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();
        return handler.WriteToken(token);
    }
}

