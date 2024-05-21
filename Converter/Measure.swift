//
//  Measure.swift
//  Converter
//
//  Created by Denis Evdokimov on 5/21/24.
//

import Foundation

struct Measure {
    let firstUnit: UnitsList
    let secondUnit: UnitsList
    let value: Double

    func convert()-> String {
        let firstValue = Measurement(value: value, unit: measure(unitString: firstUnit))
        let convertValue = firstValue.converted(to: measure(unitString: secondUnit))
        return convertValue.description
    }
    
    func measure(unitString: UnitsList)-> Dimension {
        
        switch unitString {
        case .Celsius:
           return UnitTemperature.celsius
        case .Fahrenheit:
            return UnitTemperature.fahrenheit
        case .Kelvin:
            return UnitTemperature.kelvin
        case .meters:
            return UnitLength.meters
        case .kilometers:
            return UnitLength.kilometers
        case .feet:
            return UnitLength.feet
        case .yards:
            return UnitLength.yards
        case .miles:
            return UnitLength.miles
        case .seconds:
            return UnitDuration.seconds
        case .minutes:
            return UnitDuration.minutes
        case .hours:
            return UnitDuration.hours
        case .milliliters:
            return UnitVolume.milliliters
        case .liters:
            return UnitVolume.liters
        case .cups:
            return UnitVolume.cups
        case .pints:
            return UnitVolume.pints
        case .gallons:
            return UnitVolume.gallons
        
        }
        
    }
}
