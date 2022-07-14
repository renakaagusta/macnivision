//
//  DetailDiaryView.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct DetailDiaryView: View {
    var journalItem: JournalDummy
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack{
                    ForEach(journalItem.emotion, id:\.self) { value in
                        Image(value)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                }
                .padding(.top)
                
                Text("You were feeling \(journalItem.emotion.map{String($0)}.joined(separator: " and ")) at \(journalItem.entryDate.formatted(date: .omitted, time: .shortened))")
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
                            Text(journalItem.diary)
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
                            Text(journalItem.note)
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
                .navigationBarTitle(Text("\(journalItem.entryDate.formatted(date: .complete, time: .omitted))"))
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
            
        }
        .padding(.vertical)
    }
}

struct DetailDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDiaryView(journalItem: GetJournalModelView().journals[2])
    }
}
