//
//  DashboardView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct DashboardView: View {
    
    @State var selection = 1
    
    @State var title: String = ""

    
    var body: some View {
            VStack(alignment: .center) {
                TabView(selection: $selection) {
                    PetView()
                        .tabItem {
                            Image(systemName: "homekit")
                            Text("Pet").foregroundColor(Color.primaryColor)
                        }.tag(1)
                    JournalView().tabItem {
                        Image(systemName: "homekit")
                        Text("Journal")
                    }.tag(2)
                    MedicalInfoView().tabItem {
                        Image(systemName: "homekit")
                        Text("Medical Info")
                    }.tag(3)
                }.accentColor(Color.primaryColor).navigationTitle(selection == 1 ? "Pet" : (selection == 2 ? "Journal" : "Medical Info"))
            }.navigationBarBackButtonHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
