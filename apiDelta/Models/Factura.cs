using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace apiDelta.Models
{
    public class Factura
    {
        public int idfactura { get; set; }
        public int numerofactura { get; set; }
        public string fecha { get; set; }
        public string tipodepago { get; set; }
        public string documentocliente { get; set; }
        public string nombrecliente { get; set; }
        public decimal subtotal { get; set; }
        public int descuento { get; set; }
        public int iva { get; set; }
        public decimal totaldescuento { get; set; }
        public decimal totalimpuesto { get; set; }
        public decimal total { get; set; }


    }
}
