//
//  PetView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct PetView: View {
    
    //Object for the Pet
    @State var getPet: Pet = Pet(
        id: 0,
        recordId: "",
        userId: "",
        hungryLevel: 0.0,
        foodAmount: 0,
        typePet: .dog
    )
    
    @State var getUser: User = User (
        id: 0,
        recordId: "",
        nickname: ""
    )
    
    //Variable to control Food & Hunger System
    @State var currentHungryPercent: Float = 0 //to contain and check current hungry level for decreasing level system
    @State private var counter = 0 //count how much tap
    @State var totalFood: Int = 0 //PetGlobalVariable.petGlobal.petFoodAmount
    var foodBonus: CGFloat = 1 //Amount percentage oh healthbar restore when user feed the pet
    
    //Condition to control Pet Emotion
    @State var isDog:Bool
    @State var isHungry:Bool = true
    @State var isEat:Bool = false
    @State var isTap:Bool = false
    @State var buttoFoodPressed:Bool = false
    @State var showDialogueBox:Bool = false
    
    //Color for Hunger Bar
    var colorHungryBarMin = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var colorHungryBarMax = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    
    //Dialogue list for pet
    static let listDialogue = ["Hi... Have a nice day!", "Do you want to play with me?", "Hehe, you love to touch my head aren't you?", "My body sure is fluffy"]
    static let listFeedDialogue = ["Yummy!!!", "Taste so good", "Yum yum...", "Yayy eat...", "Thanks for feeding me"]
//    static let listFullDialogue = ["I'm Full", "Thanks for feeding me, now i'm full", "Full tummy happy life"]
    
    //To control randomization of the dialogue
    @State var randomizeDialogue: String
    @State var randomizeFeedDialogue: String
//    @State var randomizePetFullDialogue: String
    
    init() {
        self.randomizeDialogue = PetView.listDialogue.randomElement()!
        self.randomizeFeedDialogue = PetView.listFeedDialogue.randomElement()!
//        self.randomizePetFullDialogue = PetView.listFullDialogue.randomElement()!
          
        self.isDog = false
    }
    
    var body: some View {
        
        //Timer spesificly to store time for hungry system
        let timer = Timer.publish(every:1, tolerance: 0.5, on: .main, in: .common).autoconnect()
        
        ZStack {
            //Background image
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.top).edgesIgnoringSafeArea(.bottom)
            
            //Window image
            Image("Window")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 230)
                .offset(x: -180, y: -180)
            
            
            VStack(spacing: 10) {
                //Spacer()
                HStack(spacing: 10) {
                    //Stack for Hungry Bar
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
                    
                    //Food Bar & Container
                    PetFoodBar(totalPetFood: getPet.foodAmount, petFoodContainerWidth: 100, petFoodContainerHeight: 30)
                            .offset(y:20)
                }
                Spacer()
                    VStack {
                        ZStack {
                            //Button for touching the Pet
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
                                                if isHungry == true && getPet.foodAmount != 0 {
                                                    Text("I'm hungry, please feed me")
                                                        .font(.system(size: 15, weight: .bold))
                                                        .offset(x: 75, y: 47)
                                                        .frame(width: 150, height: 80, alignment: .center)
                                                        .multilineTextAlignment(.center)
                                                } else if getPet.foodAmount > 0 {
                                                    Text(randomizeDialogue)
                                                        .font(.system(size: 15, weight: .bold))
                                                        .offset(x: 75, y: 47)
                                                        .frame(width: 150, height: 80, alignment: .center)
                                                        .multilineTextAlignment(.center)
                                                }
                                                
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
                                                if isTap == true && isHungry == false {
                                                    Image("Dog pat")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 350, height: 350)
                                                        .font(.system(size: 15))
                                                        .offset(x:15, y:50)
                                                } else if isTap == false && isHungry == false {
                                                    Image("Dog normal")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 350, height: 350)
                                                        .font(.system(size: 15))
                                                        .offset(x:15, y:50)
                                                } else if isHungry == true {
                                                    Image("Dog hungry")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 350, height: 350)
                                                        .font(.system(size: 15))
                                                        .offset(x:15, y:50)
                                                }
                                            default:
                                                if isTap == true && isHungry == false {
                                                    Image("Cat pat")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 350, height: 350)
                                                        .font(.system(size: 15))
                                                        .offset(x:15, y:50)
                                                } else if isTap == false && isHungry == false {
                                                    Image("Cat normal")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 350, height: 350)
                                                        .font(.system(size: 15))
                                                        .offset(x:15, y:50)
                                                } else if isHungry == true {
                                                    Image("Cat hungry")
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
                                        if isEat == true && getPet.foodAmount != 0  {
                                                ZStack {
                                                    //Dialogue box maem
                                                    Image("dialoguebox short")
                                                        .resizable()
                                                        .frame(width: 200, height: 100)
                                                        .offset(x: 75, y: -500)
                                                    
//                                                    //Text dialogue
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
                                                    .offset(x:15, y:-260)
                                        } else if getPet.foodAmount == 0 {
                                            //Dialogue box maem
                                            Image("dialoguebox short")
                                                .resizable()
                                                .frame(width: 200, height: 100)
                                                .offset(x: 75, y: -500)
                                            
                                            //Text dialogue
                                            Text("No Pet Food Left. Please fill your Journal to get Pet Food")
                                                .font(.system(size: 15, weight: .bold))
                                                .offset(x: 75, y: -500)
                                                .frame(width: 150, height: 80, alignment: .center)
                                                .multilineTextAlignment(.center)
                                        }
                                        default:
                                        if isEat == true && getPet.foodAmount != 0  {
                                                ZStack {
                                                    //Dialogue box maem
                                                    Image("dialoguebox short")
                                                        .resizable()
                                                        .frame(width: 200, height: 100)
                                                        .offset(x: 75, y: -500)
                                                    
//                                                    //Text dialogue
                                                    Text(randomizeFeedDialogue)
                                                        .font(.system(size: 15, weight: .bold))
                                                        .offset(x: 75, y: -505)
                                                        .frame(width: 150, height: 80, alignment: .center)
                                                        .multilineTextAlignment(.center)
                                                }
                                                Image("Cat eating")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 350, height: 350)
                                                    .font(.system(size: 15))
                                                    .offset(x:15, y:-260)
                                        } else if getPet.foodAmount == 0 {
                                            //Dialogue box maem
                                            Image("dialoguebox short")
                                                .resizable()
                                                .frame(width: 200, height: 100)
                                                .offset(x: 75, y: -500)
                                            
                                            //Text dialogue
                                            Text("No Pet Food Left. Please fill your Journal to get Pet Food")
                                                .font(.system(size: 15, weight: .bold))
                                                .offset(x: 75, y: -500)
                                                .frame(width: 150, height: 80, alignment: .center)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                    Image("Pet Food Bowl")
                                        .resizable()
                                        .offset(y:-20)
                                        .frame(width: 150, height: 75)
                                }
                            }.offset(y: 180)
                            
                        }
                }
                    .animation(nil)
                    .buttonStyle(StaticButtonStyle())
            }
        }
    }
    
    //Function for button touchPet
    func touchPet() {
        var touchCounter = 0
        randomizeDialogue = Self.listDialogue.randomElement()!
        
        if getPet.foodAmount != 0 {
            self.showDialogueBox = true
            self.isTap = true
        }
        
        touchCounter += 1
        
        let task = DispatchWorkItem {
            self.showDialogueBox = false
            touchCounter = 0
            self.isTap = false
        }
        
        if touchCounter > 1 {
            task.cancel()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: task)
        }
    }
    
    //Function to decrease the hungry bar level
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
    
    //Function for button food
    func foodButtonPressed() {
        randomizeFeedDialogue = Self.listFeedDialogue.randomElement()!
        
        let task = DispatchWorkItem {
            self.isEat = false
        }
        
        if(getPet.hungryLevel != 100 && getPet.foodAmount > 0 ) {
            
            self.isEat = true
            self.isHungry = false
            if(getPet.hungryLevel + Float(foodBonus) > 100) {
                getPet.hungryLevel = 100
                getPet.foodAmount -= 1
            } else {
                getPet.hungryLevel += Float(foodBonus)
                getPet.foodAmount -= 1
            }
        }
        else if (getPet.hungryLevel >= 100 && getPet.foodAmount != 0) {
            getPet.hungryLevel = 100
            self.isEat = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView().preferredColorScheme(.light)
    }
}

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
