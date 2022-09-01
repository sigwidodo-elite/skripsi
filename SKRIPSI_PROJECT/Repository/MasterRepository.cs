using SKRIPSI_PROJECT.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SKRIPSI_PROJECT.Repository
{
    public class MasterRepository
    {

        private db_conn _conn = new db_conn();

        
        public List<tn_m_area> GetlistArea()
        {

            List<tn_m_area> listArea = new List<tn_m_area>();

            try
            {

                _conn = new db_conn();
                listArea = _conn.tn_m_area.ToList();
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return listArea;

        }

        public tn_m_area GetDetailArea(int? id)
        {

            tn_m_area area = new tn_m_area();

            try
            {

                _conn = new db_conn();
                area = _conn.tn_m_area.Single(m => m.m_area_id == id);
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return area;

        }

        public bool SaveArea(tn_m_area area)
        {

            try
            {

                _conn = new db_conn();
                if (area.m_area_id == 0)
                {
                    area.created_date = DateTime.Now;
                    _conn.tn_m_area.Add(area);
                    _conn.SaveChanges();
                }
                else {
                    tn_m_area ar = _conn.tn_m_area.Single(m => m.m_area_id == area.m_area_id);
                    _conn.tn_m_area.Attach(ar);
                    ar.m_area_code = area.m_area_code;
                    ar.m_area_name = area.m_area_name;
                    _conn.SaveChanges();
                }

            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                return false;
                throw;

            }

            return true;

        }

        public bool DeleteArea(int? id)
        {

            try
            {

                _conn = new db_conn();
                tn_m_area eth = _conn.tn_m_area.Single(m => m.m_area_id == id);
                _conn.tn_m_area.Remove(eth);
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

        public List<tn_m_manufacture> GetListManufacture()
        {

            List<tn_m_manufacture> listManu = new List<tn_m_manufacture>();

            try
            {

                _conn = new db_conn();
                listManu = _conn.tn_m_manufacture.ToList();
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return listManu;

        }

        public tn_m_manufacture GetDetailManufacture(int? id)
        {

            tn_m_manufacture manu = new tn_m_manufacture();

            try
            {

                _conn = new db_conn();
                manu = _conn.tn_m_manufacture.Single(m => m.m_manu_id == id);
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return manu;

        }

        public bool SaveManufacture(tn_m_manufacture manu)
        {

            try
            {
                _conn = new db_conn();
                if (manu.m_manu_id == 0)
                {
                    manu.created_date = DateTime.Now;
                    _conn.tn_m_manufacture.Add(manu);
                    _conn.SaveChanges();
                }
                else
                {
                    tn_m_manufacture man = _conn.tn_m_manufacture.Single(m => m.m_manu_id == manu.m_manu_id);
                    _conn.tn_m_manufacture.Attach(man);
                    man.m_manu_code = manu.m_manu_code;
                    man.m_manu_name = manu.m_manu_name;
                    _conn.SaveChanges();
                }

            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                return false;
                throw;

            }

            return true;

        }

        public bool DeleteManufacture(int? id)
        {

            try
            {

                _conn = new db_conn();
                tn_m_manufacture eth = _conn.tn_m_manufacture.Single(m => m.m_manu_id == id);
                _conn.tn_m_manufacture.Remove(eth);
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

        public List<tn_m_material> GetListMaterial()
        {

            List<tn_m_material> list = new List<tn_m_material>();

            try
            {

                _conn = new db_conn();
                list = _conn.tn_m_material.ToList();
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return list;

        }

        public tn_m_material GetDetailMaterial(int? id)
        {

            tn_m_material manu = new tn_m_material();

            try
            {

                _conn = new db_conn();
                manu = _conn.tn_m_material.Single(m => m.m_material_id == id);
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return manu;

        }

        public bool SaveMaterial(tn_m_material materi)
        {

            try
            {
                _conn = new db_conn();
                if (materi.m_material_id == 0)
                {
                    materi.created_date = DateTime.Now;
                    _conn.tn_m_material.Add(materi);
                    _conn.SaveChanges();
                }
                else
                {
                    tn_m_material mat = _conn.tn_m_material.Single(m => m.m_material_id == materi.m_material_id);
                    _conn.tn_m_material.Attach(mat);
                    mat.m_material_code = materi.m_material_code;
                    mat.m_material_name = materi.m_material_name;
                    mat.m_material_type = materi.m_material_type;
                    mat.m_substance = materi.m_substance;
                    _conn.SaveChanges();
                }

            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                return false;
                throw;

            }

            return true;

        }

        public bool DeleteMaterial(int? id)
        {

            try
            {

                _conn = new db_conn();
                tn_m_material eth = _conn.tn_m_material.Single(m => m.m_material_id == id);
                _conn.tn_m_material.Remove(eth);
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

        public List<tn_m_dropdown> GetListCapacity() {
            
            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "CAPACITY").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListFLA()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "FLA").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListWiring()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "WIRING").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListRPM()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "RPM").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListVolt()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "VOLT").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListFrame()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "FRAME").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListDE()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "DE").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListNDE()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "NDE").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<tn_m_dropdown> GetListTAG()
        {

            List<tn_m_dropdown> list = new List<tn_m_dropdown>();
            try
            {
                _conn = new db_conn();
                list = _conn.tn_m_dropdown.Where(m => m.md_criteria == "TAGNO").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<V_Equipment> GetListEquipment()
        {

            List<V_Equipment> list = new List<V_Equipment>();
            try
            {
                _conn = new db_conn();
                list = _conn.V_Equipment.ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }
    }
}