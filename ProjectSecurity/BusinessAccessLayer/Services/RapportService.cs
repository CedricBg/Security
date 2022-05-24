using BusinessAccessLayer.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services
{
    public class RapportService : IRapportService
    {
        public string PostRapport(string rapport)
        {
            string fileName = @".\Fichier\fichier.txt";
            try
            {
                if (File.Exists(fileName))
                {
                    File.Delete(fileName);
                }

                using (FileStream fileStr = File.Create(fileName))
                {
                    Byte[] text = new UTF8Encoding().GetBytes(rapport);
                    fileStr.Write(text, 0, text.Length);
                }

                using (StreamReader sr = File.OpenText(fileName))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
            return rapport;

        }
    }
}
