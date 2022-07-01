//
//  HungryBar.swift
//  macnivision
//
//  Created by Jevier Izza Maulana on 29/06/22.
//

import SwiftUI

struct HungryBar: View {
    
    //Variable for HungryBar
    var hungryBarWidth:CGFloat = 200
    var hungryBarHeight:CGFloat = 20
    var hungryBarCornerRadious:CGFloat = 20
    var hungryPercentage:CGFloat = 100
    var gradientColorLeft = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var gradientColorRight = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    
    var body: some View {
        let hungryBarMultiplier = hungryBarWidth / 100
        
        ZStack(alignment: .leading) {
            
            //Hungry Bar Background
            RoundedRectangle(cornerRadius: hungryBarCornerRadious, style: .continuous)
                .frame(width: hungryBarWidth, height: hungryBarHeight)
            .foregroundColor(Color.black.opacity(0.2))
            
            //Hungry Bar Background
            RoundedRectangle(cornerRadius: hungryBarCornerRadious, style: .continuous)
                .frame(width: hungryPercentage * hungryBarMultiplier, height: hungryBarHeight)
                .background(
                    LinearGradient(gradient: Gradient(colors: [gradientColorLeft, gradientColorRight]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: hungryBarCornerRadious, style: .continuous)))
                .foregroundColor(.clear)
            
           
        }
    }
}

struct HungryBar_Previews: PreviewProvider {
    static var previews: some View {
        HungryBar()
    }
}
