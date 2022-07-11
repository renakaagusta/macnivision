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
            id: 0,
            name: "dr. Melati Wahyurini, Sp.KJ",
            email: "renakaagusta28@gmail.com",
            contactNumber: "088806875205",
            telephoneNumber: "027837299",
            schedule: [
                Schedule(id: 0, day: "Senin", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 1, day: "Selasa", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 2, day: "Rabu", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 3, day: "Kamis", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 4, day: "Jum'at", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 5, day: "Sabtu", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 6, day: "Minggu", openedAt: "01:00", closedAt: "03:00")
            ],
            address: "Jl. Nginden Barat Blok B, Surabaya 60118, Jawa Timur – Indonesia",
            city: "Pati",
            description: "Dokter Spesialis Jiwa RS Premier Surabaya",
            medicalPicture: "Psychiatrist",
            medicalType: Medical.MedicalType.psychiatrist
        ),
        Medical(
            id: 2,
            name: "dr. Melati Wahyurini, Sp.KJ",
            email: "renakaagusta28@gmail.com",
            contactNumber: "088806875205",
            telephoneNumber: "027837299",
            schedule: [
                Schedule(id: 0, day: "Senin", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 1, day: "Selasa", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 2, day: "Rabu", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 3, day: "Kamis", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 4, day: "Jum'at", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 5, day: "Sabtu", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 6, day: "Minggu", openedAt: "01:00", closedAt: "03:00")
            ],
            address: "Jl. Nginden Barat Blok B, Surabaya 60118, Jawa Timur – Indonesia",
            city: "Pati",
            description: "Dokter Spesialis Jiwa RS Premier Surabaya",
            medicalPicture: "Psychiatrist",
            medicalType: Medical.MedicalType.psychiatrist
        ),
        Medical(
            id: 3,
            name: "dr. Melati Wahyurini, Sp.KJ",
            email: "renakaagusta28@gmail.com",
            contactNumber: "088806875205",
            telephoneNumber: "027837299",
            schedule: [
                Schedule(id: 0, day: "Senin", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 1, day: "Selasa", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 2, day: "Rabu", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 3, day: "Kamis", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 4, day: "Jum'at", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 5, day: "Sabtu", openedAt: "01:00", closedAt: "03:00"),
                Schedule(id: 6, day: "Minggu", openedAt: "01:00", closedAt: "03:00")
            ],
            address: "Jl. Nginden Barat Blok B, Surabaya 60118, Jawa Timur – Indonesia",
            city: "Pati",
            description: "Dokter Spesialis Jiwa RS Premier Surabaya",
            medicalPicture: "Psychiatrist",
            medicalType: Medical.MedicalType.psychiatrist
        ),
    ]
    var healthCareList: [Medical] = [
        Medical(
           id: 1,
           name: "RSUD Dr. SOETOMO",
           contactNumber: "(031) 5501109 - Unit Psikologi",
           schedule: [
               Schedule(id: 0, day: "Senin", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 1, day: "Selasa", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 2, day: "Rabu", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 3, day: "Kamis", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 4, day: "Jum'at", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 5, day: "Sabtu", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 6, day: "Minggu", openedAt: "01:00", closedAt: "03:00")
           ],
           address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
           city: "Pati",
           description: "-",
           medicalPicture: "Health Care",
           medicalType: Medical.MedicalType.hospital
       ),
        Medical(
           id: 2,
           name: "RSUD Dr. SOETOMO",
           contactNumber: "(031) 5501109 - Unit Psikologi",
           schedule: [
               Schedule(id: 0, day: "Senin", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 1, day: "Selasa", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 2, day: "Rabu", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 3, day: "Kamis", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 4, day: "Jum'at", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 5, day: "Sabtu", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 6, day: "Minggu", openedAt: "01:00", closedAt: "03:00")
           ],
           address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
           city: "Pati",
           description: "-",
           medicalPicture: "Health Care",
           medicalType: Medical.MedicalType.hospital
       ),
        Medical(
           id: 3,
           name: "RSUD Dr. SOETOMO",
           contactNumber: "(031) 5501109 - Unit Psikologi",
           schedule: [
               Schedule(id: 0, day: "Senin", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 1, day: "Selasa", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 2, day: "Rabu", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 3, day: "Kamis", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 4, day: "Jum'at", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 5, day: "Sabtu", openedAt: "01:00", closedAt: "03:00"),
               Schedule(id: 6, day: "Minggu", openedAt: "01:00", closedAt: "03:00")
           ],
           address: "Jalan Mayjen Prof.Dr.Moestopo No.6-8 Surabaya 60286",
           city: "Pati",
           description: "-",
           medicalPicture: "Health Care",
           medicalType: Medical.MedicalType.hospital
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
                                NavigationLink(destination: MedicalInfoDetailView(healthCare: healthCare)) {
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
                    HStack {
                        Spacer().frame(width: 20)
                        ScrollView {
                            ForEach(psychiatristList) { psychiatrist in
                                VStack {
                                    NavigationLink(destination: MedicalInfoDetailView(healthCare: psychiatrist)) {
                                        PsychiatristCard(width:  UIScreen.main.bounds.size.width - 20, psychiatrist: psychiatrist).listRowBackground(Color.clear).listRowSeparator(.hidden)
                                    }
                                    Spacer().frame(height: 20)
                                }
                            }
                        }
                        Spacer().frame(width: 40)
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
