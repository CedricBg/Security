using AdoToolbox;
using DataAccessLayer.Models.Work;
using DataAccessLayer.Repository;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services;

public class WorkService : IWorkService
{
    private readonly string _connectionString;
    /// <summary>
    /// Service ou on réceptionne le départ et la fin de journée de travail de l'agent
    /// </summary>
    /// <param name="connectionString"></param>
    public WorkService(IConfiguration connectionString)
    {
        _connectionString = connectionString.GetConnectionString("connectionString");
    }

    public int StartWork(StartForm form)
    {

        Connection cnx = new Connection(_connectionString);
        Command cmd = new Command("StartWork", true);

        cmd.AddParameter("IdCustomer", form.IdCustomer);
        cmd.AddParameter("IdEmployee", form.IdEmployee);
        int retour;
        try
        {
           retour =  (int)cnx.ExecuteScalar(cmd);
           return retour;
        }
        catch(Exception ex)
        {
            return 0;
        }
        
        
    }
    public bool EndWork(int IdStart)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("EndWork", true);

            cmd.AddParameter("IdStart", IdStart);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
        
    }
}

