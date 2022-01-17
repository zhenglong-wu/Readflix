//
//  TextRecogniser.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import Foundation
import Vision
import VisionKit

final class TextRecogniser {
    let cameraScan: VNDocumentCameraScan
    
    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }
    
    private let queue = DispatchQueue(label: "Scan", qos: .default, attributes: [], autoreleaseFrequency: .workItem)
    
    func recogniseText(withCompletitionHandler completionHandler: @escaping ([String]) -> Void) {
        queue.async {
            let images = (0..<self.cameraScan.pageCount).compactMap({
                self.cameraScan.imageOfPage(at: $0).cgImage
            })
            let imageAndRequests = images.map({(image: $0, request: VNRecognizeTextRequest())})
            let textPerPage = imageAndRequests.map{image, request -> String in
                let handler = VNImageRequestHandler(cgImage: image, options: [:])
                do {
                    try handler.perform([request])
                    guard let observations = request.results
                    else {
                        return ""
                    }
                    return observations.compactMap({$0.topCandidates(1).first?.string}).joined(separator: "\n")
                }
                catch {
                    print(error)
                    return ""
                }
            }
            DispatchQueue.main.async {
                completionHandler(textPerPage)
            }
        }
    }
    
}
