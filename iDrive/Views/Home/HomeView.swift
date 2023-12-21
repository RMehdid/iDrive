//
//  HomeView.swift
//  iDrive
//
//  Created by Samy Mehdid on 20/12/2023.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var searchText: String = ""
    
    var body: some View {
        Map {
            
        }
        .ignoresSafeArea()
        .sheet(isPresented: .constant(true)) {
            VStack(spacing: 16) {
                HStack(spacing: 16){
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Find Best car", text: $searchText)
                        Spacer()
                        if !searchText.isEmpty {
                            Button {
                                self.searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.ultraThickMaterial)
                    }
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 42, height: 42)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    listBuilder(for: "Favorites", with: Car.sampleCars)
                    
                    Spacer()
                        .frame(height: 32)
                    
                    listBuilder(for: "Recent", with: Car.sampleCars)
                }
            }
            .padding()
            .presentationDetents([.medium, .large, .height(100)])
            .presentationBackground(.ultraThinMaterial)
            .interactiveDismissDisabled()
        }
        .onAppear(perform: viewModel.getCars)
    }
    
    @ViewBuilder
    private func listBuilder(for title: String, with elements: [Car]) -> some View {
        VStack(alignment: .leading){
            Section {
                VStack(spacing: 0){
                    ForEach(elements.prefix(3)) { car in
                        CarCard(car)
                    }
                }
                .background(.ultraThickMaterial)
                .clipShape(.rect(cornerRadius: 16))
            } header: {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
            }
        }
    }
}

#Preview {
    HomeView()
}
