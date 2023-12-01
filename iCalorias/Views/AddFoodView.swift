//
//  AddFoodView.swift
//  iCalorias
//
//  Created by Renato on 29/11/23.
//

import SwiftUI

struct AddFoodView: View {

	@Environment (\.managedObjectContext) var managedObjectContext
	@Environment(\.dismiss) var dismiss

	@State private var name = ""
	@State private var calories: Double = 0

    var body: some View {
		Form {
			Section{
				TextField("Nome:", text: $name)

				VStack{
					Text("Calorias: \(Int(calories))")
					Slider(value: $calories, in: 0...1000, step: 10)
				} //end VStack
				.padding()
				HStack {
					Spacer()
					Button("Submit") {
						DataController().addFood(name: name, calories: calories, context: managedObjectContext)
						dismiss()
					}
					Spacer()
				}
			} //end Section
		}
    }
}

#Preview {
    AddFoodView()
}
