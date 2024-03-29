﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BookStore.Models
{
    public class Order
    {
        public int OrderId { get; set; }

        [Required(ErrorMessage="Введите свое имя")]
        public string Name { get; set; }

        [Required(ErrorMessage="Вы должны адрес доставки")]
        public string Line1 { get; set; }

        [Required(ErrorMessage="Укажите ваш город")]
        public string City { get; set; }
        public bool Dispatched { get; set; }
        public virtual List<OrderLine> OrderLines { get; set; }
    }

    public class OrderLine
    {
        public int OrderLineId { get; set; }
        public Order Order { get; set; }
        public Book Book { get; set; }
        public int Quantity { get; set; }
    }
}