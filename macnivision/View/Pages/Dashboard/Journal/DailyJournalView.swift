//
//  DailyJournalView.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct DailyJournalView: View {
    @State var date: String
    @State var month: String
    @State var year: String
    
    var body: some View {
        ZStack{
            Color.softgraybackground
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Your Daily Journal")
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Spacer()
                }.padding()
                
                ScrollView{
                    CardDailyJournalItem(time: "14:00",
                                         date: date,
                                         month: month,
                                         year: year,
                                         emotion: "Sad",
                                         diary: "Aku lagi ada masalah di tempat kerja. I’m so stressedddd goshhh mana pas nyampe ban motor pecah punn semoga mood ku tetap terjaga dah. huhuhu …",
                                         notes: "Karena lagi pusing banget aku cuma berharap hari ini bisa berakhir dengan baik, sambil mencari solusi juga, hopefully aku nggak overthinking"
                    )
                    
                    CardDailyJournalItem(time: "12:00",
                                         date: date,
                                         month: month,
                                         year: year,
                                         emotion: "Happy",
                                         diary: "Makan siangku sangad enakssss luv sangadddd. Moodku jadi membaikk thanks nasi padang <3",
                                         notes: "Semoga besok bakal lebih baik lagi! aku percaya aku pasti bisa")
                    
                    CardDailyJournalItem(time: "11:30",
                                         date: date,
                                         month: month,
                                         year: year,
                                         emotion: "Worry",
                                         diary: "Sepertinya anxiety ku kambuh deh. daritadi malem rasanya gak bisa tidur… aku jadi cemas, semoga aja gak keja…",
                                         notes: "aku berharap aku bisa lebih tenang lagi dan nggak gampang panik! semoga aku bisa")
                }
                
            }
        }
        .navigationBarTitle(Text("\(date) \(month) \(year)"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DailyJournalView_Previews: PreviewProvider {
    static var previews: some View {
        DailyJournalView(date: "22", month: "JUNE", year: "2022").preferredColorScheme(scheme)
    }
}
