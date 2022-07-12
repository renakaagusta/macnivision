//
//  JournalView.swift
//  macnivision
//
//  Created by Jevier Izza Maulana on 11/07/22.
//

import SwiftUI

struct JournalView: View {
    
    var gridItemLayout = [GridItem(.adaptive(minimum: 40))]
    
    @State var monthSelection = "JUNE"
    @State var yearSelection = "2022"
    
    @State private var date = Date()

    
    let months = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OKTOBER", "NOVEMBER", "DESEMBER"]
    
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
                    
                    NavigationLink(destination: AddJournalView()) {addJournalButton}
                }
                .padding()

                Spacer()
                
                LazyVGrid(columns: gridItemLayout, spacing: 10){
                    ForEach(numberslist, id: \.self) { numbers in
                        NavigationLink(destination: DailyJournalView(date: "\(numbers)", month: monthSelection, year: yearSelection)) {
                            CardDayItem(isDiaryExist: true, dateNumber: numbers)
                        }
                    }
                }
                .padding(.horizontal)
                
                
                Spacer()
                
                Text("Fill your Journal everyday with Deppy")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(greenbutton)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Spacer()
                
            }
            .navigationTitle("Journal")
            .navigationBarHidden(true)
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView().preferredColorScheme(scheme)
    }
}

extension JournalView{
    private var addJournalButton: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: -0.324, green: 0.671, blue: 0.535), lineWidth: 4)
                .frame(width: 150, height: 30)
                .background(Color.softgreenbackground)
            
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
                .foregroundColor(Color.softgreenbackground)
            
            Picker("Select a month", selection: $monthSelection){
                ForEach(months, id: \.self){
                    Text($0)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            
        }
    }
    
    private var yearButton: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 75, height: 30)
                .foregroundColor(Color.softgreenbackground)
            
            Picker("Select a year", selection: $yearSelection){
                ForEach(years, id: \.self){
                    Text($0)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    func getMonthNumber(monthStr: String) -> Int {
        var monthNumber:Int = 0
        
        if monthStr == "JANUARY"{
            monthNumber = 1
        }
        else if monthStr == "FEBRUARY"{
            monthNumber = 2
        }
        else if monthStr == "MARCH"{
            monthNumber = 3
        }
        else if monthStr == "APRIL"{
            monthNumber = 4
        }
        else if monthStr == "MAY"{
            monthNumber = 5
        }
        else if monthStr == "JUNE"{
            monthNumber = 6
        }
        else if monthStr == "JULY"{
            monthNumber = 7
        }
        else if monthStr == "AUGUST"{
            monthNumber = 8
        }
        else if monthStr == "SEPTEMBER"{
            monthNumber = 9
        }
        else if monthStr == "OCTOBER"{
            monthNumber = 10
        }
        else if monthStr == "NOVEMBER"{
            monthNumber = 11
        }
        else if monthStr == "DECEMBER"{
            monthNumber = 12
        }
        
        return monthNumber
    }
}
