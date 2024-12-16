Процедура ОбработкаПроведения(Отказ,Режим)
	
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ПриходнаяНакладнаяСписокНоменклатуры.Номенклатура,
		|	СУММА(ПриходнаяНакладнаяСписокНоменклатуры.Количество) КАК Количество,
		|	СУММА(ПриходнаяНакладнаяСписокНоменклатуры.Сумма) КАК Сумма
		|ИЗ
		|	Документ.ПриходнаяНакладная.СписокНоменклатуры КАК ПриходнаяНакладнаяСписокНоменклатуры
		|ГДЕ
		|	ПриходнаяНакладнаяСписокНоменклатуры.Ссылка = &Ссылка
		|СГРУППИРОВАТЬ ПО
		|	ПриходнаяНакладнаяСписокНоменклатуры.Номенклатура";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		Движение = Движения.ОстаткиНоменклатуры.Добавить();
		Движение.Период = Дата;
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Номенклатура = Выборка.Номенклатура;
		Движение.Склад = Склад;
		Движение.Количество = Выборка.Количество;
		Движение.Сумма = Выборка.Сумма;
	КонецЦикла;
	Движения.ОстаткиНоменклатуры.БлокироватьДляИзменения=Истина;
	Движения.ОстаткиНоменклатуры.Записывать = Истина;
	
	
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры