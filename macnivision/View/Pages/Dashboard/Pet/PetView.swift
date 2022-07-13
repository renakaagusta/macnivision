//
//  PetView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct PetView: View {
    
    @State var hungryPercent: CGFloat = 0
    @State var currentHungryPercent: CGFloat = 0
    @State private var counter = 0
    @State var totalFood: Int = PetGlobalVariable.petGlobal.petFoodAmount
    var foodBonus: CGFloat = 25
    
    @State var petChecker: String
    @State var isDog:Bool
    @State var isHungry:Bool = true
    @State var isEat:Bool = false
    @State var isTap:Bool = false
    @State var buttoFoodPressed:Bool = false
    @State var showDialogueBox:Bool = false
    
    var colorHungryBarMin = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var colorHungryBarMax = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    
    static let listDialogue = ["Hello User, Have a nice day!", "Do you want to play with me?", "Hehe, you love to touch my head aren't you?", "My body sure is fluffy"]
    
    @State var randomizeDialogue: String
    
    init() {
        self.randomizeDialogue = PetView.listDialogue.randomElement()!
          
        self.petChecker = GlobalVariables.global.selectedPet
        self.isDog = false
        
        if petChecker == "dog" {
            isDog = true
        } else {
            self.isDog = false
        }
    }
    
    var body: some View {
        
        let timer = Timer.publish(every:1, tolerance: 0.5, on: .main, in: .common).autoconnect()
        
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.top).edgesIgnoringSafeArea(.bottom)
            
            Image("Window")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 230)
                .offset(x: -180, y: -180)
            
            VStack(spacing: 10) {
                //Spacer()
                HStack(spacing: 10) {
                    ZStack {
                        HungryBar(hungryBarWidth: 220, hungryBarHeight: 30, hungryBarCornerRadious: 20, hungryPercentage: hungryPercent, gradientColorLeft: colorHungryBarMin, gradientColorRight: colorHungryBarMax)
                            .offset(y:20)
                            .animation(.spring())
                            .onReceive(timer) {
                                time in
                                if counter == 60 {
                                    decreaseHungryBar()
                                    //timer.upstream.connect().cancel()
                                    
                                } else {
                                    counter += 1
                                }
                            }
                            
                        //Text("Food Level : \(CGFloat(hungryPercent))%")
                        Text("Hungry Level")
                                .offset(y:20)
                                .font(.system(size: 18, weight: .bold))
                    }
                    
                    PetFoodBar(totalPetFood: Int(totalFood), petFoodContainerWidth: 100, petFoodContainerHeight: 30)
                            .offset(y:20)
                }
                Spacer()
                    VStack {
                        ZStack {
                            Button(action: {touchPet()}) {
                                VStack(spacing : 0) {
                                    ZStack {
                                        Image("dialoguebox short")
                                            .resizable()
                                            .frame(width: 350, height: 100)
                                            .offset(x: 75)
                                            .opacity(0)
                                        if showDialogueBox {
                                            ZStack {
                                                Image("dialoguebox short")
                                                    .resizable()
                                                    .frame(width: 200, height: 100)
                                                    .offset(x: 75)
                                                
                                                Text(randomizeDialogue)
                                                    .font(.system(size: 15, weight: .bold))
                                                    .offset(x: 75, y: -5)
                                                    .frame(width: 150, height: 80, alignment: .center)
                                            }
                                        }
                                        Image("Cat (hungry)") //gak kepake, biar button nya segede pet nya aja
                                            .resizable()
                                            .frame(width: 350, height: 100)
                                            .offset(x: 75)
                                            .opacity(0)
                                    }
                                    switch isDog {
                                        case false:
                                            if isTap == true  {
                                                Image("Cat pat")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:50)
                                            } else if isHungry == false || isTap == false {
                                                Image("Cat normal")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:50)
                                            }
                                        default:
                                            if isTap == true  {
                                                Image("Dog pat")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:50)
                                            } else if isHungry == false || isTap == false {
                                                Image("Dog normal")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:50)
                                            }
                                    }
                                }
                            }.offset(y:-180)

                            //test
                            Spacer()
                                
                            Button(action: {foodButtonPressed()}) {
                                
                                ZStack {
                                    switch isDog {
                                        case false:
                                            if isEat == true  {
                                                Image("Cat eating")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:-260)
                                            }
                                        default:
                                            if isEat == true  {
                                                Image("Dog eating")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:-260)
                                            }
                                    }
                                    Image("Pet Food Bowl")
                                        .resizable()
                                        .offset(y:-20)
                                        .frame(width: 150, height: 75)
                                }
                            }.offset(y: 180)
                            if isHungry == true {
                                switch isDog {
                                    case false:
                                        Image("Cat hungry")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350, height: 350)
                                            .font(.system(size: 15))
                                            .offset(x:15, y:-80)
                                    default:
                                        Image("Dog hungry")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350, height: 350)
                                            .font(.system(size: 15))
                                            .offset(x:15, y:-80)
                                }
                            }
                        }
                }
                    .animation(nil)
                    .buttonStyle(StaticButtonStyle())
            }
        }
    }
    
    func touchPet() {
        var touchCounter = 0
        randomizeDialogue = Self.listDialogue.randomElement()!
        
        self.showDialogueBox = true
        touchCounter += 1
        self.isTap = true
        let task = DispatchWorkItem {
            self.showDialogueBox = false
            touchCounter = 0
            self.isTap = false
        }
//        let doTouchPet = DispatchWorkItem(block: {
//            self.showDialogueBox = true
//            self.isEat = true
//        })
//        doTouchPet.cancel()
        
        if touchCounter > 1 {
            task.cancel()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
        }
    }
    
    func decreaseHungryBar() {
        if hungryPercent > 0 {
            if currentHungryPercent - hungryPercent > 0 {
                isHungry = false
                return
            } else {
                hungryPercent -= 0.0416
                currentHungryPercent = hungryPercent
                counter = 0
            }
        } else {
            hungryPercent = 0
            currentHungryPercent = 0
            counter = 0
            isHungry = true
        }
    }
    
    func foodButtonPressed() {
        //hungryPercent = CGFloat.random(in: 1...100)
        self.isEat = true
        self.isHungry = false
        
        let task = DispatchWorkItem {
            self.isEat = false
        }
        
        if(hungryPercent != 100 && totalFood > 0 ) {
            if(hungryPercent + foodBonus > 100) {
                hungryPercent = 100
                totalFood -= 1
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
            } else {
                hungryPercent += foodBonus
                totalFood -= 1
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
            }
        }
        else if (hungryPercent >= 100 && totalFood != 0) {
            hungryPercent = 100
            self.isEat = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
