
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 03/03/2017 16:51:50
-- Generated from EDMX file: D:\Repository\AlarmOne.Web\WebApplication\WebApplication\EF.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AlarmOne];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ErrorAlarmItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Errors] DROP CONSTRAINT [FK_ErrorAlarmItem];
GO
IF OBJECT_ID(N'[dbo].[FK_ErrorUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Errors] DROP CONSTRAINT [FK_ErrorUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAlarmItem_AlarmItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAlarmItem] DROP CONSTRAINT [FK_UserAlarmItem_AlarmItem];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAlarmItem_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAlarmItem] DROP CONSTRAINT [FK_UserAlarmItem_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AlarmItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AlarmItems];
GO
IF OBJECT_ID(N'[dbo].[Errors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Errors];
GO
IF OBJECT_ID(N'[dbo].[UserAlarmItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAlarmItem];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AlarmItems'
CREATE TABLE [dbo].[AlarmItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Errors'
CREATE TABLE [dbo].[Errors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL,
    [Created] datetime  NOT NULL,
    [Updated] datetime  NOT NULL,
    [UserId] int  NOT NULL,
    [AlarmItem_Id] int  NOT NULL
);
GO

-- Creating table 'UserAlarmItem'
CREATE TABLE [dbo].[UserAlarmItem] (
    [Users_Id] int  NOT NULL,
    [AlarmItems_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AlarmItems'
ALTER TABLE [dbo].[AlarmItems]
ADD CONSTRAINT [PK_AlarmItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Errors'
ALTER TABLE [dbo].[Errors]
ADD CONSTRAINT [PK_Errors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Users_Id], [AlarmItems_Id] in table 'UserAlarmItem'
ALTER TABLE [dbo].[UserAlarmItem]
ADD CONSTRAINT [PK_UserAlarmItem]
    PRIMARY KEY NONCLUSTERED ([Users_Id], [AlarmItems_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Users_Id] in table 'UserAlarmItem'
ALTER TABLE [dbo].[UserAlarmItem]
ADD CONSTRAINT [FK_UserAlarmItem_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AlarmItems_Id] in table 'UserAlarmItem'
ALTER TABLE [dbo].[UserAlarmItem]
ADD CONSTRAINT [FK_UserAlarmItem_AlarmItem]
    FOREIGN KEY ([AlarmItems_Id])
    REFERENCES [dbo].[AlarmItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserAlarmItem_AlarmItem'
CREATE INDEX [IX_FK_UserAlarmItem_AlarmItem]
ON [dbo].[UserAlarmItem]
    ([AlarmItems_Id]);
GO

-- Creating foreign key on [AlarmItem_Id] in table 'Errors'
ALTER TABLE [dbo].[Errors]
ADD CONSTRAINT [FK_ErrorAlarmItem]
    FOREIGN KEY ([AlarmItem_Id])
    REFERENCES [dbo].[AlarmItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ErrorAlarmItem'
CREATE INDEX [IX_FK_ErrorAlarmItem]
ON [dbo].[Errors]
    ([AlarmItem_Id]);
GO

-- Creating foreign key on [UserId] in table 'Errors'
ALTER TABLE [dbo].[Errors]
ADD CONSTRAINT [FK_ErrorUser]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ErrorUser'
CREATE INDEX [IX_FK_ErrorUser]
ON [dbo].[Errors]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------