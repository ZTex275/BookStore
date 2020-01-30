using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace BookStore.Models.Repository
{
    public class Repository
    {
        private EFDbContext context = new EFDbContext();

        public IEnumerable<Book> Books
        {
            get { return context.Books; }
        }

        public IEnumerable<Order> Orders
        {
            get
            {
                return context.Orders
                    .Include(o => o.OrderLines.Select(ol => ol.Book));
            }
        }

        public void SaveBook(Book game)
        {
            if (game.BookId == 0)
            {
                game = context.Books.Add(game);
            }
            else
            {
                Book dbBook = context.Books.Find(game.BookId);
                if (dbBook != null)
                {
                    dbBook.NameBook = game.NameBook;
                    dbBook.Author = game.Author;
                    dbBook.Price = game.Price;
                    dbBook.Category = game.Category;
                }
            }
            context.SaveChanges();
        }

        public void DeleteBook(Book game)
        {
            IEnumerable<Order> orders = context.Orders
                .Include(o => o.OrderLines.Select(ol => ol.Book))
                .Where(o => o.OrderLines
                    .Count(ol => ol.Book.BookId == game.BookId) > 0)
                .ToArray();

            foreach (Order order in orders)
            {
                context.Orders.Remove(order);
            }
            context.Books.Remove(game);
            context.SaveChanges();
        }

        public void SaveOrder(Order order)
        {
            if (order.OrderId == 0)
            {
                order = context.Orders.Add(order);

                foreach (OrderLine line in order.OrderLines)
                {
                    context.Entry(line.Book).State
                        = EntityState.Modified;
                }

            }
            else
            {
                Order dbOrder = context.Orders.Find(order.OrderId);
                if (dbOrder != null)
                {
                    dbOrder.Book = order.Book;
                    dbOrder.Line1 = order.Line1;
                    dbOrder.Line2 = order.Line2;
                    dbOrder.Line3 = order.Line3;
                    dbOrder.City = order.City;
                    dbOrder.GiftWrap = order.GiftWrap;
                    dbOrder.Dispatched = order.Dispatched;
                }
            }
            context.SaveChanges();
        }
    }
}