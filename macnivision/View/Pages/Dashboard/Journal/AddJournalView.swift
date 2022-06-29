//
//  AddJournalView.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct AddJournalView: View {
    @ObservedObject var global = GlobalVariables.global
    @FocusState var isInputActive: Bool
    
    var body: some View {
        ZStack{
            Color.greenbackground
                .ignoresSafeArea()
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20.0)
                        .foregroundColor(Color.white)
                    
                    VStack{
                        HStack{
                            Text("What do you feel now? ")
                                .fontWeight(.bold)
                                .foregroundColor(Color.gray)
                            
                            Text("\(global.emotion)")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                        }.padding(.leading)
                        
                        
                        HStack{
                            emotionButton(emotionType: "Angry")
                            emotionButton(emotionType: "Sad")
                            emotionButton(emotionType: "Worry")
                            emotionButton(emotionType: "Surprised")
                            emotionButton(emotionType: "Happy")
                        }
                    }
                }
                .frame(width: 350, height: 118)
                .padding(.horizontal)

                ZStack{
                    RoundedRectangle(cornerRadius: 20.0)
                        .frame(width: 350, height: 225)
                        .foregroundColor(Color.white)
                    
                    VStack{
                        HStack{
                            Text("Can you tell me more?")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                            Spacer()
                        }
                        
                        TextEditor(text: $global.diary)
                            .padding(.horizontal)
                            .font(.headline)
                            .frame(height: 159)
                            .colorMultiply(Color.gray)
                            .opacity(0.3)
                            .foregroundColor(Color.black)
                            .focused($isInputActive)
                            .toolbar{
                                ToolbarItemGroup(placement: .keyboard) {
                                                        Spacer()

                                                        Button("Done") {
                                                            isInputActive = false
                                                        }
                                                    }
                            }
                    }
                }
                .frame(width: 350, height: 225)
                .padding(.horizontal)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20.0)
                        .frame(width: 350, height: 225)
                        .foregroundColor(Color.white)
                    
                    VStack{
                        HStack{
                            Text("What positive thing to you want to do next?")
                                .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                            Spacer()
                        }
                        
                        TextEditor(text: $global.notes)
                            .padding(.horizontal)
                            .font(.headline)
                            .frame(height: 159)
                            .colorMultiply(Color.gray)
                            .opacity(0.3)
                            .foregroundColor(Color.black)
                            .focused($isInputActive)
                            .toolbar{
                                ToolbarItemGroup(placement: .keyboard) {
                                                        Spacer()

                                                        Button("Done") {
                                                            isInputActive = false
                                                        }
                                                    }
                            }
                    }
                }
                .frame(width: 350, height: 225)
                .padding(.horizontal)
                
                VStack{
                    Spacer()
                    doneButton
                }
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(Date.now, format: .dateTime.day().month().year()))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddJournalView_Previews: PreviewProvider {
    static var previews: some View {
        AddJournalView()
    }
}

struct emotionButton: View{
    @ObservedObject var global = GlobalVariables.global
    
    var emotionType: String
    var body: some View{
        Button{
            global.emotion = emotionType
        }
        label:{
            Image(emotionType)
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

extension AddJournalView{
    
    private var doneButton: some View{
        Button{
            //mainView()
        }
        label:{
            Text("Done")
                .fontWeight(.bold)
                .frame(width: 322, height: 54)
                .background(greenbutton)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
    }
}
