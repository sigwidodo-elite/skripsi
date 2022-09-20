using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SKRIPSI_PROJECT.Models
{
    public class Helper
    {
        public tn_u_login user { get; set; }
        public List<m_area> listArea { get; set; }
        public List<m_manufacture> listManufacture { get; set; }
        public List<m_material> listDE { get; set; }
        public List<m_material> listNDE { get; set; }
        public List<m_material> listWiring { get; set; }
        public List<tn_m_dropdown> listTagNo { get; set; }
        public List<tn_m_dropdown> listCapacity { get; set; }
        public List<tn_m_dropdown> listFrame { get; set; }
        public List<tn_m_dropdown> listVolt { get; set; }
        public List<tn_m_dropdown> listRPM { get; set; }
        public List<tn_m_dropdown> listFLA { get; set; }
    }
}