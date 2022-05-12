using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeePayrollSQL
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to payroll service");
            EmployeeRepo repo = new EmployeeRepo();
            repo.GetAllEmployees();
            Console.ReadLine();
        }
    }
}
