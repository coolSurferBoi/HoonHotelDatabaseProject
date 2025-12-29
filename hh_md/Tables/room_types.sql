CREATE TABLE [hh_md].[room_types] (
    [room_code]        INT            NOT NULL,
    [name]             VARCHAR (100)  NOT NULL,
    [description]      VARCHAR (1000) NULL,
    [single_bed_count] INT            DEFAULT ((0)) NOT NULL,
    [twin_bed_count]   INT            DEFAULT ((0)) NOT NULL,
    [queen_bed_count]  INT            DEFAULT ((0)) NOT NULL,
    [has_toilet]       BIT            DEFAULT ((1)) NOT NULL,
    [has_shower]       BIT            DEFAULT ((1)) NOT NULL,
    [has_bathtub]      BIT            DEFAULT ((0)) NOT NULL,
    [has_tv]           BIT            DEFAULT ((1)) NOT NULL,
    [tv_type]          VARCHAR (50)   NULL,
    [wifi_type]        VARCHAR (50)   NULL,
    [has_aircon]       BIT            DEFAULT ((1)) NOT NULL,
    [has_minibar]      BIT            DEFAULT ((0)) NOT NULL,
    [has_safe]         BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_room_types] PRIMARY KEY CLUSTERED ([room_code] ASC)
);


GO

