HOMEWORK sql-ex.ru
exercises 1-10

-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
-- Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
-- Result set: model, speed, hd

select model, speed, hd from PC
where price < 500;

-- 2. Найдите производителей принтеров
-- List all printer makers. Result set: maker

select distinct maker from Product
where type = 'printer';

-- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
-- Find the model number, RAM and screen size of the laptops with prices over $1000

select model, ram, screen from Laptop
where price > 1000;

-- 4. Найдите все записи таблицы Printer для цветных принтеров
-- Find all records from the Printer table containing data about color printers

select * from Printer
where color = 'y';

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол
-- Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive

select model, speed, hd from PC
where cd in ('12x', '24x') and price < 600;

-- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов
-- For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed

select distinct Product.maker, Laptop.speed from
Product join Laptop
on Product.model = Laptop.model
where Laptop.hd >= 10;

-- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя 'B' (латинская буква)
-- Get the models and prices for all commercially available products (of any type) produced by maker B

select model, price from PC
where model in (select model from Product
                where maker = 'B')
union
select model, price from Laptop
where model in (select model from Product
                where maker = 'B')
union
select model, price from Printer
where model in (select model from Product
                where maker = 'B');

-- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты
-- Find the makers producing PCs but not laptops

select maker from Product
where type = 'pc'
except
select maker from Product
where type = 'laptop';

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц
-- Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker

select distinct maker from Product
where model in (select model from PC
	        where speed >= 450);

-- 10. Найдите модели принтеров, имеющих самую высокую цену
-- Find the printer models having the highest price. Result set: model, price

select model, price from printer
where price = ( select max(price) from printer);

