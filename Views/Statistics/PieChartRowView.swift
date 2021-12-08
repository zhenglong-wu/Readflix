//
//  PieChartRows.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/12/2021.
//

import SwiftUI

struct PieChartRows: View {
    
    var colours: [Color]
    var names: [String]
    var values: [String]
    var percents: [String]
    
    var body: some View {
        VStack{
            ForEach(0..<self.values.count){ i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.colours[i])
                        .frame(width: 20, height: 20)
                    Text(self.names[i])
                        .bold()
                    Spacer()
                    Text(self.values[i])
                }
                .padding(5)
            }
        }
        .font(.system(size: CGFloat(14)))
    }
}

//struct PieChartRows_Previews: PreviewProvider {
//    static var previews: some View {
//        PieChartRows()
//    }
//}
