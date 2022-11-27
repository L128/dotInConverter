//
//  exportIn.swift
//  dotInConverter
//
//  Created by Haotian Lou on 2022/11/27.
//

import SwiftUI
import UniformTypeIdentifiers



struct exportIn: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        HStack{
            Spacer()
            Button("Export All to .in Files") {
                self.exportIn()
            }
        }
        
    }
    
    func exportIn() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        var url: URL? = URL(string: "")
        if panel.runModal() == .OK {
            url = panel.url
            for individual in env.customerList {
                var filename = url?.appendingPathComponent(individual.referenceNotes + ".in")
                do {
//                    for line in individual.toIn() {
//                        let lineWritable = Data(line.utf8)
//                        try lineWritable.write(to: filename!, options: .atomic)
//                    }
                    let dataWritable = Data(individual.toIn().joined(separator: "\n").utf8)
                    try dataWritable.write(to: filename!)
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
