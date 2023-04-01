create database BanHang
use BanHang 

CREATE TABLE Account(
	UserName nvarchar (100) primary key,
	DisplayName nvarchar(100) NOT NULL,
	Password nvarchar(1000) NOT NULL,
	Type int NOT NULL
	)
INSERT into Account( UserName, DisplayName, Password, Type) VALUES (N'K9', N'NghiaDang', N'1962026656160185351301320480154111117132155', 1)
INSERT into Account(UserName, DisplayName, Password, Type) VALUES (N'staff', N'staff', N'1962026656160185351301320480154111117132155', 0)
INSERT into Account(UserName, DisplayName, Password, Type) VALUES (N'nghia', N'nghiadang', N'1962026656160185351301320480154111117132155', 1)


CREATE TABLE TableFood(
	id int IDENTITY primary key,
	name nvarchar(100) NOT NULL,
	status nvarchar(100) NOT NULL
	)
INSERT into TableFood ( name, status) VALUES ( N'Bàn 0', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 1', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 2', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 3', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 4', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 5', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 6', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 7', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 8', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 9', N'Trống')
INSERT into TableFood ( name, status) VALUES ( N'Bàn 10', N'Trống')
select * from TableFood

CREATE TABLE FoodCategory(
	id int IDENTITY primary key,
	name nvarchar(100) NOT NULL
)

INSERT into FoodCategory ( name) VALUES (N'Đồ ăn')
INSERT into FoodCategory ( name) VALUES (N'Nước uống')
------------------------------------------------------------

CREATE TABLE Food(
	id int IDENTITY primary key,
	name nvarchar(100) NOT NULL,
	idCategory int NOT NULL,
	price float NOT NULL)

insert into Food(name,idCategory,price) 
values (N'Hamberger Heo Nướng',1,30000),
(N'Gà rán',1,35000),
(N'Gà sốt Mala',1,40000),
(N'Sandwich',1,40000),
(N'Há cảo chiên',1,35000),
(N'Mì ý',1,40000),
(N'Cánh gà rán',1,35000),
(N'Gà viên',1,30000),
(N'Gỏi đu đủ',1,35000),
(N'Khoai tây chiên',1,20000),
(N'Súp cua',1,30000),
(N'Takoyaki',1,59000),
(N'Xôi chiên',1,60000),
(N'Bắp cải trộn',1,10000),
(N'Bánh táo',1,25000),
(N'HotDog',1,15000),
(N'Bánh rán',1,25000),
(N'Gà lắc phô mai',1,45000),
(N'Gà cay phô mai',1,56000),
(N'Sương sáo',2,20000),
(N'Hồng trà',2,25000),
(N'Trà tắc',2,25000),
(N'Trà đào',2,25000),
(N'Coca',2,20000),
(N'Fanta',2,20000),
(N'Latte',2,59000),
(N'Mocha',2,69000),
(N'Bạc sĩu đá',2,39000),
(N'Sinh tố bơ',2,45000),
(N'Sinh tố dâu',2,45000)

----------------------------------------------

CREATE TABLE Bill(
	id int IDENTITY primary key,
	DateCheckIn date NOT NULL,
	DateCheckOut date NULL,
	idTable int NOT NULL,
	status int NOT NULL,
	discount int NULL,
	totalPrice float)

-----------------------------------------------
CREATE TABLE BillInfo(
	id int IDENTITY primary key,
	idBill int NOT NULL,
	idFood int NOT NULL,
	count int NOT NULL)
-----------------------------------------------------------------------

ALTER TABLE Food  WITH CHECK ADD FOREIGN KEY(idCategory)
REFERENCES  FoodCategory(id)


ALTER TABLE Bill  WITH CHECK ADD FOREIGN KEY(idTable)
REFERENCES TableFood (id)



ALTER TABLE BillInfo  WITH CHECK ADD FOREIGN KEY(idBill)
REFERENCES Bill(id)


ALTER TABLE BillInfo  WITH CHECK ADD FOREIGN KEY(idFood)
REFERENCES Food (id)

-----------------------------------------------------------------------
--Lấy dữ liệu danh sách bàn
CREATE PROC USP_GetTableList
AS SELECT * FROM TableFood

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
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0,  -- status - int
	          0
	        )
END

-----------------------------------------------------
--Chuyển bàn
CREATE PROC USP_SwitchTabel
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
		INSERT Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
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
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
	END
END

-------------------------------------------------------------------
--Cập nhật thông tin hóa đơn
Create trigger UTG_UpdateBillInfo
on BillInfo for insert, update
as
begin 
	declare @idBill int

	select @idBill=idbill from inserted

	declare @idtable int

	select @idtable=idtable from bill where id =@idBill and status=0

	update TableFood set status=N'Có người' where id=@idtable
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
delete  BillInfo
delete bill

