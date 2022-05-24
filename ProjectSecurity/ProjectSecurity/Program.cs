using DataAccessLayer.Repository;
using BusinessAccessLayer.IRepositories;
using DataAccessLayer.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using BusinessAccessLayer.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//Dal Services
builder.Services.AddSingleton<IAuthService, AuthService>();
builder.Services.AddSingleton<IEmployeeService, EmployeeService>();
//builder.Services.AddSingleton<IPlanningService, PlanningService>();
builder.Services.AddSingleton<ICustomerService, CustomerService>();


//BLL Services
//builder.Services.AddSingleton<IPlanningServices, PlanningService>();
builder.Services.AddSingleton<IClientServices , ClientServices>();
builder.Services.AddSingleton<IEmployeeServices, EmployeeServices>();
builder.Services.AddSingleton<IRapportService , RapportService>();
builder.Services.AddSingleton<IAuthServices, AuthServices>();


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
