using System;
using System.Configuration;
using System.Linq;
using System.Reflection;
using DbUp;
using DbUp.Engine;

namespace Migrations
{
    class Program
    {
        static int Main(string[] args)
        {
            var connectionName = "dissertation";

            var connectionString = Environment.GetEnvironmentVariable($"SQLAZURECONNSTR_{connectionName}");

            if (string.IsNullOrEmpty(connectionString))
            {
                connectionString = args.FirstOrDefault()
                    ?? ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
            }

            Console.WriteLine($"Connection string: {connectionString}");

            DatabaseUpgradeResult result = null;
            try
            {
                var upgrader =
                DeployChanges.To
                    .SqlDatabase(connectionString)
                    .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                    .LogToConsole()
                    .Build();

                result = upgrader.PerformUpgrade();
            }
            catch (Exception)
            {
                Console.WriteLine($"Connection string: {connectionString}");
            }

            if (result == null || !result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result == null ? "result is null" : $"{result.Error}");
                Console.ResetColor();
#if DEBUG
                Console.ReadLine();
#endif
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0;
        }
    }
}
