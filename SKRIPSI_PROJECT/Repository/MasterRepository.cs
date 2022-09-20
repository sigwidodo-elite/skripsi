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

        public List<V_Equipments> GetListEquipment()
        {

            List<V_Equipments> list = new List<V_Equipments>();
            try
            {
                _conn = new db_conn();
                list = _conn.V_Equipments.ToList();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e);
                throw;
            }

            return list;
        }

        public V_Equipments GetDetailEquipment(int? id)
        {
            _conn = new db_conn();
            V_Equipments equip = _conn.V_Equipments.FirstOrDefault(m => m.equipment_id == id);
            return equip;
        }

        public List<equipment_repairment> GetListEquipmentRepairment(int? id)
        {
            _conn = new db_conn();
            List<equipment_repairment> listRepairment = _conn.equipment_repairment.Where(m => m.equipment_id == id).ToList();
            return listRepairment;
        }

        public bool SaveEquipment(m_equipment equipment)
        {

            try
            {
                _conn = new db_conn();
                if (equipment.equipment_id == 0)
                {
                    equipment.created_date = DateTime.Now;
                    equipment.schedule_service = DateTime.Now.AddYears(5);
                    _conn.m_equipment.Add(equipment);
                    _conn.SaveChanges();
                }
                else
                {
                    m_equipment eq = _conn.m_equipment.Single(m => m.equipment_id == equipment.equipment_id);
                    _conn.m_equipment.Attach(eq);
                    eq.area_id = equipment.area_id;
                    eq.bearing_de = equipment.bearing_de;
                    eq.bearing_nde = equipment.bearing_nde;
                    eq.capacity = equipment.capacity;
                    eq.fla = equipment.fla;
                    eq.frame = equipment.frame;
                    eq.manufacture_id = equipment.manufacture_id;
                    eq.rpm = equipment.rpm;
                    eq.tag_no = equipment.tag_no;
                    eq.volt = equipment.volt;
                    eq.wiring_diameter = equipment.wiring_diameter;
                    
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

        public bool SaveEquipmentRepair(equipment_repairment repairment) 
        {

            try
            {

                _conn = new db_conn();
                _conn.sp_insert_repairment(repairment.equip_history_id, repairment.equipment_id, repairment.start_date, repairment.status, repairment.created_by);

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