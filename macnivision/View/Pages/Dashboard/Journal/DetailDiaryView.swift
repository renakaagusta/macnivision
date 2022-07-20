//
//  DetailDiaryView.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct DetailDiaryView: View {
    @State var journalDate : String
    @State var emotion : [String]
    @State var time : String
    @State var diary : String
    @State var note : String
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack{
                    ForEach(emotion, id:\.self) { value in
                        Image(value)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                }
                .padding(.top)
                
                Text("You were feeling \(emotion.map{String($0)}.joined(separator: " and "))")
                    .font(.headline)
                    .padding([.top, .leading, .trailing])
                
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
                        
                        VStack{
                            ScrollView{
                                Text(diary)
                                    .padding()
                                    .frame(width: 360)
                                    .font(.subheadline)
                                    .background(.white)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder()
                                        .foregroundColor(greenbutton)
                                )
                        .frame(height: 159)
                    }
                }
                
                ZStack{
                    VStack{
                        HStack{
                            Text("What positive thing to you want to do next?")
                                .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding(.leading)
                            Spacer()
                        }
                        
                        VStack{
                            ScrollView{
                                Text(note)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    .frame(width: 360)
                                    .font(.subheadline)
                                    .background(.white)
                                    .foregroundColor(.black)

                                Spacer()
                            }
                        }
                        .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder()
                                        .foregroundColor(greenbutton)
                                )
                        .frame(height: 159)
                    }
                }
                .navigationBarTitle(Text("\(journalDate) at \(time)"))
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
            
        }
        .padding(.vertical)
    }
}

struct DetailDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDiaryView(journalDate: "Jul 13, 2022",
                        emotion: ["Sad", "Worry"],
                        time: "04:24 PM",
                        diary: "Makan siangku sangad enakssss luv sangadddd. Moodku jadi membaikk thanks nasi padang <3",
                        note: " ")
    }
}

