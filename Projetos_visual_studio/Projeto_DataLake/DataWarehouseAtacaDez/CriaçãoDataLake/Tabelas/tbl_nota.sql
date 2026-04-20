CREATE TABLE [dbo].[tbl_nota]
(
	[numero] INT NOT NULL PRIMARY KEY, 
    [cod_cliente] VARCHAR(25) NULL, 
    [data] DATE NULL, 
    [cod_loja] VARCHAR(25) NULL, 
    [arquivo_origem] VARCHAR(200) NULL, 
    [data_carga] DATETIME NULL
)
