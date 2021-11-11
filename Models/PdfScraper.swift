//
//  PdfScraper.swift
//  Readflix
//
//  Created by Zhenglong Wu on 07/11/2021.
//

import Foundation
import PDFKit

class PdfScraper {
    
    func getParsedText(pdfUrl: URL) -> String {
        
        let content = NSMutableAttributedString()
        
        if let pdf = PDFDocument(url: pdfUrl) {
            for i in 0..<pdf.pageCount {
                guard let page = pdf.page(at: i) else { continue }
                guard let pageContent = page.attributedString else { continue }
                content.append(pageContent)
            }
        }
        return content.string
    }
    
}
