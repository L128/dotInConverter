//
//  CSVSelector.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct CSVSelector: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        HStack{
            Spacer()
            Text(self.env.displayUrl)
            Spacer()
            Button("Choose CSV") {
                self.selectCSV()
            }
            Button("Reload") {
                env.updateCustomerList()
            }
        }
        
    }
    
    func selectCSV() {
        let panel = NSOpenPanel()
        
        panel.canChooseDirectories = false
//        panel.canChooseFiles = true
//        panel.allowsMultipleSelection = false
        panel.allowedContentTypes = [UTType.commaSeparatedText]
        if panel.runModal() == .OK {
            env.updateUrl(panel.url)
            env.updateCustomerList()
        }

    }
}

