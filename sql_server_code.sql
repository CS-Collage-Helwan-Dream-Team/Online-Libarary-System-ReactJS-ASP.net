CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) NOT NULL,
    PasswordHash NVARCHAR(256) NOT NULL, 
    Email NVARCHAR(100),
    Role NVARCHAR(20) CHECK (Role IN ('Librarian', 'NormalUser')),
    IsApproved BIT DEFAULT 0 
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY,
    Title NVARCHAR(100) NOT NULL,
    Author NVARCHAR(100),
    ISBN NVARCHAR(20) UNIQUE NOT NULL,
    RackNumber NVARCHAR(20) NOT NULL,
    IsAvailable BIT DEFAULT 1 
);

CREATE TABLE BorrowLog (
    LogID INT PRIMARY KEY IDENTITY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    IsReturned BIT DEFAULT 0 
);

CREATE INDEX IDX_Book_ISBN ON Books(ISBN);
CREATE INDEX IDX_Book_RackNumber ON Books(RackNumber);
CREATE INDEX IDX_BorrowLog_UserID ON BorrowLog(UserID);
CREATE INDEX IDX_BorrowLog_BookID ON BorrowLog(BookID);
