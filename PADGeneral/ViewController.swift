//
//  ViewController.swift
//  PADGeneral
//
//  Created by Us on 04/06/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit
import RoundCode
import AVFoundation
import PassKit

class ViewController: UIViewController,RCCameraViewControllerDelegate {
   
    var scanner : RCCameraViewController!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showScanner()
    }
    
   func showScanner(){
    if UIImagePickerController.isSourceTypeAvailable(.camera) && AVCaptureDevice.authorizationStatus(for: .video) != .denied {
         scanner = RCCameraViewController()
        scanner.delegate = self
        present(scanner, animated: false)
        
    }else {
        let alert = UIAlertController(title: "No camera found", message:" Scanner requires camera.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    }
    
    func cameraViewControllerDidCancel() {
           navigationController?.popViewController(animated: true)
       }
    
    
    func cameraViewController(didFinishScanning message: String) {
        scanner.dismiss(animated: true) {
            self.navigate(.payView(animated: true))
        }
        
    }
    
}
