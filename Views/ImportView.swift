//
//  ImportView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportView: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        NavigationLink(destination: ScanView()) {
                            Label("Scan Document", systemImage: "viewfinder.circle").font(.system(size: 15, weight: .bold, design: .default))
                            
                        }
                        .padding()
                        NavigationLink(destination: ScanView()) {
                            Label("Scan Document", systemImage: "doc.text").font(.system(size: 15, weight: .bold, design: .default))
                        }
                        .padding()
                    }
                    VStack {
                        NavigationLink(destination: ScanView()) {
                            Label("Scan Document", systemImage: "viewfinder.circle").font(.system(size: 15, weight: .bold, design: .default))
                            
                        }
                        .padding()
                        NavigationLink(destination: ScanView()) {
                            Label("Scan Document", systemImage: "doc.text").font(.system(size: 15, weight: .bold, design: .default))
                        }
                        .padding()
                    }
                    
                }
                HStack {
                    VStack(alignment: .leading) {
                        NavigationLink(destination: ScanView()) {
                            Label("Scan Document", systemImage: "viewfinder.circle").font(.system(size: 15, weight: .bold, design: .default))
                            
                        }
                        .padding()
                        NavigationLink(destination: ScanView()) {
                            Label("Scan Document", systemImage: "doc.text").font(.system(size: 15, weight: .bold, design: .default))
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Import")
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}


