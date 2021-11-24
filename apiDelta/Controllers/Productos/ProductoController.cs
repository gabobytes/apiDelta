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

namespace apiDelta.Controllers.Productos
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        //Dependency Injection
        private readonly IConfiguration _configuration;
        
        
        DataTable table = new DataTable();
        MySqlDataReader myReader;

        public ProductoController(IConfiguration configuration)
        {
            _configuration = configuration;
        }



        //get all data from products table
        [HttpGet]
        public JsonResult Get()
        {
            string query = " SELECT idproducto, producto FROM productos";           
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


        [HttpPost]
        public JsonResult Post(Producto prod)
        {
            string query = @"INSERT INTO productos (producto) VALUES(@producto); ";

            string sqlDataSource = _configuration.GetConnectionString("DeltaAppCon");           

            using (MySqlConnection myCon = new MySqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (MySqlCommand myCommand = new MySqlCommand(query, myCon))
                {
                    myCommand.Parameters.AddWithValue("@producto", prod.producto);
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                }
                myCon.Close();

            }

            return new JsonResult("Producto registrado");
        }


    }
}
