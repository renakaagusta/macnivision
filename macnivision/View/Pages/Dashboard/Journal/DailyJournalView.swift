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
    var dailyJournals = GetJournalModelView().journals
    
    var body: some View {
        ZStack{
            softgraybackground
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Your Daily Journal")
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Spacer()
                }.padding()
                
                ScrollView{
                    
                    let selectedDay = getSelectedDate(year: Int(year) ?? 2022,
                                                      month: getMonthNumber(monthStr: month),
                                                      date: Int(date) ?? 1)
                    
                    let selectedDayJournals = dailyJournals.filter({$0.entryDate.fullDate() == selectedDay.fullDate()})
                    
                    ForEach(selectedDayJournals){ journal in
                        CardDailyJournalItem(journalItem: journal,
                                             journalId: journal.id)
                        .padding(.bottom)
                    }
                    
                }
                
            }
        }
        .navigationBarTitle(Text("\(date) \(month) \(year)"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DailyJournalView_Previews: PreviewProvider {
    static var dailyJournals = GetJournalModelView().journals
    
    static var previews: some View {
        DailyJournalView(date: "4", month: "July", year: "2022")
    }
}


extension DailyJournalView{
    func getMonthNumber(monthStr: String) -> Int {
        var monthNumber:Int = 0
        
        if monthStr == "January"{
            monthNumber = 1
        }
        else if monthStr == "February"{
            monthNumber = 2
        }
        else if monthStr == "March"{
            monthNumber = 3
        }
        else if monthStr == "April"{
            monthNumber = 4
        }
        else if monthStr == "May"{
            monthNumber = 5
        }
        else if monthStr == "June"{
            monthNumber = 6
        }
        else if monthStr == "July"{
            monthNumber = 7
        }
        else if monthStr == "August"{
            monthNumber = 8
        }
        else if monthStr == "September"{
            monthNumber = 9
        }
        else if monthStr == "October"{
            monthNumber = 10
        }
        else if monthStr == "November"{
            monthNumber = 11
        }
        else if monthStr == "December"{
            monthNumber = 12
        }
        
        return monthNumber
    }
    
    func getSelectedDate(year: Int, month: Int, date: Int)-> Date{
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = date
        
        
        let userCalendar = Calendar(identifier: .gregorian)
        let selectedDay = userCalendar.date(from: dateComponents)
        return selectedDay ?? Date()
    }
}
