//
//  OnboardingPetView.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import SwiftUI

struct OnboardingPetView: View {
    @ObservedObject var global = GlobalVariables.global
    
    @State private var isDogSelected: Bool = false
    @State private var isCatSelected: Bool = false
    
    @State private var dogImage: String = "Choose Dog"
    @State private var catImage: String = "Choose Cat"
    
    
    var body: some View {
        VStack{
            Spacer()
            Text("Great to be your friend, \(global.userNickname)! \nPlease choose your pet ")
                .font(.title2)
                .fontWeight(.semibold)
            
            Button{
                isDogSelected = true
                isCatSelected = false
                dogImage = "Choose Dog"
                catImage = "Choose Cat Gray"
                global.selectedPet = "dog"
            }
            
            label:{
                Image(dogImage)
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .padding(.vertical)
            
            Button{
                isDogSelected = false
                isCatSelected = true
                dogImage = "Choose Dog Gray"
                catImage = "Choose Cat"
                global.selectedPet = "cat"

            }
            label:{
                Image(catImage)
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            
            Spacer()
        }
        .frame(width: 322, height: 600, alignment: .bottom)
    }
}

struct OnboardingPetView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPetView().preferredColorScheme(scheme)
    }
}
