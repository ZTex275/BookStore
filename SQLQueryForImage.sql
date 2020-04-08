INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData, ImageMimeType) 
SELECT 1, N'Ведьмак', N'Анджей Сапковский', N'Боевое фэнтези', '1390.00', BulkColumn, null
FROM Openrowset( Bulk 'C:\BookStore\Images\Witcher.jpg', Single_Blob) as Picture

--SET IDENTITY_INSERT Books ON
 
 delete Books where BookID = 3


 INSERT INTO Books (BookID, NameBook, Author, Category, Price, ImageData, ImageMimeType) 
SELECT 2, 'CLR VIA C#', N'Джеффри Рихтер', N'Программирование', 1792.00, BulkColumn, null
FROM Openrowset( Bulk 'C:\BookStore\Images\Clr.jpg', Single_Blob) as Picture