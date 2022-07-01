//
//  OnboardingNicknameView.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import SwiftUI

struct OnboardingNicknameView: View {
    @ObservedObject var global = GlobalVariables.global
    
    var body: some View {
        VStack{
            Spacer()
            Text("Hi, I want us to be friend. \n\nCan you tell me what should I call you? ")
                .font(.headline)
                .fontWeight(.semibold)
            Spacer().frame(height:20)
            AppTextField(placeholder: "Your answer ...", field: $global.userNickname)
            Spacer()
        }
        .frame(width: 322, height: 600, alignment: .bottom)
    }
}

struct OnboardingNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNicknameView().preferredColorScheme(scheme)
    }
}
