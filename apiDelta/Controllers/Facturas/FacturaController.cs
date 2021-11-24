using apiDelta.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace apiDelta.Controllers.Facturas
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacturaController : ControllerBase
    {
        //Dependency Injection
        private readonly IConfiguration _configuration;


        DataTable table = new DataTable();
        MySqlDataReader myReader;

        public FacturaController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        //get all data from products table
        [HttpGet]
        public JsonResult Get()
        {
            string query = @" SELECT numerofactura, fecha, tipodepago, documentocliente, nombrecliente, subtotal,
            descuento, iva, totaldescuento,totalimpuesto,total
            FROM facturas;";
            string sqlDataSource = _configuration.GetConnectionString("DeltaAppCon");

            using (MySqlConnection myCon = new MySqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (MySqlCommand myCommand = new MySqlCommand(query, myCon))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                }
                myCon.Close();

            }

            return new JsonResult(table);

        }


        [HttpGet("{id:int}")]
        public JsonResult Get(int id)
        {
            string query = @" SELECT  f.`nombrecliente`, P.`producto`,f.`total`
            FROM facturas f
            INNER JOIN `facturaproducto` fp on f.`idfactura` = fp.`idfactura`
            INNER JOIN `productos` p on p.`idproducto` = fp.`idproducto`
            WHERE f.`numerofactura`  = @id;";
            string sqlDataSource = _configuration.GetConnectionString("DeltaAppCon");

            using (MySqlConnection myCon = new MySqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (MySqlCommand myCommand = new MySqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@id", id);

                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                }
                myCon.Close();

            }

            return new JsonResult(table);

        }

        [HttpPost]
        public JsonResult Post(Factura fac)
        {
            string query = @"INSERT INTO facturas (numerofactura, fecha, tipodepago,documentocliente,
                            nombrecliente,subtotal,descuento,iva,totaldescuento,totalimpuesto,total) 
                 VALUES(@numerofactura,@fecha,@tipodepago,@documentocliente,
                            @nombrecliente,@subtotal,@descuento,@iva,@totaldescuento,@totalimpuesto,@total); ";

            string sqlDataSource = _configuration.GetConnectionString("DeltaAppCon");

            using (MySqlConnection myCon = new MySqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (MySqlCommand myCommand = new MySqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@numerofactura", fac.numerofactura);
                    myCommand.Parameters.AddWithValue("@fecha", fac.fecha);
                    myCommand.Parameters.AddWithValue("@tipodepago", fac.tipodepago);
                    myCommand.Parameters.AddWithValue("@documentocliente", fac.documentocliente);
                    myCommand.Parameters.AddWithValue("@nombrecliente", fac.nombrecliente);
                    myCommand.Parameters.AddWithValue("@subtotal", fac.subtotal);
                    myCommand.Parameters.AddWithValue("@descuento", fac.descuento);
                    myCommand.Parameters.AddWithValue("@iva", fac.iva);
                    myCommand.Parameters.AddWithValue("@totaldescuento", fac.totaldescuento);
                    myCommand.Parameters.AddWithValue("@totalimpuesto", fac.totalimpuesto);
                    myCommand.Parameters.AddWithValue("@total", fac.total);

                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                }
                myCon.Close();

            }

            return new JsonResult("Factura creada");
        }

        
    }
}
