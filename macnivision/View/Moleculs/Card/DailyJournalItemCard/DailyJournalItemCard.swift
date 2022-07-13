//
//  CardDailyJournalItem.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct CardDailyJournalItem: View {
    @State var time: String
    @State var date: String
    @State var month: String
    @State var year: String
    
    @State var emotion: String
    @State var diary: String
    @State var notes: String
    
    @State var showDetailDiary = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: -0.323, green: 0.675, blue: 0.544), lineWidth: 2)
                .frame(width: 357, height: 105)
                .background(.white)
            
            HStack{
                Image(emotion)
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Divider()
                
                VStack{
                    HStack{
                        Text(time)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    Text(diary)
                        .font(.caption)
                        .foregroundColor(.black)
                        
                }
                .frame(width: 250, height: 105)
            }
        }
        .onTapGesture {
            self.showDetailDiary.toggle()
        }
        .sheet(isPresented: $showDetailDiary){
            DetailDiaryView(time: time,
                            date: date,
                            month: month,
                            year: year,
                            emotion: emotion,
                            diary: diary,
                            notes: notes)
        }
    }
}

struct CardDailyJournalItem_Previews: PreviewProvider {
    static var previews: some View {
        CardDailyJournalItem(time: "14:00",
                             date: "22",
                             month: "JUNE",
                             year: "2022",
                             emotion: "Sad",
                             diary: "Aku lagi ada masalah di tempat kerja. I’m so stressedddd goshhh mana pas nyampe ban motor pecah punn semoga mood ku tetap terjaga dah. huhuhu …",
                             notes: "Karena lagi pusing banget aku cuma berharap hari ini bisa berakhir dengan baik, sambil mencari solusi juga, hopefully aku nggak overthinking")
    }
}
