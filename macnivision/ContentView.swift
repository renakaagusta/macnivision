//
//  ContentView.swift
//  macnivision
//
//  Created by renaka agusta on 24/06/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        DashboardView()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
