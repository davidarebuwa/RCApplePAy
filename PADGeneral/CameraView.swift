//
//  CameraView.swift
//  PADGeneral
//
//  Created by Us on 08/06/2020.
//  Copyright © 2020 David Arebuwa. All rights reserved.
//

import UIKit
import PassKit

class CameraView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applePay()
    }
    
    func applePay(){
            let paymentItem = PKPaymentSummaryItem.init(label: "ticket pay example" , amount: NSDecimalNumber(value: 10.0))
            let paymentNetworks = [PKPaymentNetwork.amex, .discover, .masterCard, .visa]
            
            if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
                
                let request = PKPaymentRequest()
                request.currencyCode = "GBP"
                request.countryCode = "GB"
                request.merchantIdentifier = "merchant.com.h3row.PADGeneral"
                request.merchantCapabilities = PKMerchantCapability.capability3DS
                request.supportedNetworks = paymentNetworks
                request.paymentSummaryItems = [paymentItem]
                
                  guard let paymentVC = PKPaymentAuthorizationViewController(paymentRequest: request) else {
                    displayDefaultAlert(title: "Error", message: "Unable to present Apple Pay authorization.")
                    return
                }
                    paymentVC.delegate = self
                    self.present(paymentVC, animated: true, completion: nil)
                
            } else {
                displayDefaultAlert(title: "Error", message: "Unable to make Apple Pay transaction.")
            }
        }
        
        func displayDefaultAlert(title: String?, message: String?) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }

    }

    extension CameraView: PKPaymentAuthorizationViewControllerDelegate {
        func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
            dismiss(animated: true, completion: nil)
        }
        func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
            dismiss(animated: true, completion: nil)
            displayDefaultAlert(title: "Success!", message: "The Apple Pay transaction was complete.")
        }
    }

