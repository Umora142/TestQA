﻿#language: ru

@tree



Функционал: Тестирование отображения возвратов в  отчете D2001

Как Тестировщик я хочу
протестировать отчет D2001
чтобы проверить что возвраты отображаются в отчете
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
Сценарий: _05001 Загрузка документов
Когда Загрузка РТУ и Возврата

//Проводим загруженные документы
И я выполняю код встроенного языка на сервере
	|'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: отображение возвратов в отчете D2001
	И я закрываю все окна клиентского приложения
	
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку  'Сформировать'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R5C1' в течение 30 секунд
	//Сверяем сформированный отчет с эталоном
	Дано Табличный документ "Result" равен макету "ЭталонD2001"

	
	

		
	

