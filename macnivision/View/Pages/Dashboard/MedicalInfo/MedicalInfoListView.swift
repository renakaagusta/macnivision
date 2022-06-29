//
//  MedicalInfoListView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct MedicalInfoListView: View {
    var psychiatristList: [Medical] = [
        Medical(
            id: 1,
            name: "dr. Melati Wahyurini, Sp.KJ",
            contactNumber: "088806875205",
            address: "Rss Sidokerto",
            city: "Pati",
            description: "-",
            medicalPicture: "Psychiatrist",
            medicalType: Medical.MedicalType.psychiatrist
        ),
        Medical(
            id: 2,
            name: "dr. Melati Wahyurini, Sp.KJ",
            contactNumber: "088806875205",
            address: "Rss Sidokerto",
            city: "Pati",
            description: "-",
            medicalPicture: "Psychiatrist",
            medicalType: Medical.MedicalType.psychiatrist
        ),
        Medical(
            id: 3,
            name: "dr. Melati Wahyurini, Sp.KJ",
            contactNumber: "088806875205",
            address: "Rss Sidokerto",
            city: "Pati",
            description: "-",
            medicalPicture: "Psychiatrist",
            medicalType: Medical.MedicalType.psychiatrist
        ),
    ]
    var healthCareList: [Medical] = [
        Medical(
           id: 1,
           name: "RSUD Dr. SOETOMO",
           contactNumber: "(031) 5501109 - Unit Psikologi",
           address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
           city: "Pati",
           description: "-",
           medicalPicture: "Health Care",
           medicalType: Medical.MedicalType.psychiatrist
       ),
        Medical(
           id: 2,
           name: "RSUD Dr. SOETOMO",
           contactNumber: "(031) 5501109 - Unit Psikologi",
           address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
           city: "Pati",
           description: "-",
           medicalPicture: "Health Care",
           medicalType: Medical.MedicalType.psychiatrist
       ),
        Medical(
           id: 3,
           name: "RSUD Dr. SOETOMO",
           contactNumber: "(031) 5501109 - Unit Psikologi",
           address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
           city: "Pati",
           description: "-",
           medicalPicture: "Health Care",
           medicalType: Medical.MedicalType.psychiatrist
       )
    ]
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer().frame(width: 20)
                VStack {
                    HStack {
                        Text("Recomended Health Care").fontWeight(.bold)
                        Spacer()
                    }
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(healthCareList) { healthCare in
                                NavigationLink(destination: MedicalInfoDetailView(healthCare:
                                                                    healthCare)) {
                                    HealtCareCard(healthCare:   healthCare).listRowBackground(Color   .clear).listRowSeparator(.hidden)
                                }
                            }
                        }
                    }.frame(height: 200)
                    Spacer().frame(height: 20)
                    HStack {
                        Text("Recomended Psyciatrist").fontWeight(.bold)
                        Spacer()
                    }
                    Spacer().frame(height: 20)
                    ScrollView {
                        ForEach(psychiatristList) { psychiatrist in
                            NavigationLink(destination: MedicalInfoDetailView(healthCare: psychiatrist)) {
                                PsychiatristCard(width:  UIScreen.main.bounds.size.width - 20, psychiatrist: psychiatrist).listRowBackground(Color.clear).listRowSeparator(.hidden)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Medical Info")
        }
    }
}

struct MedicalInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalInfoListView().preferredColorScheme(scheme)
    }
}
