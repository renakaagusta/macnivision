//
//  CardDayItem.swift
//  macnivision
//
//  Created by Theresia Saputri on 28/06/22.
//

import SwiftUI

struct CardDayItem: View {
    @State var isDiaryExist: Bool
    @State var dateNumber: Int

    var body: some View {
        ZStack{
            if isDiaryExist{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 47, height: 75)
                    .foregroundColor(greenbutton)
            
                Text("\(dateNumber)")
                    .font(.title)
                    .foregroundColor(.white)
            } else{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 47, height: 75)
                    .foregroundColor(Color.softgreenbackground)
            
                Text("\(dateNumber)")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
        }
    }
}

struct CardDayItem_Previews: PreviewProvider {
    static var previews: some View {
        CardDayItem(isDiaryExist: true, dateNumber: 31)
    }
}
