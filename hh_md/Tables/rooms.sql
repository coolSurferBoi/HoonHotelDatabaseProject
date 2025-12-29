CREATE TABLE [hh_md].[rooms] (
    [level_number] INT NOT NULL,
    [room_number]  INT NOT NULL,
    [room_code]    INT NOT NULL,
    [is_booked]    BIT DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED ([level_number] ASC, [room_number] ASC),
    CONSTRAINT [CK_rooms_level_range] CHECK ([level_number]>=(1) AND [level_number]<=(4)),
    CONSTRAINT [CK_rooms_room_number_range] CHECK ([room_number]>=(1) AND [room_number]<=(6)),
    CONSTRAINT [FK_rooms_room_type] FOREIGN KEY ([room_code]) REFERENCES [hh_md].[room_types] ([room_code])
);


GO

