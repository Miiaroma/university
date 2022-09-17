using Microsoft.AspNetCore.Mvc;
using University.Models;

namespace University.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class StudentController : ControllerBase
    {
    [HttpGet()]
    public string GetAllStudents() {
        string result="";
            List<Student> studentsCollection=new List<Student>();
            studentsCollection.Add( new Student(1,"Jim","Jones"));
            studentsCollection.Add( new Student(2,"Lisa","Smith"));
            studentsCollection.Add( new Student(3,"Ann","Smith"));

            foreach(Student stu in studentsCollection){
                result+=stu.Id+" "+stu.Fname+" "+stu.Lname+"\n";
            }
            return result;
    }

    [HttpGet("{id}")]
    public string GetOneStudent(int id) {
        Student objStudent = new Student();
        return objStudent.GetOneStudent(id);        
    }

    [HttpPost()]
    public string AddStudent() {
        return "This will add a new student.";
    }

    [HttpPut("{id}")]
    public string UpdateStudent(int id) {
        return "This will update a student which id=" + id;
    }

    [HttpDelete("{id}")]
    public string DeleteStudent(int id) {
        return "This will delete a student which id=" + id;
    }
    }
}