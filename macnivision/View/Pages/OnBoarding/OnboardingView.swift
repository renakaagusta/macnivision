//
//  OnboardingView.swift
//  macnivision
//
//  Created by Theresia Saputri on 24/06/22.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var global = GlobalVariables.global
    @State var onboardingState: Int = 0
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @AppStorage("userNickname") var currentUserNickname: String?
    @AppStorage("selectedPet") var currentSelectedPet: String?
    @AppStorage("onboarded") var currentUserOnboarded: Bool = false
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    func showAlert(title: String){
        alertTitle =  title
        showAlert.toggle()
    }
    
    var body: some View {
        VStack{
            ZStack{
                switch onboardingState{
                case 0:
                    OnboardingFeatureView()
                        .transition(transition)
                case 1:
                    OnboardingNicknameView()
                        .transition(transition)
                case 2:
                    OnboardingPetView()
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color.white)
                }
            }
            VStack{
                Spacer()
                AppElevatedButton(label: onboardingState == 2 ? "Finish": "Continue", onClick: {
                    switch onboardingState{
                    case 1:
                        guard global.userNickname.count >= 3 else{
                            showAlert(title: "please input your nickname with at least three character")
                            return
                        }
                    case 2:
                        guard global.selectedPet.count >= 1 else{
                            showAlert(title: "please choose your pet")
                            return
                        }
                    default:
                        break
                    }
                    if onboardingState == 1{
                        
                    }
                    if onboardingState == 2{
                        currentUserNickname = global.userNickname
                        currentSelectedPet = global.selectedPet
                        currentUserOnboarded = true
                    }
                    withAnimation(.easeInOut(duration: 1.0)){
                        onboardingState += 1
                    }
                })
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
                return Alert(title: Text(alertTitle))
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().preferredColorScheme(scheme)
    }
}
