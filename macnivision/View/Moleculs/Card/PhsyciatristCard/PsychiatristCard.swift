//
//  PsychiatristCard.swift
//  macnivision
//
//  Created by renaka agusta on 29/06/22.
//

import SwiftUI

struct PsychiatristCard: View {
    var width: CGFloat = UIScreen.main.bounds.size.width
    
    var psychiatrist: Medical = Medical(
        id: 0,
        name: "dr. Melati Wahyurini, Sp.KJ",
        contactNumber: "088806875205",
        address: "Rss Sidokerto",
        city: "Pati",
        description: "-",
        image: "https://d1bpj0tv6vfxyp.cloudfront.net/sering-dianggap-sama-ini-bedanya-psikolog-dan-psikiaterhalodoc.jpg",
        medicalType: Medical.MedicalType.psychiatrist
    )
    
    var body: some View {
        AppCard(width: width, height: 100, borderColor: Color.primaryColor, content: {
            HStack{
                Image("Psychiatrist").resizable().frame(width: 80, height: 80).cornerRadius(10)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text(psychiatrist.name).fontWeight(.semibold)
                    Spacer().frame(height:5)
                    Text("Psychiatrist").fontWeight(.light).foregroundColor(.gray).font(.system(size: 14))
                }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 44, alignment: .leading)
            }.padding()
        })
    }
}

struct PsychiatristCard_Previews: PreviewProvider {
    static var previews: some View {
        PsychiatristCard()
    }
}
