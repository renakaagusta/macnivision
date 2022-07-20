//
//  EmptyDayItemCard.swift
//  macnivision
//
//  Created by Theresia Saputri on 15/07/22.
//

import SwiftUI

struct EmptyDayItemCard: View {
    @State var dateNumber: Int
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 47, height: 75)
                .foregroundColor(grayCalenderBackground)
        
            Text("\(dateNumber)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
        .onTapGesture {
            showAlert(title: "So happy that you eager to face the future, but the day hasn't been there, yet. :)")
        }
        .alert(isPresented: $showAlert, content: {
                return Alert(title: Text(alertTitle))
        })
    }
    
    func showAlert(title: String){
        alertTitle =  title
        showAlert.toggle()
    }

}

struct EmptyDayItemCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyDayItemCard(dateNumber: 31)
    }
}
