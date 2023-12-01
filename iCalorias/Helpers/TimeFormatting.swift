//
//  TimeFormatting.swift
//  iCalorias
//
//  Created by Renato on 29/11/23.
//

import Foundation


func calcTimeSince(date: Date) -> String {
	///```
	///deixar os minutos iguais os numeros inteiros as horas iguais aos minutos divido por 60, isso vai pegar os mintuos
	///deixar as horas iguais divido por 60
	///deixar os dias igual as horas divido por 24h
	///````

	let minutes = Int(-date.timeIntervalSinceNow)/60
	let hours = minutes/60
	let days = hours/24

	if minutes < 120 {
		return "\(minutes) minutos atras"
	} else if minutes >= 120 && hours < 48 {
		return "\(hours) horas atras"
	} else {
		return "\(days) dias atras"
	}
}
