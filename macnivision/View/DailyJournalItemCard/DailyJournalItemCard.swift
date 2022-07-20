//
//  CardDailyJournalItem.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct DailyJournalItemCard: View {
    var journalItem: JournalDummy
    var journalId: Int
    
    @State var showDetailDiary = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(greenstroke, lineWidth: 2)
                .frame(width: 357, height: 106)
                .background(.white)
            
            HStack{
                VStack{
                    HStack{
                        HStack{
                            ForEach(journalItem.emotion, id:\.self) { value in
                                Image(value)
                                    .resizable()
                                    .frame(width: 27, height: 27)
                            }
                        }
                        
                        Spacer()
                        Text("\(journalItem.entryDate.formatted(date: .omitted, time: .shortened))")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    Text(journalItem.diary)
                        .font(.caption)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        
                }
                .padding(.horizontal)
                .frame(width: 357, height: 106)
            }
        }
        .onTapGesture {
            self.showDetailDiary.toggle()
        }
        .sheet(isPresented: $showDetailDiary){
            DetailDiaryView(journalDate: "\(journalItem.entryDate.formatted(date: .complete, time: .omitted))",
                            emotion: journalItem.emotion,
                            time: "\(journalItem.entryDate.formatted(date: .omitted, time: .shortened))",
                            diary: journalItem.diary,
                            note: journalItem.note)
        }
    }
}

struct CardDailyJournalItem_Previews: PreviewProvider {
    static var previews: some View {
        DailyJournalItemCard(journalItem: GetJournalModelView().journals[0], journalId: 0)
    }
}

