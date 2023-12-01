//
//  DataController.swift
//  iCalorias
//
//  Created by Renato on 28/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "FoodModel")

	init(){
		container.loadPersistentStores { desc, error in
			if let error = error {
				print("Failed to load the data \(error.localizedDescription)")
			}
		} //end container
	} //end init

	func save(context: NSManagedObjectContext) {
		do {
			try context.save()
			print("Dados salvos!!")
		} catch {
			print("Nós não podemos salvar os dados....")
		}
	} //end func save

	func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
		let food = Food(context: context)
		food.id = UUID()
		food.date = Date()
		food.name = name
		food.calories = calories

		save(context: context)
	} //end func addFood

	func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
		food.date = Date()
		food.name = name
		food.calories = calories

		save(context: context)
	} //end fucn editFood
}
