//
//  ReadingStatisticsView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/12/2021.
//

import SwiftUI

struct ReadingStatisticsView: View {
    
    @EnvironmentObject var statisticsStateController: StatisticsStateController
    @State var percent: CGFloat = 0
    
    var body: some View {
        
        VStack {
            Text("")
                .padding()
            Text("Total words read in lifetime")
        }
        .modifier(NumberAnimationOverlay(number: percent))
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 3)) {
                percent = CGFloat(statisticsStateController.statistics.totalWordsRead)
            }
        })
        VStack {
            Text("Some words")
        }
    }
}

struct ReadingStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingStatisticsView()
    }
}
