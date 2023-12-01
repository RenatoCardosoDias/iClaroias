//
//  iCaloriasApp.swift
//  iCalorias
//
//  Created by Renato on 28/11/23.
//

import SwiftUI

@main
struct iCaloriasApp: App {
	@StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
