using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeePayrollSQL
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to payroll service");
            EmployeeRepo repo = new EmployeeRepo();
            try
            {
                Console.WriteLine("Choose option or press 0 for exit\n1:Retrieve Data\n2:Add Data\n");
                int option = Convert.ToInt32(Console.ReadLine());
                switch (option)
                {
                    case 0:
                        Environment.Exit(0);
                        break;
                    case 1:
                        repo.GetAllEmployees();
                        break;
                    case 2:
                        EmployeeModel model = new EmployeeModel

                        {
                            Name = "Sahil",
                            Startdate = DateTime.Now,
                            Gender = 'M',
                            Phone = 9922043567,
                            Department = "Civil",
                            Address = "Raipur",
                            Basic_Pay = 60000.00,
                            Deductions = 2000.00,
                            Taxable_Pay = 30000.00,
                            Income_Tax = 2000.00,
                            Net_Pay = 30000,
                        };
                        repo.AddEmployee(model);
                        break;
                }
                Console.ReadLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

    }
}
