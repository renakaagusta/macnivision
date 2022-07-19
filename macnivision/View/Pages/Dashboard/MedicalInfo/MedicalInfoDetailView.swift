//
//  MedicalInfoDetailView.swift
//  macnivision
//
//  Created by renaka agusta on 29/06/22.
//

import SwiftUI

struct MedicalInfoDetailView: View {
    @State var healthCare: Medical = Medical(
        id: 1,
        name: "RSUD Dr. SOETOMO",
        contactNumber: "(031) 5501109 - Unit Psikologi",
        address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
        city: "Pati",
        description: "-",
        image: "https://d1bpj0tv6vfxyp.cloudfront.net/sering-dianggap-sama-ini-bedanya-psikolog-dan-psikiaterhalodoc.jpg",
        medicalType: Medical.MedicalType.psychiatrist
    )
    
    var body: some View {
        NavigationView{
            HStack {
                Spacer().frame(width: 20)
                ScrollView {
                    if(healthCare.medicalType == Medical.MedicalType.hospital) {
                        AppCard(width: UIScreen.main.bounds.size.width, height: 200,borderColor: Color.clear, content: {
                            HStack(alignment: .bottom){
                                VStack(alignment: .leading){
                                    Spacer()
                                    Text(healthCare.name).fontWeight(.semibold).foregroundColor(.white).padding().frame(width: UIScreen.main.bounds.size.width,height: 50, alignment: .leading).background(Color.primaryColor.opacity(0.2))
                                }
                            }
                        }).background(
                            AsyncImage(url: URL(string: healthCare.image)!,
                                       placeholder: { Text("Loading ...")}, width: 400.0, height: 300)
                        )
                    } else {
                        AsyncImage(url: URL(string: healthCare.image)!,
                                   placeholder: { Text("Loading ...")})
                    }
                    if(healthCare.medicalType == Medical.MedicalType.psychiatrist) {
                        Text(healthCare.name).fontWeight(.bold)
                    }
                    Text(healthCare.description).fontWeight(.light).foregroundColor(.gray)
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("ALAMAT").frame(width: 120).foregroundColor(.black)
                            Divider()
                            Spacer().frame(width: 30)
                            Text(healthCare.address)
                            Spacer()
                        }
                        HStack {
                            Text("HARI & JAM PRAKTEK").frame(width: 120).foregroundColor(.black)
                            Divider()
                            Spacer().frame(width: 30)
                            VStack(alignment: .leading) {
                                ForEach(healthCare.schedule) { schedule in HStack {
                                    Text(schedule.day).frame(width: 80, alignment: .leading)
                                    Text(schedule.openedAt + " - " + schedule.closedAt)
                                } }
                            }
                        }.frame(height: 200)
                        HStack {
                            Text("TELEPON").frame(width: 120).foregroundColor(.black)
                            Divider()
                            Spacer().frame(width: 30)
                            Text(healthCare.telephoneNumber)
                        }
                        if(healthCare.medicalType == Medical.MedicalType.hospital) {
                            HStack {
                                Text("WHATSAPP").frame(width: 120).foregroundColor(.black)
                                Divider()
                                Spacer().frame(width: 30)
                                Text(healthCare.contactNumber)
                            }
                        }
                        if(healthCare.medicalType == Medical.MedicalType.hospital) {
                            HStack {
                                Text("EMAIL").frame(width: 120).foregroundColor(.black)
                                Divider()
                                Spacer().frame(width: 30)
                                Text(healthCare.email)
                        }
                        }
                    }.foregroundColor(.gray)
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
        MedicalInfoDetailView().preferredColorScheme(scheme)
    }
}
