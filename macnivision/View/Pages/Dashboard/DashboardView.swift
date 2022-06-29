//
//  DashboardView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct DashboardView: View {
    @State var selection: Tab = .pet
        
        enum Tab{
            case pet
            case journal
            case medical
        }
        
        init() {
                UITabBar.appearance().backgroundColor = UIColor.white
            }
        
        var body: some View {
            TabView(selection: $selection){
                PetView()
                    .tabItem{
                        Label("Pet", systemImage: "pawprint.fill")
                    }
                    .tag(Tab.pet)
                JournalView()
                    .tabItem{
                        Label("Journal", systemImage: "heart.text.square.fill")
                    }
                    .tag(Tab.journal)
                MedicalInfoListView()
                    .tabItem{
                        Label("Medical", systemImage: "heart.fill")
                    }
                    .tag(Tab.medical)
            }.accentColor(Color.primaryColor)
        }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView().preferredColorScheme(scheme)
    }
}
