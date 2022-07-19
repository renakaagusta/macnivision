//
//  MedicalInfoListView.swift
//  macnivision
//
//  Created by renaka agusta on 27/06/22.
//

import SwiftUI

struct MedicalInfoListView: View {
    var psychiatristList: [Medical] = []
    var healthCareList: [Medical] = []
    @ObservedObject var viewModel: MedicalListViewModel = MedicalListViewModel()

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
                            ForEach((viewModel.medicals as [Medical]).filter{
                                $0.medicalType == Medical.MedicalType.hospital
                            }) { healthCare in
                                NavigationLink(destination: MedicalInfoDetailView(healthCare: healthCare)) {
                                    HealtCareCard(healthCare: healthCare).listRowBackground(Color   .clear).listRowSeparator(.hidden)
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
                            ForEach((viewModel.medicals as [Medical]).filter{
                                $0.medicalType == Medical.MedicalType.psychiatrist
                            }) { psychiatrist in
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
