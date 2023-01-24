//
//  ext.swift
//  FolderStructure
//
//  Created by HKBeast on 23/01/23.
//

import Foundation
import Photos
import UIKit
//
//class CustomPhotoAlbum {
//
//    static let albumName = "Flashpod"
//    static let sharedInstance = CustomPhotoAlbum()
//
//    var assetCollection: PHAssetCollection!
//
//    init() {
//
//        func fetchAssetCollectionForAlbum() -> PHAssetCollection! {
//
//            let fetchOptions = PHFetchOptions()
//            fetchOptions.predicate = NSPredicate(format: "title = %@", CustomPhotoAlbum.albumName)
//            let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
//
//            if let _ = collection.firstObject {
//                return (collection.firstObject!)
//            }
//
//            return nil
//        }
//
//        if let assetCollection = fetchAssetCollectionForAlbum() {
//            self.assetCollection = assetCollection
//            return
//        }
//
//        PHPhotoLibrary.shared().performChanges({
//            PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: CustomPhotoAlbum.albumName)
//        }) { success, _ in
//            if success {
//                self.assetCollection = fetchAssetCollectionForAlbum()
//            }
//        }
//    }
//
//    func saveImage(image: UIImage) {
//
//        if assetCollection == nil {
//            return   // If there was an error upstream, skip the save.
//        }
//
//        PHPhotoLibrary.shared().performChanges({
//            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
//            let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
//            let albumChangeRequest = PHAssetCollectionChangeRequest(for: self.assetCollection)
//            albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
//        }, completionHandler: nil)
//    }
//
//
//}

func createPhotoAlbum(with name:String,completion:@escaping(PHAssetCollection)->()){
    
    
    let fetchOptions = PHFetchOptions()
    fetchOptions.predicate = NSPredicate(format: "title = %@", name)
    let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)

    //check if
    if  collection.firstObject != nil{
//       return collection.firstObject
        completion(collection.firstObject!)
    }
//    else create folder
    else{
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: name)
        }) { success, _ in
            if success {
                print("Folder Create")
                completion(collection.firstObject!)
            }
        }
    }
}
func saveImage(image: UIImage) {

    createPhotoAlbum(with: "Add Watermark") { asset in
        let assetCollection = asset
        PHPhotoLibrary.shared().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
            let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection)
            albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
        }, completionHandler: nil)
    }
}

func saveLogo(image: UIImage) {

    createPhotoAlbum(with: "Watermarks") { asset in
        let assetCollection = asset
        PHPhotoLibrary.shared().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
            let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection)
            albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
        }, completionHandler: nil)
    }

  
}

func saveVideo(image: UIImage) {

    createPhotoAlbum(with: "Add Watermark") { asset in
        let assetCollection = asset
        PHPhotoLibrary.shared().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
            let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection)
            albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
        }, completionHandler: nil)
    }

  
}
