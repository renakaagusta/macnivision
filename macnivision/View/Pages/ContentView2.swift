//
//  ContentView2.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import SwiftUI

struct ContentView2: View {
    @AppStorage("onboarded") var currentUserOnboarded: Bool = false
   
    var body: some View {
        
        if currentUserOnboarded{
            MainView()
        } else{
            OnboardingView()
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
