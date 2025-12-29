CREATE TABLE [hh_bd].[booking_audit] (
    [audit_id]      INT           IDENTITY (1, 1) NOT NULL,
    [booking_id]    INT           NOT NULL,
    [field_name]    VARCHAR (100) NOT NULL,
    [old_value]     VARCHAR (500) NULL,
    [new_value]     VARCHAR (500) NULL,
    [changed_by]    VARCHAR (100) NOT NULL,
    [change_reason] VARCHAR (255) NULL,
    [changed_at]    DATETIME2 (7) DEFAULT (sysutcdatetime()) NOT NULL
);
GO

ALTER TABLE [hh_bd].[booking_audit]
    ADD CONSTRAINT [FK_booking_audit_booking] FOREIGN KEY ([booking_id]) REFERENCES [hh_bd].[bookings] ([booking_id]);
GO

ALTER TABLE [hh_bd].[booking_audit]
    ADD CONSTRAINT [PK_booking_audit] PRIMARY KEY CLUSTERED ([audit_id] ASC);
GO

