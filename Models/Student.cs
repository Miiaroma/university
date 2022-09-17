namespace University.Models
{
    public class Student
    {
         public Student(){}
        public Student(int id, string fn, string ln){
            this.Id=id;
            this.Fname=fn;
            this.Lname=ln;
        }
        public int Id { get; set; }
         public string Fname { get; set; }
        public string  Lname { get; set; }

        public string GetAllStudents() {
            string result="";
       List<Student> studentCollection = new List<Student>();
            List<Student> studentsCollection=new List<Student>();
            studentsCollection.Add( new Student(1,"Jim","Jones"));
            studentsCollection.Add( new Student(2,"Lisa","Smith"));
            studentsCollection.Add( new Student(3,"Ann","Smith"));
            
            foreach(Student stu in studentCollection){
               result+=stu.Id+" "+stu.Fname+" "+stu.Lname+"\n";
            }
            Console.WriteLine(result);
            return result;
    }
    public string GetOneStudent(int id){
                List<Student> studentsCollection=new List<Student>();
            studentsCollection.Add( new Student(1,"Jim","Jones"));
            studentsCollection.Add( new Student(2,"Lisa","Smith"));
            studentsCollection.Add( new Student(3,"Ann","Smith"));

             var selectedStudent = (from student in studentsCollection
            where student.Id.Equals(id)
            select student).SingleOrDefault();
            if(selectedStudent == null) {
                return "No student with that ID is present in the database.";
            } else {
                return selectedStudent.Fname + " " + selectedStudent.Lname;
            }            
    }
    }
}