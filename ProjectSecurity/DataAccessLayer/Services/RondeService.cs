using AdoToolbox;
using DataAccessLayer.Models;
using DataAccessLayer.Models.Ronde;
using DataAccessLayer.Tools;
using DataAccessLayer.Repository;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Services;

public class RondeService : IRondeService
{
    private readonly string _connectionString;

    public RondeService(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("ConnectionString");
    }

    public bool AddRonde(AddRonde form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("CreateRonde", true);
            cmd.AddParameter("NameRonde", form.NameRonde);
            cmd.AddParameter("IdCustomer", form.IdCustomer);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
        
    }
    public bool AddRfid(AddRfid form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("RfidRondes", true);

            cmd.AddParameter("RfidNumber", form.RfidNumber);
            cmd.AddParameter("IdCustomer", form.IdCustomer);
            cmd.AddParameter("Location", form.Location);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        } 
    }

    public bool AddRfidToRonde(RfidToRonde form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("AddPassage", true);

            cmd.AddParameter("IdRfid", form.IdRfid);
            cmd.AddParameter("IdRonde", form.IdRondes);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }
    public IEnumerable<GetRonde> GetRonde(int Id)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("GetRonde", true);
            cmd.AddParameter("IdCustomer", Id);

            return cnx.ExecuteReader(cmd, c => c.GetRonde());
        }
        catch (Exception)
        {
            return null;
        }
    }

    public int StartRonde(Start form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("StartRonde", true);
            cmd.AddParameter("idRonde", form.IdRonde);
            cmd.AddParameter("IdEmployee", form.IdEmployee);
            return (int)cnx.ExecuteScalar(cmd);
        }
        catch (Exception)
        {
            return 0;
        }
    }
    public bool EndRonde(int Id)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("EndRonde", true);
            cmd.AddParameter("IdTime", Id);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool CheckPastille(CheckPastille form)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("AddSelectToRonde", true);
            cmd.AddParameter("RfidNr", form.RfidNbr);
            cmd.AddParameter("IdTimeRonde", form.IdTimeRomnde);

            return cnx.ExecuteNonQuery(cmd) == 1;
        }
        catch (Exception)
        {
            return false;
        }
    }

    public IEnumerable<RondeFinish> RondeFinishByCustomer(int Id)
    {
        try
        {
            Connection cnx = new Connection(_connectionString);
            Command cmd = new Command("GetRondeFinish", true);
            cmd.AddParameter("@Id", Id);

            return cnx.ExecuteReader(cmd,c=>c.RondeFinie());
        }
        catch (Exception)
        {
            return null;
        }
    }
}