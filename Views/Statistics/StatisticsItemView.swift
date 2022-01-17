//
//  StatisticsItemView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 11/12/2021.
//

import SwiftUI

struct StatisticsItemView: View {
    
    @State var titleString: String
    @State var statistic: Int
    @State var statisticType: String
    
    var body: some View {
    
        VStack {
            HStack {
                
            }
        }
        
    }
}

struct StatisticsItemView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsItemView(titleString: "Words read", statistic: 23490, statisticType: "Words'")
    }
}
