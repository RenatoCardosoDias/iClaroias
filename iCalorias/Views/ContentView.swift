//
//  ContentView.swift
//  iCalorias
//
//  Created by Renato on 28/11/23.
//

import SwiftUI

struct ContentView: View {

	@Environment(\.managedObjectContext) var managedObjectContext
	@FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>

	@State private var showingAddView = false


    var body: some View {
		NavigationView {
			VStack(alignment: .leading){
				Text("\(Int(totalCaloriesToday())) Kcal (Diario)")
					.foregroundColor(.gray)
					.padding(.horizontal)
				List {
					ForEach(food) { food in
						NavigationLink(destination: EditFoodView(food:food)) {
							HStack{
								VStack(alignment: .leading, spacing: 6) {
									Text(food.name!)
										.bold()
									Text("\(Int(food.calories))") + Text(" calorias").foregroundColor(.red)
								} //end VStack
								Spacer()
								Text(calcTimeSince(date: food.date!))
									.foregroundColor(.gray)
									.italic()
							} //end HStack
						} //end NavigationLink
					} //end ForEach
					.onDelete(perform: deleteFood)
				} //end List
				.listStyle(.plain)
			} //end VStack
			.navigationTitle("iCalories")
			.toolbar{
				ToolbarItem(placement: .navigationBarTrailing) {
					Button{
						showingAddView.toggle()
					} label: {
						Label("Add Food", systemImage: "plus.circle")
					}
				} //end ToobarItem -> navigationBarTrailing
				ToolbarItem(placement: .navigationBarLeading) {
					EditButton()
				} //end ToolbarItem -> .navigationLeading
			} //end .toolbar
			.sheet(isPresented: $showingAddView){
				AddFoodView()
			} //end .sheet
		} //end NavigationView
		.navigationViewStyle(.stack) //certificar que em ipads nao terar aquela barra lateral
    }

	private func totalCaloriesToday() -> Double {
		var caloriesToday: Double = 0
		for item in food {
			if Calendar.current.isDateInToday(item.date!){
				caloriesToday += item.calories
			}
		}
		return caloriesToday
	} //end private func totalCaloriesToday

	private func deleteFood(offset: IndexSet) {
		withAnimation{
			offset.map { food[$0] }.forEach(managedObjectContext.delete)
			DataController().save(context: managedObjectContext)
		}
	} //end private func delteFood
}

#Preview {
    ContentView()
}
