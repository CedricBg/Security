using BusinessAccessLayer.IRepositories;
using BusinessAccessLayer.Models.Rapport;
using PdfSharpCore.Drawing;
using PdfSharpCore.Fonts;
using PdfSharpCore.Pdf;
using PdfSharpCore.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer.Services;

public class RapportService : IRapportService
{
    public string GetRapport(string RapportName)
    {
        string fileName = @".\Fichier\Rapport\" + RapportName + ".txt";
        try
        {
            string line;
            //Créez une instance de StreamReader pour lire à partir d'un fichier
            using (StreamReader sr = new StreamReader(fileName))
            {
                // Lire les lignes du fichier jusqu'à la et sockée dans une variable
                while ((line = sr.ReadLine()) != null)
                {
                    line += line; 
                }
                return line;
            }
        }
        catch (Exception e)
        {
            return("Le fichier n'a pas pu être lu" + e.Message);
        }
    }

    public bool PutRapport(RapportPut rapport)
    {
        string fileName = @".\Fichier\Rapport\" + rapport.RapportName + ".txt";
        try
        {
            if (File.Exists(fileName))
            {
                using (FileStream fileStr = File.Create(fileName))
                {
                    Byte[] text = new UTF8Encoding().GetBytes(rapport.Text);
                    fileStr.Write(text, 0, text.Length);
                }  
            }
            else
                return false;
        }
        catch (Exception)
        {
            return false;
        }
        return true;
    }


    public string PostRapport(RapportPost rapport)
    {
        System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
        DateOnly local = DateOnly.FromDateTime(DateTime.Now);

        string fileName = @".\Fichier\Rapport\"+rapport.NameCustomer +"_"+ local +".txt";
        try
        {
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }

            using (FileStream fileStr = File.Create(fileName))
            {
                Byte[] text = new UTF8Encoding().GetBytes(rapport.rapport);
                fileStr.Write(text, 0, text.Length);
            }
        }
        catch (Exception e)
        {
            return e.Message;
        }
        return fileName;

    }

    public bool SaveRapport(RapportPut rapport)
    {
        this.PutRapport(rapport);
        string fileName = @".\Fichier\Rapport\";
        try
        {
            GlobalFontSettings.FontResolver = new FontResolver();
            var document = new PdfDocument();
            var page = document.AddPage();
            var gfx = XGraphics.FromPdfPage(page);
            XFont font = new XFont("OpenSans", 20, XFontStyle.Bold);
            gfx.;
            gfx.DrawString(rapport.Text, font, XBrushes.Black, new XRect(20, 20, page.Width, page.Height), XStringFormats.CenterLeft);

            document.Save(//fileName + rapport.RapportName+".pdf");
        }
        catch (Exception)
        {
            return false;
        }
        return true;
    }
}
