//
//  ScanningView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI
import VisionKit

struct ScanningView: UIViewControllerRepresentable {
    
    @EnvironmentObject var statisticsStateController: StatisticsStateController
        
    func makeCoordinator() -> CameraCoordinator {
        return CameraCoordinator(completion: completionHandler)
    }
    
    // This delegate class returns the scanned results from the VNDocumentCamera
    class CameraCoordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        // Declaring completion handler
        private let completionHandler: ([String]?) -> Void
        
        // Initialise completion handler
        init(completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
        }
        
        // Camera view controller that takes in a view controller and a completion handler
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recogniser = TextRecogniser(cameraScan: scan)
            recogniser.recogniseText(withCompletitionHandler: completionHandler)
        }
        // Camera view controller cancelling button
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
        // Camera view controller failure
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            completionHandler(nil)
        }
    }
    
    // This function shows the user what the VNDocumentCamera is currently scanning
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = VNDocumentCameraViewController
    private let completionHandler: ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void) {
        self.completionHandler = completion
    }
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        Text("...")
    }
}
