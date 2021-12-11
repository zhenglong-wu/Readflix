//
//  ReadingStatisticsView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/12/2021.
//

import SwiftUI

struct ReadingStatisticsView: View {
    
    @EnvironmentObject var statisticsStateController: StatisticsStateController
    @EnvironmentObject var state: ImportedTextFileStateController
    @State var percent: CGFloat = 0
    
    var body: some View {
        
        VStack {
            
            VStack {
                VStack {
                    
                    Text("Total words read in lifetime")
                        .padding(.bottom)
                    Text("")
                        .padding(.top)
                }
                .modifier(NumberAnimationOverlay(number: percent))
                .onAppear(perform: {
                    withAnimation(.easeInOut(duration: 3)) {
                        percent = CGFloat(statisticsStateController.statistics.totalWordsRead)
                    }
                })
            }
            VStack {
                Text("Content last added")
                Text(statisticsStateController.statistics.contentLastAdded)
                    .bold()
                    .font(.title2)
                    .padding(1)
            }
            VStack {
                Text("Content most added")
                Text(state.getMostAddedContent())
                    .bold()
                    .font(.title2)
                    .padding(1)
            }
        }
    }
}

struct ReadingStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingStatisticsView()
    }
}
