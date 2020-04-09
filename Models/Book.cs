using System;

namespace BookStore.Models
{
    public class Book
    {
        public int BookId { get; set; }
        public string NameBook { get; set; }
        public string Author { get; set; }
        public string Category { get; set; }
        public decimal Price { get; set; }
        public byte[] ImageData { get; set; }
    }
}