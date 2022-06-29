//
//  ContentView.swift
//  macnivision
//
//  Created by renaka agusta on 24/06/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("onboarded") var currentUserOnboarded: Bool = false
   
    var body: some View {
        
        if currentUserOnboarded{
            DashboardView()
        } else{
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
