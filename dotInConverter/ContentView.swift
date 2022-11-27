//
//  ContentView.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/19.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        VStack {
            CSVSelector()
                .border(.secondary)
            CustomerLists()
                .border(.secondary)
            exportIn()
        }
        .environmentObject(GlobalEnvironment())
        .frame(minWidth: 800, minHeight: 800)
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
