//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/21.
//

import Foundation
import SwiftUI

class LocalFileManager {

    static let instance = LocalFileManager()// init once only

    private init() {

    }

    func saveImage(image: UIImage, imageName: String, folderName: String) {

        // Create folder
        createFolderIfNeeded(folderName: folderName)

        // Get path for image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName)
            else {return}

        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image.ImageName:\(imageName).\(error)")
        }
    }

    // Save image to path
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }

        return url.appendingPathComponent(folderName)
    }

    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }

    // But folders need to be created first

    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else {
            return
        }

        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory.\(folderName).\(error)")
            }
        }
    }

    // Hi, are u there?
    func getImage(imageName: String, folderName: String) -> UIImage? {

        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
}
