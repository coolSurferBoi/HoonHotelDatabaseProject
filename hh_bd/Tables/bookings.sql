CREATE TABLE [hh_bd].[bookings] (
    [booking_id]     INT           IDENTITY (1, 1) NOT NULL,
    [customer_id]    INT           NOT NULL,
    [level_number]   INT           NOT NULL,
    [room_number]    INT           NOT NULL,
    [booking_status] VARCHAR (20)  NOT NULL,
    [check_in_date]  DATE          NOT NULL,
    [check_out_date] DATE          NOT NULL,
    [created_at]     DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL,
    [updated_at]     DATETIME2 (7) NULL,
    CONSTRAINT [PK_bookings] PRIMARY KEY CLUSTERED ([booking_id] ASC),
    CONSTRAINT [CK_bookings_dates] CHECK ([check_out_date]>[check_in_date]),
    CONSTRAINT [CK_bookings_status] CHECK ([booking_status]='NO_SHOW' OR [booking_status]='CANCELLED' OR [booking_status]='CHECKED_OUT' OR [booking_status]='CHECKED_IN' OR [booking_status]='CONFIRMED'),
    CONSTRAINT [FK_bookings_customer] FOREIGN KEY ([customer_id]) REFERENCES [hh_md].[customers] ([customer_id]),
    CONSTRAINT [FK_bookings_rooms] FOREIGN KEY ([level_number], [room_number]) REFERENCES [hh_md].[rooms] ([level_number], [room_number])
);


GO

