﻿#language: ru

@tree

Функционал: тестирование Заказа покупателя

Как Тестировщик я хочу
проверить заполнение полей в заказе покупателя 
чтобы убедиться что поля заполняются и при записи не очищаются
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка заполнения полей в док.Заказ покупателя

	*Создаю документ и заполняю шапку
		И я закрываю все окна клиентского приложения
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"

		И я нажимаю на кнопку 'Создать'
		И я нажимаю кнопку выбора у поля  "Партнер"

		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'       |
			| '12'  | 'Розничный клиент 1' |

		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'

	*Проверка заполнения полей Партнер и Соглашение
		Тогда значение поля "Партнер" содержит текст "Розничный клиент 1"
		Тогда значение поля "Соглашение"  содержит текст "Розничный клиент 1"
//ДЗ модуль 5	Заполняем организацию если она не заполнилась из соглашения	
		Если элемент формы 'Организация' стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Company"
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'           |
				| '2'   | 'Собственная компания 2' |
			И в таблице "List" я выбираю текущую строку
//ДЗ модуль 5			


	* Запись документа и проверка что поля не очистились
		И я нажимаю на кнопку  'Записать'
		Тогда значение поля "Партнер" содержит текст "Розничный клиент 1"
		Тогда значение поля "Соглашение"  содержит текст "Розничный клиент 1"			

Сценарий: Проверка не доступности поля Контрагент если Партнер не заполнен
	*Создаю документ и заполняю шапку
		И я закрываю все окна клиентского приложения
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"

		И я нажимаю на кнопку 'Создать'
		И элемент формы 'Партнер' стал равен ''
			
	И	Проверяю шаги на Исключение:
		|'И я нажимаю кнопку выбора у поля  "Контрагент"'|
		|'Тогда открылось окно \'Организации\''|
		|'И в таблице "List" я выбираю текущую строку'|
		

