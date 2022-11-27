//
//  CustomerLists.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/25.
//

import SwiftUI
import Foundation


struct CustomerLists: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    @State var currentCustomer: customer = customer()
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ListView(currentSelected: $currentCustomer)
                .frame(width: 150)
                .padding()
        } content: {
            CSVPreview(currentSelected: $currentCustomer)
                .frame(minWidth: 400, maxWidth: .infinity)
//                .padding()
        } detail: {
            InPreview(currentSelected: $currentCustomer)
                .frame(minWidth: 400, maxWidth: .infinity)
//                .padding()
        }
//        .frame(minWidth: 700, minHeight: 800)
        .padding()
        .alert(isPresented: $env.alert) {
            Alert(title:Text(env.errorMsg), dismissButton: .default(Text("OK")))
        }
    }
}

struct ListView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    @Binding var currentSelected: customer
    
    var body: some View {
        List(self.env.customerList, id: \.self) { individual in
            HStack {
                Text(individual.referenceNotes)
                    .foregroundColor(currentSelected == individual ? Color.primary : Color.secondary)
                    .onTapGesture {
                        currentSelected = individual
                    }
            }
            .scrollIndicators(.automatic)
        }
    }
}
    
struct CSVPreview: View {
    
    @Binding var currentSelected: customer

    var body: some View {
        let allinfo:[String] = displayAll()
        ForEach(allinfo, id: \.self) { item in
            HStack {
                Text(item)
                Spacer()
            }
        }
//        Spacer()
    }
    
    func displayAll() -> [String]{
        let mirror = Mirror(reflecting: self.currentSelected)
        var allInfo:[String] = []
        mirror.children.forEach { item in
            allInfo.append("\(item.label ?? "label"): \(item.value)")
        }
        return allInfo
    }
}

struct InPreview: View {
    
    @Binding var currentSelected: customer
    
    var body: some View {
        ForEach(currentSelected.toIn(), id: \.self) { item in
            HStack {
                Text(item)
                Spacer()
            }
        }
//        Spacer()
    }
}
    
