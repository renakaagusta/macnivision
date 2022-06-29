//
//  HospitalCard.swift
//  macnivision
//
//  Created by renaka agusta on 29/06/22.
//

import SwiftUI

struct HealtCareCard: View {
    var healthCare: Medical = Medical(
        id: 0,
        name: "RSUD Dr. SOETOMO",
        contactNumber: "(031) 5501109 - Unit Psikologi",
        address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
        city: "Pati",
        description: "-",
        medicalPicture: "Health Care",
        medicalType: Medical.MedicalType.psychiatrist
    )
    
    var body: some View {
        AppCard(width: 160, height: 200, borderColor: Color.primaryColor, content: {
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Spacer()
                    Text(healthCare.name).fontWeight(.semibold).foregroundColor(.white).background(Color.black.opacity(0.2)).frame(width: 130, alignment: .leading).padding()
                }
            }
        }).background(
            healthCare.image.resizable().cornerRadius(20)
        )
    }

}

struct HealtCareCard_Previews: PreviewProvider {
    static var previews: some View {
        HealtCareCard()
    }
}
