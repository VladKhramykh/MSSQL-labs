SELECT        Заказы.*
FROM            Заказы

SELECT Заказы.* from Заказы 
			where Заказчик != 'Сойкель' order by Дата_поставки desc;