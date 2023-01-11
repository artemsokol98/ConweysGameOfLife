//
//  ConweysGameOfLifeApp.swift
//  ConweysGameOfLife
//
//  Created by Артем Соколовский on 09.01.2023.
//

import SwiftUI

@main
struct ConweysGameOfLifeApp: App {
    let persistenceController = PersistenceController.shared
    
    

    var body: some Scene {
        WindowGroup {
            ContentView()
               // .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
