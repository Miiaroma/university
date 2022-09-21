using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using System;
using university.Models;

namespace university.Controllers

{
    [Route("api/[controller]")]
    public class DepartmentController : ControllerBase
    {
        public DepartmentController(Database db)
        {
            Db = db;
        }

        // GET api/Department
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            await Db.Connection.OpenAsync();
            var query = new Department(Db);
            var result = await query.GetAllAsync();
            return new OkObjectResult(result);
        }

        // GET api/Department/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetOne(int id)
        {
            await Db.Connection.OpenAsync();
            var query = new Department(Db);
            var result = await query.FindOneAsync(id);
            if (result is null) return new NotFoundResult();
            return new OkObjectResult(result);
        }

        // POST api/Department
        [HttpPost]
        public async Task<IActionResult> Post([FromBody]Department body)
        {
            await Db.Connection.OpenAsync();
            body.Db = Db;
            int result=await body.InsertAsync();
            return new OkObjectResult(result);           
        }

        // PUT api/Department/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOne(int id, [FromBody]Department body)
        {
            await Db.Connection.OpenAsync();
            var query = new Department(Db);
            var result = await query.FindOneAsync(id);
            if (result is null) return new NotFoundResult();
            result.name = body.name;            
            await result.UpdateAsync();
            return new OkObjectResult(result);
        }

        // DELETE api/Department/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOne(int id)
        {
            await Db.Connection.OpenAsync();
            var query = new Department(Db);
            var result = await query.FindOneAsync(id);
            if (result is null)return new NotFoundResult();
            await result.DeleteAsync();
            return new OkObjectResult(result);
        }

        public Database Db { get; }
    }
}