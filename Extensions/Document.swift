//
//  Document.swift
//  Readflix
//
//  Created by Zhenglong Wu on 03/12/2021.
//

import Foundation
import QuickLookThumbnailing

extension Document {
    
    func generateThumbnail(
        size: CGSize,
        scale: CGFloat,
        completion: @escaping (UIImage) -> Void
      ) {
        if let thumbnail = UIImage(systemName: "doc") {
          completion(thumbnail)
        }
      }
}
