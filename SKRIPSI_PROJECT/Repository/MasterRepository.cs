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
        
        public List<m_area> GetlistArea()
        {

            List<m_area> listArea = new List<m_area>();

            try
            {
                _conn = new db_conn();
                listArea = _conn.m_area.ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return listArea;
        }

        public m_area GetDetailArea(int? id)
        {

            m_area area = new m_area();

            try
            {

                _conn = new db_conn();
                area = _conn.m_area.Single(m => m.area_id == id);
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return area;

        }

        public bool SaveArea(m_area area)
        {

            try
            {

                _conn = new db_conn();
                if (area.area_id == 0)
                {
                    area.created_date = DateTime.Now;
                    _conn.m_area.Add(area);
                    _conn.SaveChanges();
                }
                else {
                    m_area ar = _conn.m_area.Single(m => m.area_id == area.area_id);
                    _conn.m_area.Attach(ar);
                    ar.area_name = area.area_name;
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
                m_area eth = _conn.m_area.Single(m => m.area_id == id);
                _conn.m_area.Remove(eth);
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

        public List<m_manufacture> GetListManufacture()
        {

            List<m_manufacture> listManu = new List<m_manufacture>();
            try
            {
                _conn = new db_conn();
                listManu = _conn.m_manufacture.ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return listManu;
        }

        public m_manufacture GetDetailManufacture(int? id)
        {

            m_manufacture manu = new m_manufacture();

            try
            {

                _conn = new db_conn();
                manu = _conn.m_manufacture.Single(m => m.manufacture_id == id);
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return manu;

        }

        public bool SaveManufacture(m_manufacture manu)
        {

            try
            {
                _conn = new db_conn();
                if (manu.manufacture_id == 0)
                {
                    manu.created_date = DateTime.Now;
                    _conn.m_manufacture.Add(manu);
                    _conn.SaveChanges();
                }
                else
                {
                    m_manufacture man = _conn.m_manufacture.Single(m => m.manufacture_id == manu.manufacture_id);
                    _conn.m_manufacture.Attach(man);
                    man.manufacture_name = manu.manufacture_name;
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
                m_manufacture eth = _conn.m_manufacture.Single(m => m.manufacture_id == id);
                _conn.m_manufacture.Remove(eth);
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

        public List<m_material> GetListMaterial()
        {

            List<m_material> list = new List<m_material>();

            try
            {

                _conn = new db_conn();
                list = _conn.m_material.ToList();
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return list;

        }

        public m_material GetDetailMaterial(int? id)
        {

            m_material manu = new m_material();

            try
            {

                _conn = new db_conn();
                manu = _conn.m_material.Single(m => m.material_id == id);
            }
            catch (SqlException e)
            {

                Console.WriteLine(e);
                throw;

            }

            return manu;

        }

        public bool SaveMaterial(m_material materi)
        {

            try
            {
                _conn = new db_conn();
                if (materi.material_id == 0)
                {
                    materi.created_date = DateTime.Now;
                    _conn.m_material.Add(materi);
                    _conn.SaveChanges();
                }
                else
                {
                    m_material mat = _conn.m_material.Single(m => m.material_id == materi.material_id);
                    _conn.m_material.Attach(mat);
                    mat.material_value = materi.material_value;
                    mat.material_type = materi.material_type;
                    mat.material_ing = materi.material_ing;
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
                m_material eth = _conn.m_material.Single(m => m.material_id == id);
                _conn.m_material.Remove(eth);
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

        public List<m_material> GetListWiring()
        {

            List<m_material> list = new List<m_material>();
            try
            {
                _conn = new db_conn();
                list = _conn.m_material.Where(m => m.material_ing == "WIRING").ToList();
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

        public List<m_material> GetListDE()
        {

            List<m_material> list = new List<m_material>();
            try
            {
                _conn = new db_conn();
                list = _conn.m_material.Where(m => m.material_ing == "BEARING" && m.material_type == "DE").ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public List<m_material> GetListNDE()
        {

            List<m_material> list = new List<m_material>();
            try
            {
                _conn = new db_conn();
                list = _conn.m_material.Where(m => m.material_ing == "BEARING" && m.material_type == "NDE").ToList();
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
        public bool SaveEquipment(tn_m_equipment equipment)
        {

            try
            {
                _conn = new db_conn();
                if (equipment.m_equip_id == 0)
                {
                    equipment.created_date = DateTime.Now;
                    _conn.tn_m_equipment.Add(equipment);
                    _conn.SaveChanges();
                }
                else
                {
                    tn_m_equipment eq = _conn.tn_m_equipment.Single(m => m.m_equip_id == equipment.m_equip_id);
                    _conn.tn_m_equipment.Attach(eq);
                    eq.m_area = equipment.m_area;
                    eq.m_bearing_de = equipment.m_bearing_de;
                    eq.m_bearing_nde = equipment.m_bearing_nde;
                    eq.m_capacity = equipment.m_capacity;
                    eq.m_fla = equipment.m_fla;
                    eq.m_frame = equipment.m_frame;
                    eq.m_manufacture = equipment.m_manufacture;
                    eq.m_rpm = equipment.m_rpm;
                    eq.m_tag_no = equipment.m_tag_no;
                    eq.m_volt = equipment.m_volt;
                    eq.m_wiring_de = equipment.m_wiring_de;
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
    }
}