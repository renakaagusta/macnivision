//
//  PetFoodBar.swift
//  macnivision
//
//  Created by Jevier Izza Maulana on 29/06/22.
//

import SwiftUI

struct PetFoodBar: View {
    
    var totalPetFood: Int = 5
    var petFoodContainerWidth: CGFloat = 100
    var petFoodContainerHeight: CGFloat = 30
    
    
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: petFoodContainerHeight, style: .continuous)
                    .frame(width: petFoodContainerWidth, height: petFoodContainerHeight)
                .foregroundColor(Color.black.opacity(0.2))
                HStack(spacing: 10) {
                    Image("coin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        //.font(.system(size: 20))
                    
                    Text("\(totalPetFood)")
                        .font(.system(size: 15))
                        .bold()
                }
            }
        }
    }
}

struct PetFoodBar_Previews: PreviewProvider {
    static var previews: some View {
        PetFoodBar()
    }
}
