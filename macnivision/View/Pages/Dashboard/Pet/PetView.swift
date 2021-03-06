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
    @State var totalFood: CGFloat = 100
    
    @State private var counter = 0
    var foodBonus: CGFloat = 25
    
    @State var isDog:Bool = false
    @State var isHungry:Bool = false
    @State var isEat:Bool = false
    @State var isTap:Bool = false
    @State var showDialogueBox:Bool = false
    
    var colorHungryBarMin = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var colorHungryBarMax = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    
    let listDialogue = ["Hello User, Have a nice day!", "Do you want to play with me?", "Hehe, you love to touch my head aren't you?", "My body sure is fluffy"]
    
    let randomizeDialogue: String
    
    init() {
        self.randomizeDialogue = listDialogue.randomElement()!
    }

    var body: some View {
        
        var timer = Timer.publish(every:1, tolerance: 0.5, on: .main, in: .common).autoconnect()
        
//        NavigationView {
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
                                    if counter == 1 {
                                        decreaseHungryBar()
                                        //timer.upstream.connect().cancel()
                                        
                                    } else {
                                        counter += 1
                                    }
                                }
                                
                            //Text("Food Level : \(Int(hungryPercent))%")
                            Text("Hungry Level")
                                    .offset(y:20)
                                    .font(.system(size: 20, weight: .bold))
                        }
                        
                        PetFoodBar(totalPetFood: Int(totalFood), petFoodContainerWidth: 100, petFoodContainerHeight: 30)
                                .offset(y:20)
                        
                    }
                    Spacer()
                    VStack {
                        Button(action: {isDog.toggle()}) {
                            if isDog == true {
                                Text("Cat")
                            } else {
                                Text("Dog")
                            }
                        }
                        //.offset(y:50)
                        
                    }
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
                                            .offset(x: 75)
                                            .frame(width: 150, height: 80, alignment: .center)
                                    }
                                }
                            }
                            
                            ZStack {
                                
                                Image("Cat (smile)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350, height: 350)
                                    .font(.system(size: 15))
                                    .offset(x:15, y:50)
                                    .opacity(isDog ?  0 : 1)
                                
                                Image("Dog (smile)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350, height: 350)
                                    .font(.system(size: 15))
                                    .offset(x:15, y:50)
                                    .opacity(isDog ? 1 : 0)
                            }
                        }
                    }.animation(nil)
          
                    //test
                    Spacer()
                    Button(action: {foodButtonPressed()}) {
                        Image("Pet Food Bowl")
                            .resizable()
                            .offset(y:-20)
                            .frame(width: 150, height: 75)
                    }

                }
            }
        //}
    }
    
    func touchPet() {
        self.showDialogueBox = false
        self.showDialogueBox = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
            {self.showDialogueBox = false}
    }
    
    func decreaseHungryBar() {
        if hungryPercent > 0 {
            if   currentHungryPercent - hungryPercent > 0 {
                isHungry == false
                
                return
            } else {
                hungryPercent -= 4.16
                currentHungryPercent = hungryPercent
                counter = 0
            }
        } else {
            hungryPercent = 0
            currentHungryPercent = 0
            counter = 0
            isHungry == true
        }
    }
    
    func foodButtonPressed() {
        //hungryPercent = CGFloat.random(in: 1...100)
        if(hungryPercent != 100 && totalFood > 0 ) {
            if(hungryPercent + foodBonus > 100) {
                hungryPercent = 100
                totalFood -= 1
            } else {
                hungryPercent += foodBonus
                totalFood -= 1
            }
        }
        else if (hungryPercent > 100 || totalFood == 0) {
            hungryPercent = 100
        }
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
