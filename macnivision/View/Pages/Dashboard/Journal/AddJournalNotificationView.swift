//
//  AddJournalNotificationView.swift
//  macnivision
//
//  Created by Theresia Saputri on 20/07/22.
//

import SwiftUI

struct AddJournalNotificationView: View {
    @State var isFirst: Bool
    @Binding var showModal: Bool
    
    var body: some View {
        VStack (spacing: 30){
            Text("Your journal has been recorded!")
                .font(.title2)
                .fontWeight(.bold)
            
            if isFirst{
                Image("5x pet foods")
                    .resizable()
                    .frame(width: 252, height: 95)
                
                Text("Because this is the first time you came to Deppy’s Home, you obtained 5 pet foods")
                    .padding()
            } else{
                Image("3x pet foods")
                    .resizable()
                    .frame(width: 252, height: 95)
                
                HStack(spacing: 5){
                    Text("you  got")
                    Text("3 pet foods")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
            
            Button{
                self.showModal.toggle()
            } label:{
                Text("Done")
                    .font(.headline)
                    .frame(width: 314, height: 40)
                    .background(greenbutton)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
        
    }
}

struct AddJournalNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AddJournalNotificationView(isFirst: true, showModal: .constant(false))
    }
}

