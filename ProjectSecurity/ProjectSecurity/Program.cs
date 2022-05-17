using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(

    options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters()
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration.GetSection("tokenValidation").GetSection("secret").Value)),
            ValidateIssuer = true,
            ValidIssuer = builder.Configuration.GetSection("tokenValidation").GetSection("issuer").Value,
            ValidateLifetime = true,
            ValidateAudience = true,
            ValidAudience = builder.Configuration.GetSection("tokenValidation").GetSection("audience").Value,
        };
    });

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("adminPolicy", policy => policy.RequireRole("admin"));
    options.AddPolicy("userPolicy", policy => policy.RequireRole("user", "admin"));
    options.AddPolicy("auth", policy => policy.RequireAuthenticatedUser());
});

    

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(o => o.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin());

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
