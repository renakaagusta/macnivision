//
//  EmptyDayItemCard.swift
//  macnivision
//
//  Created by Theresia Saputri on 15/07/22.
//

import SwiftUI

struct EmptyDayItemCard: View {
    @State var dateNumber: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 47, height: 75)
                .foregroundColor(softgraybackground)
        
            Text("\(dateNumber)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(greenbutton)
        }
    }
}

struct EmptyDayItemCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyDayItemCard(dateNumber: 31)
    }
}
