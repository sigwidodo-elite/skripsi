using SKRIPSI_PROJECT.Authentication;
using SKRIPSI_PROJECT.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SKRIPSI_PROJECT.Repository
{
    public class UserRepository 
    {

        private db_conn _conn = new db_conn();

        /* decrypt password */
        public bool DecryptPassword(string encrypt, string password)
        {
            try
            {

                Encryption.Decrypt(encrypt, password);

            }
            catch (Exception e)
            {

                Console.WriteLine(e);
                return false;

            }
            return true;
        }

        public List<tn_u_login> GetUserLogin()
        {
            return _conn.tn_u_login.ToList();
        }

        public tn_u_login GetUsers(string uName)
        {
            tn_u_login user = new tn_u_login();
            try
            {
                user = _conn.tn_u_login.Where(m => m.u_name == uName).FirstOrDefault();
            }
            catch (SqlException ex)
            { 
            
            }

            return user;
        }

        public bool SaveUserLogin(tn_u_login uLogin)
        {
            try
            {

            }
            catch (SqlException ex)
            { 
            
            }
            return true;
        }
    }
}
