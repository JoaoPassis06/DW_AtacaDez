/*
Script de implantação para DL_ATACADEZ

Esse código foi gerado por uma ferramenta.
Alterações nesse arquivo podem causar comportamento incorreto e serão perdidas se
o código for regenerado.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DL_ATACADEZ"
:setvar DefaultFilePrefix "DL_ATACADEZ"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar modo SQLCMD e desabilitar a execução do script se o modo SQLCMD não for suportado.
Para reabilitar o script após habilitar o modo SQLCMD, execute o seguinte:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave 824744f6-66d1-481a-aae0-7d25bc27546a foi ignorada; o elemento [dbo].[tbl_empresa].[Id] (SqlSimpleColumn) não será renomeado para cod_loja';


GO
PRINT N'A operação de refatoração Renomear com chave cf98da02-735b-403d-a872-6236e676e8ca foi ignorada; o elemento [dbo].[tbl_cliente].[Id] (SqlSimpleColumn) não será renomeado para cod_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 79242aae-b6aa-4ab0-aba6-364337facf0e, 78587490-315f-4d35-8c67-e1b5677bfa76 foi ignorada; o elemento [dbo].[tbl_produto].[Id] (SqlSimpleColumn) não será renomeado para cod_produto';


GO
PRINT N'A operação de refatoração Renomear com chave dbae1d08-372a-4980-8489-9f05a003d627 foi ignorada; o elemento [dbo].[tbl_produto].[desc_regiao] (SqlSimpleColumn) não será renomeado para desc_fornecedor';


GO
PRINT N'Criando Tabela [dbo].[tbl_cliente]...';


GO
CREATE TABLE [dbo].[tbl_cliente] (
    [cod_cliente]    VARCHAR (25)  NOT NULL,
    [desc_cliente]   VARCHAR (200) NULL,
    [endereco]       VARCHAR (200) NULL,
    [faturamento]    FLOAT (53)    NULL,
    [desc_segmento]  VARCHAR (200) NULL,
    [desc_cidade]    VARCHAR (200) NULL,
    [cod_estado]     VARCHAR (25)  NULL,
    [desc_estado]    VARCHAR (200) NULL,
    [desc_regiao]    VARCHAR (200) NULL,
    [arquivo_origem] VARCHAR (200) NULL,
    [data_carga]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_cliente] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_empresa]...';


GO
CREATE TABLE [dbo].[tbl_empresa] (
    [cod_loja]       VARCHAR (25)  NOT NULL,
    [desc_loja]      VARCHAR (200) NULL,
    [desc_empresa]   VARCHAR (200) NULL,
    [cod_empresa]    VARCHAR (25)  NULL,
    [tamanho_loja]   FLOAT (53)    NULL,
    [arquivo_origem] VARCHAR (200) NULL,
    [data_carga]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_loja] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_produto]...';


GO
CREATE TABLE [dbo].[tbl_produto] (
    [cod_produto]        VARCHAR (25)  NOT NULL,
    [desc_produto]       VARCHAR (200) NULL,
    [desc_departamento]  VARCHAR (200) NULL,
    [atr_unidade_medida] VARCHAR (50)  NULL,
    [cod_fornecedor]     VARCHAR (25)  NULL,
    [desc_fornecedor]    NCHAR (200)   NULL,
    [arquivo_origem]     VARCHAR (200) NULL,
    [data_carga]         NCHAR (10)    NULL,
    PRIMARY KEY CLUSTERED ([cod_produto] ASC)
);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '824744f6-66d1-481a-aae0-7d25bc27546a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('824744f6-66d1-481a-aae0-7d25bc27546a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cf98da02-735b-403d-a872-6236e676e8ca')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cf98da02-735b-403d-a872-6236e676e8ca')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '79242aae-b6aa-4ab0-aba6-364337facf0e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('79242aae-b6aa-4ab0-aba6-364337facf0e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '78587490-315f-4d35-8c67-e1b5677bfa76')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('78587490-315f-4d35-8c67-e1b5677bfa76')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'dbae1d08-372a-4980-8489-9f05a003d627')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('dbae1d08-372a-4980-8489-9f05a003d627')

GO

GO
PRINT N'Atualização concluída.';


GO
