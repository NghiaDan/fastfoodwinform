create database db1
use db1

CREATE TABLE [Account] (
  [UserName] nvarchar(100) PRIMARY KEY,
  [DisplayName] nvarchar(100),
  [Password] nvarchar(100),
  [Type] int
)
GO

CREATE TABLE [TableFood] (
  [id] int IDENTITY PRIMARY KEY,
  [name] nvarchar(100),
  [status] nvarchar(100)
)
GO

CREATE TABLE [FoodCategory] (
  [id] int IDENTITY PRIMARY KEY,
  [name] nvarchar(100)
)
GO

CREATE TABLE [Food] (
  [id] int IDENTITY PRIMARY KEY,
  [name] nvarchar(100),
  [idCategory] int,
  [price] float
)
GO

CREATE TABLE [Ingredient] (
  [id] int IDENTITY PRIMARY KEY,
  [name] nvarchar(100),
  [price] float,
  [ExpiryDate] varchar(10),
  [quantity] int
)
GO

CREATE TABLE [Recipe] (
  [id] int IDENTITY PRIMARY KEY,
  [idFood] int,
  [idIngredient] int,
  [quantity] int
)
GO

CREATE TABLE [ImportExport] (
  [id] int IDENTITY PRIMARY KEY,
  [idIngredient] int,
  [DateCheckIn] date,
  [DateCheckOut] date,
  [quantity] int
)
GO

CREATE TABLE [Bill] (
  [id] int IDENTITY PRIMARY KEY,
  [DateCheckIn] date,
  [DateCheckOut] date,
  [idTable] int,
  [status] int,
  [discount] int,
  [totalPrice] float
)
GO

CREATE TABLE [BillInfo] (
  [id] int IDENTITY PRIMARY KEY,
  [idBill] int,
  [idFood] int,
  [count] int
)
GO
--------------------------------------------------------------------------------------
INSERT [dbo].[Account] ([UserName],[DisplayName],[Password],[Type]) VALUES ('nghia', N'Nghĩa Đặng',1,1)
--
INSERT [dbo].[FoodCategory] ([name]) VALUES ( N'Đồ ăn')
INSERT [dbo].[FoodCategory] ([name]) VALUES ( N'Nước uống')
--
INSERT [dbo].[Food] ([name], [idCategory], [price]) VALUES ( N'Gà rán', 1, 35000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Mực chiên xù', 1, 35000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Tôm chiên xù', 1, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Khoai tây chiên', 1, 30000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Khoai lang lắc', 1, 30000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Bánh bông lan trứng muối', 1, 30000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Bánh mì bơ tỏi', 1, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Bánh quy bơ', 1, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Bánh quy socola', 1, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Bánh tart trứng', 1, 40000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Sữa chua dẻo', 1, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Panna Cotta Đào', 2, 35000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Trà đào', 2, 30000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Trà tắc xí muội', 2, 20000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Hồng trà kem phô mai', 2, 35000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'Pepsi', 2, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'CocaCola', 2, 25000)
INSERT [dbo].[Food] ( [name], [idCategory], [price]) VALUES ( N'7Up', 2, 25000)
--
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 1', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ( [name], [status]) VALUES ( N'Bàn 12', N'Trống')
--
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Thịt gà', 114, 2)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES (N'Muối', 14, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột ngọt', 70, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Tiêu', 422, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Ớt bột', 320, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột chiên xù', 115, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột chiên giòn', 100, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Sữa tươi', 37, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Trứng gà', 50, 30)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Mực', 240, 2)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột mì', 26, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Tôm', 200, 2)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Khoai tây', 32, 7)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Đường', 30, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bơ', 405, 90)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Khoai lang', 34, 7)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột năng', 38, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột phô mai', 200, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Chà bông', 450, 30)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột bắp', 36, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bột nở', 101, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Phô mai', 220, 9)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Bánh mì', 171, 3)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Kem tươi', 143, 7)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Kem phô mai', 208, 9)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Tỏi', 130, 7)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Vani', 2400, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Socola', 128, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Sữa chua', 265, 30)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Sữa đặc', 64, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Đào ngâm', 79, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Trà đào túi lọc', 179, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Trà đen túi lọc', 690, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Siro đào', 252, 365)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Nước cốt tắc', 160, 1)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES (N'Xí muội', 150, 120)
INSERT [dbo].[Ingredient] ( [name], [price], [ExpiryDate]) VALUES ( N'Hồng trà', 384, 365)
--
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 1, 250)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 2, 8)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 3, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 4, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 5, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 6, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 7, 50)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 8, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 1, 9, 33)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 2, 10, 125)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 2, 6, 75)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 2, 11, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 2, 9, 33)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 2, 2, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 2, 4, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 3, 12, 100)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 3, 6, 50)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 3, 7, 13)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 3, 11, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 3, 9, 16)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 4, 13, 75)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 4, 7, 38)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 4, 2, 8)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 4, 14, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 4, 15, 1)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 5, 16, 125)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 5, 17, 13)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 5, 7, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 5, 18, 13)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 5, 2, 4)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 19, 13)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 11, 30)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 20, 5)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 21, 1)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 15, 6)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES (6, 22, 8)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES (6, 2, 1)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 14, 30)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 6, 9, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 23, 140)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 24, 30)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 25, 50)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 14, 13)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 26, 5)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 15, 25)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 7, 2, 1)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 8, 15, 30)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 8, 14, 30)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 8, 9, 16)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 8, 27, 1)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 8, 11, 50)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 15, 41)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 14, 40)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 9, 33)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 27, 3)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 11, 75)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 21, 1)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 2, 0)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 9, 28, 38)
INSERT [dbo].[Recipe] ([idFood], [idIngredient], [quantity]) VALUES ( 10, 15, 11)
---------
UPDATE Ingredient SET quantity = 1000;

--------------------------------------------------------------------------------------
ALTER TABLE [Food] ADD FOREIGN KEY ([idCategory]) REFERENCES [FoodCategory] ([id])
GO

ALTER TABLE [Recipe] ADD FOREIGN KEY ([idFood]) REFERENCES [Food] ([id])
GO

ALTER TABLE [Recipe] ADD FOREIGN KEY ([idIngredient]) REFERENCES [Ingredient] ([id])
GO

ALTER TABLE [BillInfo] ADD FOREIGN KEY ([idFood]) REFERENCES [Food] ([id])
GO

ALTER TABLE [BillInfo] ADD FOREIGN KEY ([idBill]) REFERENCES [Bill] ([id])
GO

ALTER TABLE [Bill] ADD FOREIGN KEY ([idTable]) REFERENCES [TableFood] ([id])
GO

ALTER TABLE [ImportExport] ADD FOREIGN KEY ([idIngredient]) REFERENCES [Ingredient] ([id])
GO

----------------------------------
--Lấy dữ liệu danh sách bàn
CREATE PROC USP_GetTableList
AS SELECT * FROM TableFood
------------------------------------
CREATE PROC USP_GetIngredientList
AS SELECT * FROM Ingredient
---------------------------------
CREATE PROC USP_GetRecipeList
AS SELECT * FROM Recipe

-----------------------------------------------------------------------
--cập nhật thông tin
CREATE PROC USP_UpdateAccount
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	END
END

---------------------------------------------
--Login
CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM Account WHERE UserName = @userName AND PassWord = @passWord
END

-----------------------------------------------------------
--Lấy thông tin từ username
CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM Account WHERE UserName = @userName
END

-----------------------------------------------------------
--Lấy số hóa đơn theo ngày
CREATE PROC USP_GetNumBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT COUNT(*)
	FROM Bill AS b,TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END


-------------------------------------------------------------------
--lấy danh sách hóa đơn theo ngày và trang
CREATE PROC USP_GetListBillByDateAndPage
@checkIn date, @checkOut date, @page int
AS 
BEGIN
	DECLARE @pageRows INT = 10
	DECLARE @selectRows INT = @pageRows
	DECLARE @exceptRows INT = (@page - 1) * @pageRows;
	
	WITH BillShow AS( SELECT b.ID, t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM Bill AS b,TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable)
	
	SELECT TOP (@selectRows) * FROM BillShow WHERE id NOT IN (SELECT TOP (@exceptRows) id FROM BillShow)
END
--------------------------------------------------------------------------
--lấy danh sách hóa đơn theo ngày
CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM Bill AS b,TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END
--------------------------------------------------------------------------
create PROC USP_GetNumIngredientByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT COUNT(*)
	FROM ImportExport ie,Ingredient i
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut
	and i.id=ie.idIngredient
END

--------------------------------------------------------------------------
create PROC USP_GetListIngredientByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT i.name as[Tên nguyên liệu],ie.quantity, DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra]
	FROM ImportExport ie,Ingredient i
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut
	and i.id=ie.idIngredient
END
select * from ImportExport
--------------------------------------------------------------------------
create PROC USP_GetListIngredientByDateAndPage
@checkIn date, @checkOut date, @page int
AS 
BEGIN
	DECLARE @pageRows INT = 10
	DECLARE @selectRows INT = @pageRows
	DECLARE @exceptRows INT = (@page - 1) * @pageRows;
	
	WITH Show AS( SELECT ie.id,i.name,ie.quantity, DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra]
	FROM ImportExport ie,Ingredient i
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut
	and i.id=ie.idIngredient)

	select top(@selectRows)* from Show where show.id not in
	( select top (@exceptRows)id from show)
END


--------------------------------------------------------------------------
--Thêm hóa đơn
Create PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT Bill 
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
	          discount
	        )
	VALUES  ( GETDATE() ,
	          NULL , 
	          @idTable ,
	          0,  
	          0
	        )
END

-----------------------------------------------------
--Chuyển bàn
alter PROC USP_SwitchTabel
@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM Bill WHERE idTable = @idTable1 AND status = 0
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT Bill ( DateCheckIn , DateCheckOut ,idTable ,status)
		VALUES  ( GETDATE() , NULL , @idTable1 , 0)
		SELECT @idFirstBill = MAX(id) FROM Bill WHERE idTable = @idTable1 AND status = 0
	END
	SELECT @isFirstTablEmty = COUNT(*) FROM BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT Bill( DateCheckIn ,DateCheckOut ,idTable , status)
		VALUES  ( GETDATE() ,NULL ,@idTable2 , 0  )

		SELECT @idSeconrdBill = MAX(id) FROM Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM BillInfo WHERE idBill = @idSeconrdBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'

	SELECT id INTO IDBillInfoTable FROM BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)

	DROP TABLE IDBillInfoTable

	IF (@isFirstTablEmty = 0)
		UPDATE TableFood SET status = N'Trống' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE TableFood SET status = N'Trống' WHERE id = @idTable1
END
----------------------------------------------------------------
--Thêm thông tin hóa đơn
CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT	BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill,
          @idFood,
          @count 
          )
	END
END

-------------------------------------------------------------------
--Cập nhật thông tin hóa đơn
create trigger UTG_UpdateBillInfo
on BillInfo for insert, update
as
begin 
	declare @idBill int

	select @idBill=idbill from inserted

	declare @idtable int

	select @idtable=idtable from bill where id =@idBill and status=0
	declare @count int 
	select @count=Count(*) from BillInfo where idBill=@idBill
	if(@count>0)
	begin 
		print @idtable
		print @idBill
		print @count 
			update TableFood set status=N'Có người' where id=@idtable
	end
	else
	begin 
		print @idtable
		print @idBill
		print @count 
			update TableFood set status=N'Trống' where id=@idtable
	end
end

-----------------------------
--Cập nhật hóa đơn
create trigger UTG_UpdateBill
on bill for update 
as
begin
	declare @idbill int

	select @idbill=id from inserted

	declare @count int=0

	declare @idtable int

	select @idtable=idtable from bill where id=@idbill

	select @count =count(*) from bill where idtable=@idtable and status=0

	if(@count=0)
		update TableFood set status=N'Trống' where id=@idtable
end

--------------------------------------------
--Xóa thông tin hóa đơn
create trigger UTG_DeleteBillInfo
on BillInfo for delete
as 
begin 
	declare @idbillinfo int
	declare @idbill int
	declare @idtable int	
	select  @idbillinfo =id, @idbill=deleted.idBill from deleted
	select @idtable =idtable from bill where id= @idBill

	declare @count int=0
	select @count=count(*) 
	from billinfo bi ,bill b 
	where b.id=bi.idbill and b.id=@idbill and b.status=0
	if (@count=0) 
		update tablefood set status =N'Trống' where id=@idtable
end
go
---------------------------------------
--Tìm kiếm thức ăn
create function fuConvertToUnsign1 (
	@strInput nvarchar(400))
returns nvarchar(400)
begin
	if @strInput is null return @strInput	
	if @strInput=''return @strInput 
	declare @rt nvarchar(400)
	declare @sign_chars nchar(136) 
	declare @unsign_chars nchar(136) set @sign_chars=N' '+nchar(272)+nchar(208) set @unsign_chars=N''

	declare @counter int 
	declare @counter1 int set @counter=1 while (@counter<=LEN(@strInput)) 
	begin set @counter1=1 while(@counter1<=LEN(@sign_chars)+1)
	begin if UNICODE(SUBSTRING(@sign_chars,@counter1,1))
=Unicode(SUBSTRING(@strInput,@counter,1) )begin if @counter=1 set @strInput=SUBSTRING(@strInput,1,@counter-1)
	+SUBSTRING(@unsign_chars,@counter1,1)
	+SUBSTRING(@strInput,@counter+1,len(@strInput-@counter))
	break end set @counter1=@counter1+1
	end set @counter=@counter+1
	end set @strInput=replace (@strInput,' ','-')
	return @strInput
end
go
------------------------------------------------------------
--Cập nhật số lượng nguyen lieu sau khi khach dat mon
create trigger UTG_AddFood
on BillInfo for insert, update
as
declare @idFood int, @c int, @q int
begin
	select @idFood = idFood, @c = count
	from inserted

	declare @temp table (
		idNguyenLieu int,
		slCanDung int,
		slTonKho int
	)

	insert into @temp
	select idIngredient, r.quantity * @c, i.quantity
	from Recipe r, Ingredient i
	where r.idIngredient = i.id and idFood = @idFood

	if exists (select * from @temp where slCanDung > slTonKho)
	begin
		raiserror('So luong can dung vuot qua so luong ton kho', 16, 1)
		rollback tran
		return
	end
	else
	begin
		update Ingredient
		set quantity = quantity - (select slCanDung from @temp where idNguyenLieu = Ingredient.id)
		where id in (select idNguyenLieu from @temp)
	end
end

-----------------------------------------------------------
--Cập nhật thêm số lượng từ import
create trigger UTG_Import
on ImportExport for insert, update
as
declare @idIngre int, @quantity int
begin
 select @idIngre = idIngredient, @quantity = quantity
 from inserted
 update ImportExport
 set DateCheckIn=GETDATE()
 update ImportExport
 set DateCheckOut=DateCheckIn
 update Ingredient
 set quantity = quantity + @quantity
 where id = @idIngre
end
------------------------------------------
CREATE PROC USP_InsertRecipe
@idFood INT, @idIngredient INT, @quantity INT
AS
Begin
		INSERT	Recipe( idFood, idIngredient, quantity )
		VALUES  ( @idFood,@idIngredient, @quantity)
END

select * from TableFood
create view v_importexport
as(select * from ImportExport)
create view v_food
as (select * from Food)
create view v_TableFood
as( select * from TableFood)
