IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [City] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_City] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [StorageFile] (
        [Id] int NOT NULL IDENTITY,
        [UniqueId] uniqueidentifier NOT NULL,
        [Url] nvarchar(max) NOT NULL,
        [ContentType] nvarchar(max) NOT NULL,
        [ImageInBytes] varbinary(max) NOT NULL,
        CONSTRAINT [PK_StorageFile] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [Category] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [NameInArabic] nvarchar(50) NOT NULL,
        [Description] nvarchar(500) NOT NULL,
        [DescriptionArabic] nvarchar(500) NOT NULL,
        [MetaKeywords] nvarchar(50) NOT NULL,
        [MetaKeywordsArabic] nvarchar(50) NOT NULL,
        [MetaDescription] nvarchar(100) NOT NULL,
        [MetaDescriptionArabic] nvarchar(100) NOT NULL,
        [SEO] nvarchar(max) NOT NULL,
        [CanonicalUrl] nvarchar(max) NOT NULL,
        [ImageId] int NOT NULL,
        CONSTRAINT [PK_Category] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Category_StorageFile_ImageId] FOREIGN KEY ([ImageId]) REFERENCES [StorageFile] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [Product] (
        [Id] int NOT NULL IDENTITY,
        [Title] nvarchar(50) NOT NULL,
        [TitleArabic] nvarchar(50) NOT NULL,
        [Description] nvarchar(500) NOT NULL,
        [DescriptionArabic] nvarchar(500) NOT NULL,
        [MetaKeywords] nvarchar(50) NULL,
        [MetaKeywordsArabic] nvarchar(50) NULL,
        [MetaDescription] nvarchar(100) NULL,
        [MetaDescriptionArabic] nvarchar(100) NULL,
        [SEO] nvarchar(max) NOT NULL,
        [CanonicalUrl] nvarchar(max) NOT NULL,
        [Space] decimal(18,2) NOT NULL,
        [Status] int NOT NULL,
        [IsDeleted] bit NOT NULL,
        [LocationUrl] nvarchar(max) NOT NULL,
        [LocationDescription] nvarchar(max) NOT NULL,
        [BasePrice] decimal(18,2) NOT NULL,
        [CreateOnUTC] datetime2 NOT NULL,
        [PublisedUTC] datetime2 NOT NULL,
        [DeletedOnUTC] datetime2 NOT NULL,
        [SoledUTC] datetime2 NOT NULL,
        [CityId] int NOT NULL,
        [CreatedBy] uniqueidentifier NOT NULL,
        [UpdatedBy] uniqueidentifier NOT NULL,
        [VideoURl] nvarchar(max) NOT NULL,
        [CategoryId] int NOT NULL,
        CONSTRAINT [PK_Product] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Product_City_CityId] FOREIGN KEY ([CityId]) REFERENCES [City] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE TABLE [ProductImage] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Description] nvarchar(100) NULL,
        [DescriptionArabic] nvarchar(100) NULL,
        [ProductId] int NOT NULL,
        [IsMain] bit NOT NULL,
        [DisplayOrder] int NOT NULL,
        [StorageFileId] int NOT NULL,
        CONSTRAINT [PK_ProductImage] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ProductImage_Product_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Product] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_ProductImage_StorageFile_StorageFileId] FOREIGN KEY ([StorageFileId]) REFERENCES [StorageFile] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''0884256f-48ef-41ae-9c6f-50b663959cbd'', N''19418a68-0b22-4b1e-b404-7e689632d784'', N''Operation'', N''OPERATION'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''4b04b503-e4af-47bb-80bb-fdd772271c38'', N''b22fff30-23d3-4abc-9d3e-9375ea784352'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''4b04b503-e4af-47bb-80bb-fdd772271c39'', N''b22fff30-23d3-4abc-9d3e-9375ea784353'', N''Developer'', N''DEVELOPER'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE UNIQUE INDEX [IX_Category_ImageId] ON [Category] ([ImageId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_Product_CategoryId] ON [Product] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_Product_CityId] ON [Product] ([CityId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE INDEX [IX_ProductImage_ProductId] ON [ProductImage] ([ProductId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    CREATE UNIQUE INDEX [IX_ProductImage_StorageFileId] ON [ProductImage] ([StorageFileId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301163353_Intial-DB')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230301163353_Intial-DB', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    ALTER TABLE [Product] ADD [AreaId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    ALTER TABLE [Product] ADD [BathRomms] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    ALTER TABLE [Product] ADD [Rooms] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    CREATE TABLE [Area] (
        [Id] int NOT NULL IDENTITY,
        [NameEnglish] nvarchar(max) NOT NULL,
        [NameArabic] nvarchar(max) NOT NULL,
        [CityId] int NOT NULL,
        CONSTRAINT [PK_Area] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Area_City_CityId] FOREIGN KEY ([CityId]) REFERENCES [City] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    CREATE INDEX [IX_Product_AreaId] ON [Product] ([AreaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    CREATE INDEX [IX_Area_CityId] ON [Area] ([CityId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Area_AreaId] FOREIGN KEY ([AreaId]) REFERENCES [Area] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319121813_Create-Area-table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230319121813_Create-Area-table', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319122714_Create-city-table')
BEGIN
    EXEC sp_rename N'[City].[Name]', N'NameEnglish', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319122714_Create-city-table')
BEGIN
    ALTER TABLE [City] ADD [NameAranic] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319122714_Create-city-table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230319122714_Create-city-table', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319130018_Create-city-table1')
BEGIN
    ALTER TABLE [City] ADD [Displayoreder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230319130018_Create-city-table1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230319130018_Create-city-table1', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Category] DROP CONSTRAINT [FK_Category_StorageFile_ImageId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DROP INDEX [IX_Category_ImageId] ON [Category];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Product]') AND [c].[name] = N'MetaDescription');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Product] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Product] DROP COLUMN [MetaDescription];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Product]') AND [c].[name] = N'MetaDescriptionArabic');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Product] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Product] DROP COLUMN [MetaDescriptionArabic];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Product]') AND [c].[name] = N'MetaKeywords');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Product] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Product] DROP COLUMN [MetaKeywords];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Product]') AND [c].[name] = N'MetaKeywordsArabic');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Product] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Product] DROP COLUMN [MetaKeywordsArabic];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'MetaDescription');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Category] DROP COLUMN [MetaDescription];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'MetaDescriptionArabic');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Category] DROP COLUMN [MetaDescriptionArabic];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'MetaKeywords');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Category] DROP COLUMN [MetaKeywords];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'MetaKeywordsArabic');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Category] DROP COLUMN [MetaKeywordsArabic];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Product] ADD [BuyOrRent] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Product] ADD [CurrencyId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Product] ADD [TypeId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Category] ADD [DisplayOrder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    CREATE TABLE [Currency] (
        [Id] int NOT NULL IDENTITY,
        [CurrencyCode] nvarchar(max) NOT NULL,
        [CurrencyName] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Currency] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    CREATE TABLE [Type] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Type] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    CREATE INDEX [IX_Product_CurrencyId] ON [Product] ([CurrencyId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    CREATE INDEX [IX_Product_TypeId] ON [Product] ([TypeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Currency_CurrencyId] FOREIGN KEY ([CurrencyId]) REFERENCES [Currency] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Type_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [Type] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230326181449_update-database')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230326181449_update-database', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327154751_add-developer-table')
BEGIN
    ALTER TABLE [Product] ADD [DeveloperId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327154751_add-developer-table')
BEGIN
    CREATE TABLE [Developer] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [NameInArabic] nvarchar(max) NOT NULL,
        [StorageFileId] int NOT NULL,
        CONSTRAINT [PK_Developer] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Developer_StorageFile_StorageFileId] FOREIGN KEY ([StorageFileId]) REFERENCES [StorageFile] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327154751_add-developer-table')
BEGIN
    CREATE INDEX [IX_Product_DeveloperId] ON [Product] ([DeveloperId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327154751_add-developer-table')
BEGIN
    CREATE UNIQUE INDEX [IX_Developer_StorageFileId] ON [Developer] ([StorageFileId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327154751_add-developer-table')
BEGIN
    ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Developer_DeveloperId] FOREIGN KEY ([DeveloperId]) REFERENCES [Developer] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327154751_add-developer-table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230327154751_add-developer-table', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327162624_Clear-Category-Table')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'CanonicalUrl');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [Category] DROP COLUMN [CanonicalUrl];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327162624_Clear-Category-Table')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'Description');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [Category] DROP COLUMN [Description];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327162624_Clear-Category-Table')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'ImageId');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [Category] DROP COLUMN [ImageId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327162624_Clear-Category-Table')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'SEO');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [Category] DROP COLUMN [SEO];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327162624_Clear-Category-Table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230327162624_Clear-Category-Table', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330184243_Update-Type-Table')
BEGIN
    ALTER TABLE [Type] ADD [DisplayOrder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330184243_Update-Type-Table')
BEGIN
    ALTER TABLE [Type] ADD [NameInArabic] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230330184243_Update-Type-Table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230330184243_Update-Type-Table', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406174818_update-developer')
BEGIN
    ALTER TABLE [Developer] ADD [Description] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406174818_update-developer')
BEGIN
    ALTER TABLE [Developer] ADD [DescriptionInArabic] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406174818_update-developer')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230406174818_update-developer', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406191049_Add-Desplayorder-Developers')
BEGIN
    ALTER TABLE [Developer] ADD [DesplayOrder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406191049_Add-Desplayorder-Developers')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230406191049_Add-Desplayorder-Developers', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    ALTER TABLE [Product] ADD [ProjectId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE TABLE [Project] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        [NameInArabic] nvarchar(max) NOT NULL,
        [DescriptionInArabic] nvarchar(max) NOT NULL,
        [LoacationUrl] nvarchar(max) NOT NULL,
        [CityId] int NOT NULL,
        [AreaId] int NOT NULL,
        CONSTRAINT [PK_Project] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Project_Area_AreaId] FOREIGN KEY ([AreaId]) REFERENCES [Area] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Project_City_CityId] FOREIGN KEY ([CityId]) REFERENCES [City] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE TABLE [ProjectImage] (
        [Id] int NOT NULL IDENTITY,
        [StorageFileId] int NOT NULL,
        [ProjectId] int NOT NULL,
        [IsMain] bit NOT NULL,
        CONSTRAINT [PK_ProjectImage] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ProjectImage_Project_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [Project] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_ProjectImage_StorageFile_StorageFileId] FOREIGN KEY ([StorageFileId]) REFERENCES [StorageFile] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE INDEX [IX_Product_ProjectId] ON [Product] ([ProjectId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE INDEX [IX_Project_AreaId] ON [Project] ([AreaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE INDEX [IX_Project_CityId] ON [Project] ([CityId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE INDEX [IX_ProjectImage_ProjectId] ON [ProjectImage] ([ProjectId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    CREATE INDEX [IX_ProjectImage_StorageFileId] ON [ProjectImage] ([StorageFileId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    ALTER TABLE [Product] ADD CONSTRAINT [FK_Product_Project_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [Project] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410185220_Add-Project')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230410185220_Add-Project', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410191151_Add-Project-video')
BEGIN
    ALTER TABLE [Project] ADD [VideoUrl] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410191151_Add-Project-video')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230410191151_Add-Project-video', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410202121_Add-Project-status')
BEGIN
    ALTER TABLE [Project] ADD [Status] int NOT NULL DEFAULT 10;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230410202121_Add-Project-status')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230410202121_Add-Project-status', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230411192807_Add-Developer-to-Project')
BEGIN
    ALTER TABLE [Project] ADD [DeveloperId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230411192807_Add-Developer-to-Project')
BEGIN
    CREATE INDEX [IX_Project_DeveloperId] ON [Project] ([DeveloperId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230411192807_Add-Developer-to-Project')
BEGIN
    ALTER TABLE [Project] ADD CONSTRAINT [FK_Project_Developer_DeveloperId] FOREIGN KEY ([DeveloperId]) REFERENCES [Developer] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230411192807_Add-Developer-to-Project')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230411192807_Add-Developer-to-Project', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230412193526_update-area')
BEGIN
    ALTER TABLE [Area] ADD [Displayoreder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230412193526_update-area')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230412193526_update-area', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422140413_add-DisplayOrder-Project')
BEGIN
    ALTER TABLE [Project] ADD [DisplayOrder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422140413_add-DisplayOrder-Project')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230422140413_add-DisplayOrder-Project', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230424182333_add-unique-id')
BEGIN
    ALTER TABLE [Product] ADD [UniqueId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230424182333_add-unique-id')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230424182333_add-unique-id', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230424194550_add-deleveryDate')
BEGIN
    ALTER TABLE [Project] ADD [DeleveryDate] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230424194550_add-deleveryDate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230424194550_add-deleveryDate', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517162024_location-null')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Project]') AND [c].[name] = N'VideoUrl');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Project] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [Project] ALTER COLUMN [VideoUrl] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517162024_location-null')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Project]') AND [c].[name] = N'LoacationUrl');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Project] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [Project] ALTER COLUMN [LoacationUrl] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230517162024_location-null')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230517162024_location-null', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230521134302_add-display-order-to-project-image')
BEGIN
    ALTER TABLE [ProjectImage] ADD [DisplayOrder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230521134302_add-display-order-to-project-image')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230521134302_add-display-order-to-project-image', N'6.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522190822_add-creatby-update-by')
BEGIN
    ALTER TABLE [Project] ADD [CreateById] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522190822_add-creatby-update-by')
BEGIN
    ALTER TABLE [Project] ADD [CreatedOnUtc] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522190822_add-creatby-update-by')
BEGIN
    ALTER TABLE [Project] ADD [UpdateById] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522190822_add-creatby-update-by')
BEGIN
    ALTER TABLE [Project] ADD [UpdateOnUtc] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522190822_add-creatby-update-by')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230522190822_add-creatby-update-by', N'6.0.0');
END;
GO

COMMIT;
GO

