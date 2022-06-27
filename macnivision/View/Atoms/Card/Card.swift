//
//  Card.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct AppCard: View {
    @State var width: CGFloat = 300
    @State var height: CGFloat = 300
    @State var cornerRadius: CGFloat = 20
    @State var content: AnyView?
    @State var backgroundColor: Color = Color.white
    @State var borderColor: Color = Color.gray
    
    var body: some View {
        VStack(){
            if (content != nil) {
                content
            }
        }.frame(width: width, height: height).overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: 1).foregroundColor(borderColor)
        ).background(RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor))
    }
}

struct AppCard_Previews: PreviewProvider {
    static var previews: some View {
        AppCard()
    }
}

