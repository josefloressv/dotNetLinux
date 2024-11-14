using WebAsp1.Models;

namespace WebAsp1.Models.ViewModel
{
    public class TodoViewModel
    {
        public List<TodoItem> Items { get; set; }
        public TodoItem Todo { get; set; }
    }
}
