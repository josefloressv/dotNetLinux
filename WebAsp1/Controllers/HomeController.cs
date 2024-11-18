using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebAsp1.Models;
using WebAsp1.Models.ViewModel;
using Microsoft.Data.Sqlite;
using Microsoft.Extensions.Configuration;

namespace WebAsp1.Controllers
{
	public class HomeController : Controller
	{
        private readonly IConfiguration _configuration;
		private readonly ILogger<HomeController> _logger;

		public HomeController(IConfiguration configuration, ILogger<HomeController> logger)
        {
            _configuration = configuration;
            _logger = logger;
        }

		public IActionResult Index()
		{
			var todoListViewModel = GetAllTodos();
			return View(todoListViewModel);
		}

		public IActionResult Privacy()
		{
			return View();
		}

		public RedirectResult Insert(TodoViewModel item)
		{
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
			using (SqliteConnection con = new SqliteConnection(connectionString))
			{
				using (var tableCmd = con.CreateCommand())
				{
					con.Open();
					tableCmd.CommandText = $"INSERT INTO Todo (Name) VALUES ('{item.Todo.Name}')";
					tableCmd.ExecuteNonQuery();
				}
			}
			return Redirect("Index");
		}

        public RedirectResult Update(TodoViewModel item)
        {
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
			using (SqliteConnection con = new SqliteConnection(connectionString))
            {
                using (var tableCmd = con.CreateCommand())
                {
                    con.Open();
                    tableCmd.CommandText = $"UPDATE Todo SET Name= '{item.Todo.Name}' WHERE Id='{item.Todo.Id}'";
                    tableCmd.ExecuteNonQuery();
                }
            }
            return Redirect("Index");
        }

        internal TodoViewModel GetAllTodos()
        {
			List<TodoItem> list = new();

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
			using (SqliteConnection con = new SqliteConnection(connectionString))
            {
                using (var tableCmd = con.CreateCommand())
                {
                    con.Open();
                    tableCmd.CommandText = $"SELECT * FROM Todo";

					using (var reader = tableCmd.ExecuteReader()) 
					{
						if (reader.HasRows)
						{
                            while (reader.Read())
                            {
                                list.Add(
                                    new TodoItem
                                    {
                                        Id = (int)reader.GetInt64(0),
                                        Name = reader.GetString(1),
                                    });
                            }
                        }
							return new TodoViewModel
							{
								Items = list
							};
					}
                }
            }
        }

        internal TodoItem GetById(int id)
        {
            TodoItem item = new();

            string connectionString = _configuration.GetConnectionString("DefaultConnection");
			using (SqliteConnection con = new SqliteConnection(connectionString))
            {
                using (var tableCmd = con.CreateCommand())
                {
                    con.Open();
                    tableCmd.CommandText = $"SELECT * FROM Todo WHERE Id = '{id}'";

                    using (var reader = tableCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read();
                            item.Id = (int)reader.GetInt64(0);
                            item.Name = reader.GetString(1);
                        }
                        return item;
                    }
                }
            }
        }

        [HttpPost]
		public JsonResult Delete(int id)
		{
            string connectionString = _configuration.GetConnectionString("DefaultConnection");
			using (SqliteConnection con = new SqliteConnection(connectionString))
            {
                using (var tableCmd = con.CreateCommand())
                {
                    con.Open();
                    tableCmd.CommandText = $"DELETE FROM Todo WHERE Id = '{id}'";
                    tableCmd.ExecuteNonQuery();
                }
            }

			return Json(new { });
        }

		[HttpGet]
		public JsonResult PopulateForm(int id)
		{
			var todo = GetById(id);
			return Json(todo);
		}

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
