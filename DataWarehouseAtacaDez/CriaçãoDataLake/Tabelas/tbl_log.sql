CREATE TABLE [dbo].[tbl_log]
(
	[data] DATETIME NOT NULL PRIMARY KEY, 
    [mensagem] VARCHAR(255) NULL, 
    [resultado] VARCHAR(32) NULL
)
