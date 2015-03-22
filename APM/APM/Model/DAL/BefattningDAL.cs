using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace APM.Model.DAL
{
    public class BefattningDAL : DALBase
    {

         //----------------------------------------------- Hämtar ut alla kategorierna ----------------------------------------------
        public IEnumerable<Befattning> GetallaBefattning()
        {
            // Skapar och initierar ett anslutningsobjekt.
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    //List objekt, plats för 100 ref
                    var Befattnings = new List<Befattning>(100);

                    // exekveras specifierad lagrad procedur.
                    var cmd = new SqlCommand("appSchema.usp_AllaBefattningstyp", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Öppnar anslutningen, databasen
                    conn.Open();

                    //skapar ett SqlDataReader-objekt och returnerar en referens till objektet.
                    using (var reader = cmd.ExecuteReader())
                    {
                        //Tar reda på vilket index de olika kolumnerna har.
                        var BefattningIDIndex = reader.GetOrdinal("BefattningID");
                        var BefattningsTypIndex = reader.GetOrdinal("BefattningsTyp");

                        //Så länge set finns poster kvar. Annars false
                        while (reader.Read())
                        {
                            Befattnings.Add(new Befattning
                            {
                                //Hämtar ut column innehållet med namn egenskaper
                                BefattningID = reader.GetInt32(BefattningIDIndex ),
                                Befattningstyp = reader.GetString(BefattningsTypIndex)
                            });
                        }
                    }

                    //Tar bort det minne som inte används
                    Befattnings.TrimExcess();

                    //Returnerar ett list obj med ref kategori obj
                    return Befattnings;
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel i hämtningen från databasen!");
                }
            }
        }

    }

}