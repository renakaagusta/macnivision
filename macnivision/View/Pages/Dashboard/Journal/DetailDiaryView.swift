//
//  DetailDiaryView.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct DetailDiaryView: View {
    @State var time: String
    @State var date: String
    @State var month: String
    @State var year: String
    
    @State var emotion: String
    @State var diary: String
    @State var notes: String
    
    var body: some View {
        NavigationView{
            VStack{
                Image(emotion)
                    .resizable()
                    .frame(width: 101, height: 101)
                
                Text("You were feeling \(emotion) at \(time)")
                    .font(.headline)
                    .padding(.vertical)
                
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
                            Text(diary)
                                .font(.subheadline)
                                .padding()
                                .background(.white)
                                .foregroundColor(.black)

                            Spacer()
                        }
                        .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder()
                                        .foregroundColor(greenbutton)
                                )
                        .frame(height: 159)
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
                        
                        VStack{
                            Text(notes)
                                .font(.subheadline)
                                .padding()
                                .background(.white)
                                .foregroundColor(.black)

                            Spacer()
                        }
                        .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder()
                                        .foregroundColor(greenbutton)
                                )
                        .frame(height: 159)
                        
                    }
                }
                .frame(width: 350, height: 225)
                .padding(.horizontal)
                .navigationBarTitle(Text("\(date) \(month) \(year)"))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct DetailDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDiaryView(time: "14:00",
                        date: "22",
                        month: "JUNE",
                        year: "2022",
                        emotion: "Sad",
                        diary: "Aku lagi ada masalah di tempat kerja. I’m so stressedddd goshhh mana pas nyampe ban motor pecah punn semoga mood ku tetap terjaga dah. huhuhu …",
                        notes: "Karena lagi pusing banget aku cuma berharap hari ini bisa berakhir dengan baik, sambil mencari solusi juga, hopefully aku nggak overthinking")
    }
}

