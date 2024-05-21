//
//  UnitsList.swift
//  Converter
//
//  Created by Denis Evdokimov on 5/21/24.
//

import Foundation
enum UnitsList: String {

    case Celsius = "цельсий"
    case Fahrenheit = "фаренгейт"
    case Kelvin = "кельвин"
    case meters = "метры"
    case kilometers = "километры"
    case feet = "футы"
    case yards = "ярды"
    case miles = "миля"
    case seconds = "секунды"
    case minutes = "минуты"
    case hours = "часы"
    case milliliters = "милл"
    case liters = "литры"
    case cups = "кружки"
    case pints = "пинты"
    case gallons = "галлоны"
}

enum UnitKind: String{
    case Temperatur = "Температура"
    case Length = "Расстояние"
    case Time = "Время"
    case Volume = "Объем"
}
