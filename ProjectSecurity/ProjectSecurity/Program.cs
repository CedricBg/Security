using DataAccessLayer.Repository;
using BusinessAccessLayer.IRepositories;
using DataAccessLayer.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using BusinessAccessLayer.Services;
using ProjectSecurity.Tools;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//Dal Services
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IEmployeeService, EmployeeService>();
builder.Services.AddScoped<IPlanningService, PlanningService>();
builder.Services.AddScoped<ICustomerService, CustomerService>();
builder.Services.AddScoped<IRondeService , RondeService>();
builder.Services.AddScoped<IWorkService , WorkService>();
builder.Services.AddScoped<ITownService ,TownService> ();
builder.Services.AddScoped<IFormulaireService, FormulaireService>();


//BLL Services
builder.Services.AddScoped<IPlanningServices, PlanningServices>();
builder.Services.AddScoped<IClientServices , ClientServices>();
builder.Services.AddScoped<IEmployeeServices, EmployeeServices>();
builder.Services.AddScoped<IRapportService , RapportService>();
builder.Services.AddScoped<IAuthServices, AuthServices>();
builder.Services.AddScoped<IRondeServices, RondeServices>();
builder.Services.AddScoped<IWorkServices, WorkServices>();
builder.Services.AddScoped<IClientServices, ClientServices>();
builder.Services.AddScoped<ITownServices, TownServices>();
builder.Services.AddScoped<IformulaireServices, formulaireServices>();

//Api
builder.Services.AddScoped<TokenService>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddCors();

builder.Services.AddSwaggerGen(c =>
{
    string basePath = AppContext.BaseDirectory;
    string xmlPath = Path.Combine(basePath, "SwaggerDemo.xml");
    c.IncludeXmlComments(xmlPath);
});

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AGENTPolicy", policy => policy.RequireRole("Agent", "M1", "M2", "TR","OP", "SB", "DIR", "SQ", "SE", "SEL", "BI", "SBG", "MB", "SMBP", "MBB", "ADM", "TM", "PRVA" ));
    options.AddPolicy("DIRPolicy"       , policy => policy.RequireRole("DIR"));
    options.AddPolicy("OPPolicy"        , policy => policy.RequireRole("OP", "DIR"));
    options.AddPolicy("ADM"             , policy => policy.RequireRole("ADM", "DIR"));
    options.AddPolicy("SBPolicy"        , policy => policy.RequireRole("SB" , "DIR"));
    options.AddPolicy("SQPolicy"        , policy => policy.RequireRole("SQ" , "DIR"));
    options.AddPolicy("SEPolicy"        , policy => policy.RequireRole("SE" , "DIR"));
    options.AddPolicy("SELPolicy"       , policy => policy.RequireRole("SEL", "DIR"));
    options.AddPolicy("SBGPolicy"       , policy => policy.RequireRole("SBG", "DIR"));
    options.AddPolicy("MBPolicy"        , policy => policy.RequireRole("MB" , "DIR"));
    options.AddPolicy("SMBPPolicy"      , policy => policy.RequireRole("SMBP", "DIR"));
    options.AddPolicy("MBBPolicy"       , policy => policy.RequireRole("MBB", "DIR"));
    options.AddPolicy("M1BPolicy"       , policy => policy.RequireRole("M1" , "DIR"));
    options.AddPolicy("M2BPolicy"       , policy => policy.RequireRole("M2" , "DIR"));
    options.AddPolicy("TRPolicy"        , policy => policy.RequireRole("TR" , "DIR"));
    options.AddPolicy("PRVAPolicy"      , policy => policy.RequireRole("PRVA", "DIR"));
    options.AddPolicy("BIPolicy"        , policy => policy.RequireRole("BI" , "DIR"));
    options.AddPolicy("TMPolicy"        , policy => policy.RequireRole("TM" , "DIR"));
    options.AddPolicy("SUBPolicy"       , policy => policy.RequireRole("SUB", "DIR"));
    options.AddPolicy("CUSTPolicy"      , policy => policy.RequireRole("CUST", "DIR"));
});

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters()
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = 
        new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration.GetSection("tokenValidation").GetSection("secret").Value)),
        ValidateIssuer = true,
        ValidIssuer = builder.Configuration.GetSection("tokenValidation").GetSection("issuer").Value,
        ValidateLifetime = true,
        ValidateAudience = true,
        ValidAudience = builder.Configuration.GetSection("tokenValidation").GetSection("audience").Value
        
    };
});



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
