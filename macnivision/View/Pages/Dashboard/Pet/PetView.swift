//
//  PetView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct PetView: View {
    
    //@ObservedObject var globalPet = PetGlobalVariable.petGlobal
    
    @State var getPet: Pet = Pet(
        id: 0,
        recordId: "",
        userId: 0,
        hungryLevel: 0.0,
        foodAmount: 0,
        typePet: .dog
    )
    
    @State var currentHungryPercent: Float = 0 //to contain and check current hungry level for decreasing level system
    @State private var counter = 0 //count how much tap
    @State var totalFood: Int = 0 //PetGlobalVariable.petGlobal.petFoodAmount
    var foodBonus: CGFloat = 1
    
    //kondisi emotion pet
    //@State var petChecker: String
    @State var isDog:Bool
    @State var isHungry:Bool = true
    @State var isEat:Bool = false
    @State var isTap:Bool = false
    @State var buttoFoodPressed:Bool = false
    @State var showDialogueBox:Bool = false
    
    var colorHungryBarMin = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var colorHungryBarMax = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    
    //Dialogue for pet
    static let listDialogue = ["Hi... Have a nice day!", "Do you want to play with me?", "Hehe, you love to touch my head aren't you?", "My body sure is fluffy"]
    static let listFeedDialogue = ["Yummy!!!", "Taste so good", "Yum yum...", "Yayy eat...", "Thanks for feeding me"]
    static let listFullDialogue = ["I'm Full", "Thanks for feeding me, now i'm full", "Full tummy happy life"]
    
    //For
    @State var randomizeDialogue: String
    @State var randomizeFeedDialogue: String
    
    init() {
        self.randomizeDialogue = PetView.listDialogue.randomElement()!
        self.randomizeFeedDialogue = PetView.listFeedDialogue.randomElement()!
          
        self.isDog = false
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
                        HungryBar(hungryBarWidth: 220, hungryBarHeight: 30, hungryBarCornerRadious: 20, hungryPercentage: CGFloat(getPet.hungryLevel), gradientColorLeft: colorHungryBarMin, gradientColorRight: colorHungryBarMax)
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
                    
                    PetFoodBar(totalPetFood: getPet.foodAmount, petFoodContainerWidth: 100, petFoodContainerHeight: 30)
                            .offset(y:20)
                }
                Spacer()
                    VStack {
                        ZStack {
                            Button(action: {touchPet()}) {
                                VStack(spacing : 0) {
                                    ZStack {
                                        //Abaikan
                                        Image("dialoguebox short")
                                            .resizable()
                                            .frame(width: 350, height: 100)
                                            .offset(x: 75)
                                            .opacity(0)
                                        
                                        //dialog pet touch
                                        if showDialogueBox {
                                            ZStack {
                                                //Dialogue box
                                                Image("dialoguebox short")
                                                    .resizable()
                                                    .frame(width: 200, height: 100)
                                                    .offset(x: 75, y:50)
                                                
                                                //Text dialogue
                                                Text(randomizeDialogue)
                                                    .font(.system(size: 15, weight: .bold))
                                                    .offset(x: 75, y: 47)
                                                    .frame(width: 150, height: 80, alignment: .center)
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                        Image("Cat hungry") //gak kepake, biar button nya segede pet nya aja. Biarin aja
                                            .resizable()
                                            .frame(width: 350, height: 100)
                                            .offset(x: 75)
                                            .opacity(0)
                                    }
                                    switch getPet.typePet {
                                        case .dog:
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
                                            default:
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
                                    }
                                }
                            }.offset(y:-180)

                            //test
                            Spacer()
                                
                            Button(action: {foodButtonPressed()}) {
                                
                                ZStack {
                                    
                                    //Image petnya makan
                                    switch getPet.typePet {
                                    case .dog:
                                            if isEat == true  {
                                                ZStack {
                                                    //Dialogue box maem
                                                    Image("dialoguebox short")
                                                        .resizable()
                                                        .frame(width: 200, height: 100)
                                                        .offset(x: 75, y: -300)
                                                    
                                                    //Text dialogue
                                                    Text(randomizeFeedDialogue)
                                                        .font(.system(size: 15, weight: .bold))
                                                        .offset(x: 75, y: -505)
                                                        .frame(width: 150, height: 80, alignment: .center)
                                                        .multilineTextAlignment(.center)
                                                }
                                                Image("Dog eating")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:75, y:-505)
                                            }
                                        default:
                                            if isEat == true  {
                                                ZStack {
                                                    //Dialogue box maem
                                                    Image("dialoguebox short")
                                                        .resizable()
                                                        .frame(width: 200, height: 100)
                                                        .offset(x: 75, y: -500)
                                                    
                                                    //Text dialogue maem
                                                    Text(randomizeFeedDialogue)
                                                        .font(.system(size: 15, weight: .bold))
                                                        .offset(x: 75, y: -505)
                                                        .frame(width: 150, height: 80, alignment: .center)
                                                        .multilineTextAlignment(.center)
                                                }
                                                //Biarin aja ini
                                                Image("Cat eating")
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
                                ZStack {
                                    //Dialogue box laper
                                    Image("dialoguebox short")
                                        .resizable()
                                        .frame(width: 200, height: 100)
                                        .offset(x: 75, y: -300)
                                    
                                    //Text dialogue laper
                                    Text("I'm Hungry, please feed me")
                                        .font(.system(size: 15, weight: .bold))
                                        .offset(x: 75, y: -302)
                                        .frame(width: 150, height: 80, alignment: .center)
                                        .multilineTextAlignment(.center)
                                }
                                
                                //Image kalau petnya laper
                                switch getPet.typePet {
                                    case .dog:
                                            Image("Dog hungry")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 350, height: 350)
                                                .font(.system(size: 15))
                                                .offset(x:15, y:-80)
                                        default:
                                            Image("Cat hungry")
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
        
        if touchCounter > 1 {
            task.cancel()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
        }
    }
    
    func decreaseHungryBar() {
        if getPet.hungryLevel > 0 {
            if currentHungryPercent - getPet.hungryLevel > 0 {
                isHungry = false
                return
            } else {
                getPet.hungryLevel -= 0.0416
                currentHungryPercent = getPet.hungryLevel
                counter = 0
            }
        } else {
            getPet.hungryLevel = 0
            currentHungryPercent = 0
            counter = 0
            isHungry = true
        }
    }
    
    func foodButtonPressed() {
        //hungryPercent = CGFloat.random(in: 1...100)
        randomizeFeedDialogue = Self.listFeedDialogue.randomElement()!
        let task = DispatchWorkItem {
            self.isEat = false
        }
        
        if(getPet.hungryLevel != 100 && totalFood > 0 ) {
            
            self.isEat = true
            self.isHungry = false
            if(getPet.hungryLevel + Float(foodBonus) > 100) {
                
                getPet.hungryLevel = 100
                totalFood -= 1
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
            } else {
                getPet.hungryLevel += Float(foodBonus)
                totalFood -= 1
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
            }
        }
        else if (getPet.hungryLevel >= 100 && totalFood != 0) {
            getPet.hungryLevel = 100
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
