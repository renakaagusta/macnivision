//
//  MedicalInfoDetailView.swift
//  macnivision
//
//  Created by renaka agusta on 29/06/22.
//

import SwiftUI

struct MedicalInfoDetailView: View {
    @State var healthCare: Medical = Medical(
        id: 0,
        name: "dr. Melati Wahyurini, Sp.KJ",
        contactNumber: "088806875205",
        address: "Rss Sidokerto",
        city: "Pati",
        description: "Dokter Spesialis Jiwa RS Premier Surabaya",
        medicalPicture: "Psychiatrist",
        medicalType: Medical.MedicalType.psychiatrist
    )
    
    var body: some View {
        NavigationView{
            HStack {
                Spacer().frame(width: 20)
                VStack {
                    healthCare.image
                    Text(healthCare.name).fontWeight(.bold)
                    Text(healthCare.description).fontWeight(.light).foregroundColor(.gray)
                    HStack {
                        Text("Alamat")
                        Divider()
                        Text(healthCare.address)
                    }
                    AppElevatedButton(label: "Make a Call")
                    Spacer().frame(height: 10)
                    AppOutlinedButton(label: "Open in Maps")
                }
                Spacer().frame(width: 20)
            }
        }.navigationTitle(healthCare.medicalType == Medical.MedicalType.psychiatrist ? "Psychiatrist" : "Health Care")
    }
}

struct MedicalInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalInfoDetailView()
    }
}
