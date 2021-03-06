
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/09/2018 22:53:46
-- Generated from EDMX file: E:\研究生\项目\Glove.IOT\Glove.IOT.Model\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Test];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ActionInfoRoleInfo_ActionInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActionInfoRoleInfo] DROP CONSTRAINT [FK_ActionInfoRoleInfo_ActionInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_ActionInfoRoleInfo_RoleInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActionInfoRoleInfo] DROP CONSTRAINT [FK_ActionInfoRoleInfo_RoleInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_UserInfoR_UserInfo_ActionInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[R_UserInfo_ActionInfo] DROP CONSTRAINT [FK_UserInfoR_UserInfo_ActionInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_ActionInfoR_UserInfo_ActionInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[R_UserInfo_ActionInfo] DROP CONSTRAINT [FK_ActionInfoR_UserInfo_ActionInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_UserInfoR_UserInfo_RoleInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[R_UserInfo_RoleInfo] DROP CONSTRAINT [FK_UserInfoR_UserInfo_RoleInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleInfoR_UserInfo_RoleInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[R_UserInfo_RoleInfo] DROP CONSTRAINT [FK_RoleInfoR_UserInfo_RoleInfo];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserInfo];
GO
IF OBJECT_ID(N'[dbo].[RoleInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleInfo];
GO
IF OBJECT_ID(N'[dbo].[ActionInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActionInfo];
GO
IF OBJECT_ID(N'[dbo].[R_UserInfo_ActionInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[R_UserInfo_ActionInfo];
GO
IF OBJECT_ID(N'[dbo].[R_UserInfo_RoleInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[R_UserInfo_RoleInfo];
GO
IF OBJECT_ID(N'[dbo].[ActionInfoRoleInfo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActionInfoRoleInfo];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserInfo'
CREATE TABLE [dbo].[UserInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UCode] nvarchar(32)  NOT NULL,
    [UName] nvarchar(32)  NULL,
    [Pwd] nvarchar(64)  NOT NULL,
    [StatusFlag] smallint  NOT NULL,
    [Remark] nvarchar(256)  NULL,
    [SubTime] datetime  NOT NULL
);
GO

-- Creating table 'RoleInfo'
CREATE TABLE [dbo].[RoleInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(32)  NOT NULL,
    [StatusFlag] smallint  NOT NULL,
    [Remark] nvarchar(64)  NULL,
    [SubTime] datetime  NOT NULL
);
GO

-- Creating table 'ActionInfo'
CREATE TABLE [dbo].[ActionInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ActionName] nvarchar(max)  NOT NULL,
    [Remark] nvarchar(64)  NULL,
    [Url] nvarchar(512)  NOT NULL,
    [HttpMethd] nvarchar(32)  NULL,
    [IsMenu] bit  NOT NULL,
    [MenuIcon] nvarchar(512)  NULL,
    [Sort] int  NOT NULL,
    [StatusFlag] smallint  NOT NULL,
    [SubTime] datetime  NOT NULL
);
GO

-- Creating table 'R_UserInfo_ActionInfo'
CREATE TABLE [dbo].[R_UserInfo_ActionInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HasPermission] bit  NOT NULL,
    [UserInfoId] int  NOT NULL,
    [ActionInfoId] int  NOT NULL,
    [StatusFlag] smallint  NOT NULL
);
GO

-- Creating table 'R_UserInfo_RoleInfo'
CREATE TABLE [dbo].[R_UserInfo_RoleInfo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserInfoId] int  NOT NULL,
    [RoleInfoId] int  NOT NULL,
    [StatusFlag] smallint  NOT NULL
);
GO

-- Creating table 'ActionInfoRoleInfo'
CREATE TABLE [dbo].[ActionInfoRoleInfo] (
    [ActionInfo_Id] int  NOT NULL,
    [RoleInfo_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserInfo'
ALTER TABLE [dbo].[UserInfo]
ADD CONSTRAINT [PK_UserInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RoleInfo'
ALTER TABLE [dbo].[RoleInfo]
ADD CONSTRAINT [PK_RoleInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ActionInfo'
ALTER TABLE [dbo].[ActionInfo]
ADD CONSTRAINT [PK_ActionInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'R_UserInfo_ActionInfo'
ALTER TABLE [dbo].[R_UserInfo_ActionInfo]
ADD CONSTRAINT [PK_R_UserInfo_ActionInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'R_UserInfo_RoleInfo'
ALTER TABLE [dbo].[R_UserInfo_RoleInfo]
ADD CONSTRAINT [PK_R_UserInfo_RoleInfo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ActionInfo_Id], [RoleInfo_Id] in table 'ActionInfoRoleInfo'
ALTER TABLE [dbo].[ActionInfoRoleInfo]
ADD CONSTRAINT [PK_ActionInfoRoleInfo]
    PRIMARY KEY CLUSTERED ([ActionInfo_Id], [RoleInfo_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ActionInfo_Id] in table 'ActionInfoRoleInfo'
ALTER TABLE [dbo].[ActionInfoRoleInfo]
ADD CONSTRAINT [FK_ActionInfoRoleInfo_ActionInfo]
    FOREIGN KEY ([ActionInfo_Id])
    REFERENCES [dbo].[ActionInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RoleInfo_Id] in table 'ActionInfoRoleInfo'
ALTER TABLE [dbo].[ActionInfoRoleInfo]
ADD CONSTRAINT [FK_ActionInfoRoleInfo_RoleInfo]
    FOREIGN KEY ([RoleInfo_Id])
    REFERENCES [dbo].[RoleInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActionInfoRoleInfo_RoleInfo'
CREATE INDEX [IX_FK_ActionInfoRoleInfo_RoleInfo]
ON [dbo].[ActionInfoRoleInfo]
    ([RoleInfo_Id]);
GO

-- Creating foreign key on [UserInfoId] in table 'R_UserInfo_ActionInfo'
ALTER TABLE [dbo].[R_UserInfo_ActionInfo]
ADD CONSTRAINT [FK_UserInfoR_UserInfo_ActionInfo]
    FOREIGN KEY ([UserInfoId])
    REFERENCES [dbo].[UserInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserInfoR_UserInfo_ActionInfo'
CREATE INDEX [IX_FK_UserInfoR_UserInfo_ActionInfo]
ON [dbo].[R_UserInfo_ActionInfo]
    ([UserInfoId]);
GO

-- Creating foreign key on [ActionInfoId] in table 'R_UserInfo_ActionInfo'
ALTER TABLE [dbo].[R_UserInfo_ActionInfo]
ADD CONSTRAINT [FK_ActionInfoR_UserInfo_ActionInfo]
    FOREIGN KEY ([ActionInfoId])
    REFERENCES [dbo].[ActionInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActionInfoR_UserInfo_ActionInfo'
CREATE INDEX [IX_FK_ActionInfoR_UserInfo_ActionInfo]
ON [dbo].[R_UserInfo_ActionInfo]
    ([ActionInfoId]);
GO

-- Creating foreign key on [UserInfoId] in table 'R_UserInfo_RoleInfo'
ALTER TABLE [dbo].[R_UserInfo_RoleInfo]
ADD CONSTRAINT [FK_UserInfoR_UserInfo_RoleInfo]
    FOREIGN KEY ([UserInfoId])
    REFERENCES [dbo].[UserInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserInfoR_UserInfo_RoleInfo'
CREATE INDEX [IX_FK_UserInfoR_UserInfo_RoleInfo]
ON [dbo].[R_UserInfo_RoleInfo]
    ([UserInfoId]);
GO

-- Creating foreign key on [RoleInfoId] in table 'R_UserInfo_RoleInfo'
ALTER TABLE [dbo].[R_UserInfo_RoleInfo]
ADD CONSTRAINT [FK_RoleInfoR_UserInfo_RoleInfo]
    FOREIGN KEY ([RoleInfoId])
    REFERENCES [dbo].[RoleInfo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleInfoR_UserInfo_RoleInfo'
CREATE INDEX [IX_FK_RoleInfoR_UserInfo_RoleInfo]
ON [dbo].[R_UserInfo_RoleInfo]
    ([RoleInfoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------