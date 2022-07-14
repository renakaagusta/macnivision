//
//  AddJournalView.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct AddJournalView: View {
    @EnvironmentObject var addJournalViewModel: JournalAddViewModel
    @Environment(\.self) var env
    
    @FocusState var isInputActive: Bool
    @State var isAngrySelected: Bool = false
    @State var isSadSelected: Bool = false
    @State var isWorrySelected: Bool = false
    @State var isSurprisedSelected: Bool = false
    @State var isHappySelected: Bool = false
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack{
            greenbackground
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
                            
                            Text("\(addJournalViewModel.emotion.map{String($0)}.joined(separator: ", "))")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                        }.padding(.leading)
                        
                        
                        HStack{
                            
                            Group{
                                VStack{
                                    Button{
                                        isAngrySelected = !isAngrySelected
                                        if isAngrySelected{
                                            if addJournalViewModel.emotion.count<2{
                                                addJournalViewModel.emotion += ["Angry"]
                                            } else{
                                                showAlert(title: "sorry you can only choose 2 emotions :'(")
                                            }
                                            
                                        } else{
                                            addJournalViewModel.emotion = addJournalViewModel.emotion.filter(){$0 != "Angry"}
                                        }
                                    }
                                    label:{
                                        Image("Angry")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                
                                VStack{
                                    Button{
                                        isSadSelected = !isSadSelected
                                        if isSadSelected{
                                            if addJournalViewModel.emotion.count<2{
                                                addJournalViewModel.emotion += ["Sad"]
                                            } else{
                                                showAlert(title: "sorry you can only choose 2 emotions :'(")
                                            }
                                        } else{
                                            addJournalViewModel.emotion = addJournalViewModel.emotion.filter(){$0 != "Sad"}
                                        }
                                    }
                                    label:{
                                        Image("Sad")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                
                                VStack{
                                    Button{
                                        isWorrySelected = !isWorrySelected
                                        if isWorrySelected{
                                            if addJournalViewModel.emotion.count<2{
                                                addJournalViewModel.emotion += ["Worry"]
                                            } else{
                                                showAlert(title: "sorry you can only choose 2 emotions :'(")
                                            }
                                        } else{
                                            addJournalViewModel.emotion = addJournalViewModel.emotion.filter(){$0 != "Worry"}
                                        }
                                    }
                                    label:{
                                        Image("Worry")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                
                                VStack{
                                    Button{
                                        isHappySelected = !isHappySelected
                                        if isHappySelected{
                                            if addJournalViewModel.emotion.count<2{
                                                addJournalViewModel.emotion += ["Happy"]
                                            } else{
                                                showAlert(title: "sorry you can only choose 2 emotions :'(")
                                            }
                                        } else{
                                            addJournalViewModel.emotion = addJournalViewModel.emotion.filter(){$0 != "Happy"}
                                        }
                                    }
                                    label:{
                                        Image("Happy")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                
                                VStack{
                                    Button{
                                        isSurprisedSelected = !isSurprisedSelected
                                        if isSurprisedSelected{
                                            if addJournalViewModel.emotion.count<2{
                                                addJournalViewModel.emotion += ["Surprised"]
                                            } else{
                                                showAlert(title: "sorry you can only choose 2 emotions :'(")
                                            }
                                        } else{
                                            addJournalViewModel.emotion = addJournalViewModel.emotion.filter(){$0 != "Surprised"}
                                        }
                                    }
                                    label:{
                                        Image("Surprised")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
                .frame(width: 350, height: 118)
                .padding(.horizontal)
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text(alertTitle))
            })

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
                        
                        TextEditor(text: $addJournalViewModel.diary)
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
                        
                        TextEditor(text: $addJournalViewModel.note)
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
                .alert(isPresented: $showAlert, content: {
                        return Alert(title: Text(alertTitle))
                })
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(Date.now, format: .dateTime.day().month().year()))
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func showAlert(title: String){
        alertTitle =  title
        showAlert.toggle()
    }
}

struct AddJournalView_Previews: PreviewProvider {
    static var previews: some View {
        AddJournalView()
            .environmentObject(JournalAddViewModel())
    }
}


extension AddJournalView{
    
    private var doneButton: some View{
        Button{
            if addJournalViewModel.diary.count < 5{
                showAlert(title: "you haven't describe your emotion")
            }
            else{
                //this should be a place to add data
                addJournalViewModel.entryDate = Date()
            }
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

extension Array where Element: Equatable {
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }

}

