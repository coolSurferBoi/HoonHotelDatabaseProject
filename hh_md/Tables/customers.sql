CREATE TABLE [hh_md].[customers] (
    [customer_id] INT           IDENTITY (1, 1) NOT NULL,
    [first_name]  VARCHAR (100) NOT NULL,
    [last_name]   VARCHAR (100) NOT NULL,
    [nationality] VARCHAR (100) NOT NULL,
    [email]       VARCHAR (255) NULL,
    [phone]       VARCHAR (50)  NULL,
    [created_at]  DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED ([customer_id] ASC)
);


GO

