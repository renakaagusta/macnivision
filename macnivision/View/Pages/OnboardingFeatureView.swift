//
//  OnboardingFeatureView.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import SwiftUI

struct OnboardingFeatureView: View {
    @ObservedObject var global = GlobalVariables.global
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("Welcome to")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("Deppy")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(greenbutton)
            }
            .padding(.vertical)
            
            HStack{
                Image("PAWS")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(.trailing)
                
                VStack(alignment: .leading){
                    Text("Grow with your pet")
                        .font(.title2)
                        .fontWeight(.semibold)
            
                    Text("You can choose your pet and grow along with them. You can feed them by filling your journal.")
                }
            }
            .padding(.vertical)
            
            HStack{
                Image("JOURNAL")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(.trailing)
                
                VStack(alignment: .leading){
                    Text("Emotion Journal")
                        .font(.title2)
                        .fontWeight(.semibold)
            
                    Text("Fill your daily journal based on your feeling and get the food to feed your pet.")
                }
            }
            .padding(.vertical)
            
            HStack{
                Image("MEDICAL")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(.trailing)
                
                VStack(alignment: .leading){
                    Text("Medical Info")
                        .font(.title2)
                        .fontWeight(.semibold)
            
                    Text("If you need help, you can search for the expert for further help.")
                }
            }
            .padding(.vertical)
            
            Spacer()

        }
        .frame(width: 322, height: 600, alignment: .bottom)
    }
}

struct OnboardingFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFeatureView()
    }
}
