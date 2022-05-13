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
                Console.WriteLine("Choose option or press 0 for exit\n1:Retrieve Data\n2:Add Data\n3:Update Datas\n4:Delete Employee\n5:Retriew employee with data range");
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
                    case 3:
                        EmployeeModel model1 = new EmployeeModel();
                        Console.WriteLine("Enter id of employee whose data you want to update");
                        model1.Id = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Enter name");
                        model1.Name = Console.ReadLine();
                        Console.WriteLine("Enter new BasicPay");
                        model1.Basic_Pay = Convert.ToDouble(Console.ReadLine());
                        repo.UpdateEmployee(model1);
                        break;
                    case 4:
                        EmployeeModel model2 = new EmployeeModel();
                        Console.WriteLine("Enter id of employee whose data you want to delete");
                        model2.Id = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Enter name");
                        model2.Name = Console.ReadLine();
                        repo.DeleteEmployee(model2);
                        break;
                    case 5:
                        string query = "select * from employee_payroll where StartDate between cast ('2018-01-01' as date) and GETDATE()";
                        repo.GetEmployeesWithDataAdapter(query);
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
               
        

   

