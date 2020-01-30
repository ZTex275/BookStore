using System.Web;
using System.Data.Entity;

namespace BookStore.Models.Repository
{
    public class EFDbContext : DbContext
    {
        public EFDbContext()
            : base(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\BookStore\App_Data\BookStore.mdf;Integrated Security=True")
        {  }

        public DbSet<Book> Books { get; set; }
        public DbSet<Order> Orders { get; set; }
    }
}