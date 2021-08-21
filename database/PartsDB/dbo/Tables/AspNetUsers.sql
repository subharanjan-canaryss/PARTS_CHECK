CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (128) NOT NULL,
    [Name]                 NVARCHAR (MAX) NULL,
    [Email]                NVARCHAR (256) NULL,
    [EmailConfirmed]       BIT            NOT NULL,
    [PasswordHash]         NVARCHAR (MAX) NULL,
    [SecurityStamp]        NVARCHAR (MAX) NULL,
    [PhoneNumber]          NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT            NOT NULL,
    [TwoFactorEnabled]     BIT            NOT NULL,
    [LockoutEndDateUtc]    DATETIME       NULL,
    [LockoutEnabled]       BIT            NOT NULL,
    [AccessFailedCount]    INT            NOT NULL,
    [UserName]             NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
ADD SENSITIVITY CLASSIFICATION TO
    [dbo].[AspNetUsers].[Email]
    WITH (LABEL = 'Confidential', INFORMATION_TYPE = 'Contact Info');


GO
ADD SENSITIVITY CLASSIFICATION TO
    [dbo].[AspNetUsers].[PasswordHash]
    WITH (LABEL = 'Confidential', INFORMATION_TYPE = 'Credentials');


GO
ADD SENSITIVITY CLASSIFICATION TO
    [dbo].[AspNetUsers].[SecurityStamp]
    WITH (LABEL = 'Confidential', INFORMATION_TYPE = 'Other');


GO
ADD SENSITIVITY CLASSIFICATION TO
    [dbo].[AspNetUsers].[PhoneNumber]
    WITH (LABEL = 'Confidential', INFORMATION_TYPE = 'Contact Info');


GO
ADD SENSITIVITY CLASSIFICATION TO
    [dbo].[AspNetUsers].[UserName]
    WITH (LABEL = 'Confidential', INFORMATION_TYPE = 'Credentials');


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUsers]([UserName] ASC);

