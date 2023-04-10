HOMEWORK sql-ex.ru

-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью
-- менее 500 дол.
--select model, speed and hd size for all PCs under $500

select model, speed, hd from PC
where price < 500;

-- 2. Найдите производителей принтеров
-- find printer makers

select distinct maker from Product
where type = 'printer';

-- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов,
-- цена которых превышает 1000 дол.
-- select model, ram and screen sizes of laptops with a price > $1000

select model, ram, screen from Laptop
where price > 1000;

-- 4. Найдите все записи таблицы Printer для цветных принтеров
-- select all entries in the Printer table for color printers

select * from Printer
where color = 'y';

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол
-- select model, speed and hd for PCs with 12x or 24x read speed and price < $600

select model, speed, hd from PC
where cd in ('12x', '24x') and price < 600;

-- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов
-- for each maker producing laptops with hd >= 10 GB select speed of such laptops

select distinct Product.maker, Laptop.speed from
Product join Laptop
on Product.model = Laptop.model
where Laptop.hd >= 10;

-- 7. Найдите номера моделей и цены всех имеющихся в продаже
-- продуктов (любого типа) производителя 'B' (латинская буква)
-- select model and price of all available products (of any type) of
-- maker 'B' (Latin letter)

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
-- select the maker that produces PCs but not laptops

select maker from Product
where type = 'pc'
except
select maker from Product
where type = 'laptop';

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц
-- select makers who produce PC with speed >= 450 MHz

select distinct maker from Product
where model in (select model from PC
	        where speed >= 450);

-- 10. Найдите модели принтеров, имеющих самую высокую цену
-- select printer models with max price

select model, price from printer
where price = ( select max(price) from printer);

