INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 1, N'Ведьмак', N'Анджей Сапковский', N'Боевое фэнтези', '1390.00', BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\Witcher.jpg', Single_Blob) as Picture


SET IDENTITY_INSERT Books ON
 
delete Books where BookID = 3


INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 2, 'CLR VIA C#', N'Джеффри Рихтер', N'Программирование', 1792.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\Clr.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 3, N'Илон Маск. Tesla, SpaceX и дорога в будущее', N'Эшли Вэнс', N'Мемуары', 590.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\ilon.jpg', Single_Blob) as Picture


INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 4, N'Стив Джобс', N'Уолтер Айзексон', N'Мемуары', 164.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\jobs.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 5, N'Полное собрание произведений о Шерлоке Холмсе в одном томе (сборник)', N'Артур Конан Дойл', N'Детективы', 513.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\Sherlok.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 6, N'Над пропастью во ржи', N'Дж. Д. Сэлинджер', N'Классика', 249.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\vo_rzhi.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 7, N'Война и мир', N'Л. Н. Толстой', N'Классика', 389.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\war_peace.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 8, N'Евгений Онегин', N'А.С.Пушкин', N'Классика', 215.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\onegin.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 9, N'Война миров', N'Г. Уэллс', N'Фантастика', 170.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\warz.jpg', Single_Blob) as Picture

INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData) 
SELECT 10, N'Гарри Поттер. Комплект из 7 книг', N'Роулинг Дж.К.', N'Фантастика', 3545.00, BulkColumn
FROM Openrowset( Bulk 'C:\BookStore\Images\potter.jpg', Single_Blob) as Picture
