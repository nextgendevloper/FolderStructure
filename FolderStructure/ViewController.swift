//
//  ViewController.swift
//  FolderStructure
//
//  Created by HKBeast on 23/01/23.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imagePicker = UIImagePickerController()
    @IBOutlet var imagePreview : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   

    @IBAction func AddImageButton(sender : AnyObject) {
        openGallary()

    }
    @IBAction func saveImage(_ sender:UIButton){
        FolderStructure.saveImage(image: imagePreview.image!)
    }
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }

  
    func openGallary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
             
              imagePicker.delegate = self
              imagePicker.allowsEditing = true
              imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
              self.present(imagePicker, animated: true, completion: nil)
          }
          else
          {
              let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage.self] as? UIImage{
            self.dismiss(animated: false)
            imagePreview.image = image
    }
    
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage{
////            self.dismiss(animated: false)
//            imagePreview.image = image
//            let cropVC = CropViewController(image: image)
//                   cropVC.delegate = self
//                   cropVC.aspectRatioPickerButtonHidden = true
//            cropVC.aspectRatioPreset = .presetSquare
//                   cropVC.aspectRatioLockEnabled = false
//                   cropVC.resetAspectRatioEnabled = false
//
//                   self.present(cropVC, animated: true, completion: nil)
//
         
       
           
    }
    
//    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//
//
//        }
    }
//
//
//    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
//
//       print("Image",image)
//        self.imageDelegate.imagePicker(didChange: image)
//        cropViewController.dismiss(animated: true)
//        isImageSelection?(true)
//    }
//}

