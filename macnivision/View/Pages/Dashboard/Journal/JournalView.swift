//
//  JournalView.swift
//  macnivision
//
//  Created by Theresia Saputri on 14/07/22.
//

import SwiftUI

struct JournalView: View {
    
    var gridItemLayout = [GridItem(.adaptive(minimum: 50))]
    @ObservedObject var global = GlobalVariables.global
    var dailyJournals = GetJournalModelView().journals
    
    
    @State private var date = Date()
    @State var monthSelection = Date().monthName()
    @State var yearSelection = Date().yearName()
    @State var dateComponents = DateComponents()
    @State var isJournal: Bool = true
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let years = ["2022", "2023", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2023"]
    
    var body: some View {
        let dateComponents = DateComponents(year: Int(yearSelection), month: getMonthNumber(monthStr: monthSelection))
        
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numofday = range.count
        
        let numberslist = Array(1...numofday)
        
        NavigationView{
            VStack{
                HStack{
                    monthButton
                    yearButton
                    
                    Spacer()
                    
                    NavigationLink(destination: AddJournalView()
                        .environmentObject(JournalAddViewModel())) {addJournalButton}
                }
                .padding()

                Spacer()
                
                LazyVGrid(columns: gridItemLayout, spacing: 15){
                    ForEach(numberslist, id: \.self) { numbers in
                        let exist = isJournalExist(year: Int(yearSelection) ?? 2022,
                                                   month: getMonthNumber(monthStr: monthSelection),
                                                   date: numbers)
                        
                        if exist{
                            NavigationLink(destination:
                                            DailyJournalView(date: "\(numbers)",
                                                             month: monthSelection,
                                                             year: yearSelection)){
                                DayItemCard(isDiaryExist: true, dateNumber: numbers)
                                
                            }
                        }else{
                            DayItemCard(isDiaryExist: false, dateNumber: numbers)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Text("Fill your Journal everyday with Deppy")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(greenbutton)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
            }
            .background(.white)
            .navigationTitle("Journal")
            .navigationBarHidden(true)
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

extension JournalView{
    private var addJournalButton: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: -0.324, green: 0.671, blue: 0.535), lineWidth: 4)
                .frame(width: 150, height: 30)
                .background(softgreenbackground)
            
            HStack{
                Label("", systemImage: "plus.circle.fill")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.green)
                Text("Add Journal")
            }
        }
    }
    
    private var monthButton: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 110, height: 30)
                .foregroundColor(greenbutton)
                
            
            Picker("Select a month", selection: $monthSelection){
                ForEach(months, id: \.self){
                    Text($0)
                        .fontWeight(.bold)
                }
            }
            .accentColor(.white)
        }
        
    }
    
    private var yearButton: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 75, height: 30)
                .foregroundColor(greenbutton)
            
            Picker("Select a year", selection: $yearSelection){
                ForEach(years, id: \.self){
                    Text($0)
                        .fontWeight(.bold)
                }
            }
            .accentColor(.white)
        }
    }
    
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
    
    
    func isJournalExist(year: Int, month: Int, date: Int)-> Bool{
        
        var isExist = true
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = date
        
        
        let userCalendar = Calendar(identifier: .gregorian)
        let selectedDay = userCalendar.date(from: dateComponents)
        
        let selectedDayJournals = dailyJournals.filter({$0.entryDate.fullDate() == selectedDay?.fullDate()})
        
        if selectedDayJournals.count == 0{
            isExist = false
        }
        return isExist
    }
    
    
}

extension Date {
    func monthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    func yearName() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    func fullDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: self)
    }
}
