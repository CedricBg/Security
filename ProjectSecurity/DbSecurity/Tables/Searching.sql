﻿CREATE TABLE [dbo].[Searching]
(
	[IdSearch] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdRack] INT NOT NULL, 
    [IdProduct] INT NOT NULL,
    CONSTRAINT FK_SEARCH_RACK FOREIGN KEY (IdRack) REFERENCES RackProduct (IdRack),
    CONSTRAINT FK_SEARCH_PRODUCT FOREIGN KEY (IdProduct) REFERENCES Product (IdProduct),
)