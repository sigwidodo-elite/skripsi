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
            List<tn_u_login> listUser = new List<tn_u_login>();

            try
            {
                _conn = new db_conn();
                listUser = _conn.tn_u_login.ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return listUser;
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
                _conn = new db_conn();
                uLogin.u_password = Encryption.Encrypt(uLogin.u_name, uLogin.u_password);
                uLogin.created_date = DateTime.Now;
                _conn.tn_u_login.Add(uLogin);
                _conn.SaveChanges();
            }
            catch (SqlException ex)
            {
                return false;
            }

            return true;
        }

        public bool DeleteUser(int? id)
        {

            try
            {

                _conn = new db_conn();
                tn_u_login eth = _conn.tn_u_login.Single(m => m.u_id == id);
                _conn.tn_u_login.Remove(eth);
                _conn.SaveChanges();

            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                return false;
                throw;

            }

            return true;

        }
    }
}
