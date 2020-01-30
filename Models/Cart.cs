using System.Collections.Generic;
using System.Linq;

namespace BookStore.Models
{
    public class Cart
    {
        private List<CartLine> lineCollection = new List<CartLine>();

        public void AddItem(Book game, int quantity)
        {
            CartLine line = lineCollection
                .Where(p => p.Book.BookId == game.BookId)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new CartLine
                {
                    Book = game,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
            }
        }

        public void RemoveLine(Book game)
        {
            lineCollection.RemoveAll(l => l.Book.BookId == game.BookId);
        }

        public decimal ComputeTotalValue()
        {
            return lineCollection.Sum(e => e.Book.Price * e.Quantity);

        }
        public void Clear()
        {
            lineCollection.Clear();
        }

        public IEnumerable<CartLine> Lines
        {
            get { return lineCollection; }
        }
    }

    public class CartLine
    {
        public Book Book { get; set; }
        public int Quantity { get; set; }
    }
}