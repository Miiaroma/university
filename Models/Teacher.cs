using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Threading.Tasks;
using MySqlConnector;



namespace university.Models
{
    public class Teacher
    {
        
       public int idteacher { get; set; }
       public int iddepartment { get; set; }       

        
        internal Database Db { get; set; } 


        public Teacher()
        {
            }

    
    internal Teacher(Database db)
        {
            Db = db;
        }

 public async Task<List<Teacher>> GetAllAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT * FROM  teacher ;";
            return await ReturnAllAsync(await cmd.ExecuteReaderAsync());            
        }

        public async Task<Teacher> FindOneAsync(int teacher)
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT * FROM  teacherk  WHERE  idteacher  = @idteacher";
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@idteacher",
                DbType = DbType.Int32,
                Value = idteacher,
            });
            var result = await ReturnAllAsync(await cmd.ExecuteReaderAsync());
            return result.Count > 0 ? result[0] : null;
        }


        public async Task<int> InsertAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"INSERT INTO  teacher  ( idteacher, iddepartment) VALUES (@idteaher, @iddepartment);";
            BindParams(cmd);
            try
            {
                await cmd.ExecuteNonQueryAsync();
                int id_user = (int) cmd.LastInsertedId;
                return id_user; 
            }
            catch (System.Exception)
            {   
                return 0;
            } 
        }

        public async Task UpdateAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"UPDATE  teacher  SET  name  = @name,  author  = @author,  isbn  = @isbn WHERE  id_book  = @id_book;";
            BindParams(cmd);
            BindId(cmd);
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task DeleteAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"DELETE FROM  teacher  WHERE  idteacher  = @idteacher;";
            BindId(cmd);
            await cmd.ExecuteNonQueryAsync();
        }

        private async Task<List<Teacher>> ReturnAllAsync(DbDataReader reader)
        {
            var posts = new List<Teacher>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var post = new Teacher(Db)
                    {
                        idteacher = reader.GetInt32(0),
                        iddepartment = reader.GetInt32(0)
                    };
                    posts.Add(post);
                }
            }
            return posts;
        }

        private void BindId(MySqlCommand cmd)
        {
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@idteacher",
                DbType = DbType.Int32,
                Value = idteacher,
            });
        }

        private void BindParams(MySqlCommand cmd)
        {
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@iddepartment",
                DbType = DbType.String,
                Value = iddepartment,
            });            
        }
    }     
}