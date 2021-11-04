//
//  ScanningView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI
import VisionKit

struct ScanningView: UIViewControllerRepresentable {
        
    func makeCoordinator() -> CameraCoordinator {
        return CameraCoordinator(completion: completionHandler)
    }
    
    // This delegate class returns the scanned results from the VNDocumentCamera
    class CameraCoordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        private let completionHandler: ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
        }
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recogniser = TextRecogniser(cameraScan: scan)
            recogniser.recogniseText(withCompletitionHandler: completionHandler)
        }
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
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
