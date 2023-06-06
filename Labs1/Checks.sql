USE LAB1;
Go

ALTER TABLE [dbo].[Bus] WITH CHECK ADD CONSTRAINT [busPassengerQuantityMoreThanZero] CHECK([PassengerQuantity]>0)
Go
ALTER TABLE [dbo].[Bus]CHECK CONSTRAINT [busPassengerQuantityMoreThanZero]
Go



--ALTER TABLE [dbo].[Excursion] WITH CHECK ADD CONSTRAINT [ActualTouristQuantityLessThanTouristQuantity] CHECK([ActualTouristQuantity]<=([dbo].[ExcursionType].[TouristQuantity]))
--Go
--ALTER TABLE [dbo].[Excursion]CHECK CONSTRAINT [ActualTouristQuantityLessThanTouristQuantity]
--Go

ALTER TABLE [dbo].[Excursion] WITH CHECK ADD CONSTRAINT [ActualTouristQuantityMoreThanZero] CHECK([ActualTouristQuantity]>0)
Go
ALTER TABLE [dbo].[Excursion]CHECK CONSTRAINT [ActualTouristQuantityMoreThanZero]
Go

ALTER TABLE [dbo].[ExcursionType] WITH CHECK ADD CONSTRAINT [TouristQuantityMoreThanZero] CHECK([TouristQuantity]>0)
Go
ALTER TABLE [dbo].[ExcursionType]CHECK CONSTRAINT [TouristQuantityMoreThanZero]
Go

ALTER TABLE [dbo].[Client] WITH CHECK ADD CONSTRAINT [NonNegativeAmountOwed] CHECK ([AmountOwed] >= 0)
Go
ALTER TABLE [dbo].[Client]CHECK CONSTRAINT [NonNegativeAmountOwed] 
Go

ALTER TABLE [dbo].[PaymentAccounting]  WITH CHECK ADD CONSTRAINT [NonNegativeAmountPaid] CHECK ([AmountPaid] >= 0)
Go
ALTER TABLE [dbo].[PaymentAccounting]CHECK CONSTRAINT [NonNegativeAmountPaid]
Go
