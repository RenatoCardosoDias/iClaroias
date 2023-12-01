//
//  EditFoodView.swift
//  iCalorias
//
//  Created by Renato on 29/11/23.
//

import SwiftUI

struct EditFoodView: View {

	@Environment(\.managedObjectContext) var managedObjectContext
	@Environment(\.dismiss) var dismiss

	var food: FetchedResults<Food>.Element

	@State private var name:String = ""
	@State private var calories: Double = 0


    var body: some View {
		Form{
			Section{
				TextField("\(food.name!)", text: $name)
					.onAppear{
						food.name!
						calories = food.calories
					} //end .onAppear
				VStack{
					Text("Calories: \(Int(calories))")
					Slider(value: $calories, in: 0...1000, step: 10)
				} //end VStack
				.padding()

				HStack{
					Spacer()
					Button("Submit") {
						DataController().editFood(food: food, name: name, calories: calories, context: managedObjectContext)
						dismiss()
					}
					Spacer()

				}
			}
		}
    }
}

//#Preview {
//	EditFoodView(, food: <#FetchedResults<Food>.Element#>)
//}
