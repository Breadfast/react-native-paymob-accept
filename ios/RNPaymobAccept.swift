//
//  RNPaymobAccept.swift
//  RNPaymobAccept
//
//  Created by Mohamed Ghobashy on 11/4/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
import AcceptSDK
// import RCTEventEmitter


@objc public protocol RNWeAcceptModuleDelegate: class {
    
    func rnPaymentAttemptFailed(_ error: Any, detailedDescription: String)
    func rnTransactionRejected(_ payData: Any)
    func rnTransactionAccepted(_ payData: Any)
    func rnTransactionAccepted(_ payData: Any, savedCardData: Any)
    func rnUserDidCancel3dSecurePayment(_ pendingPayData: Any)
    func rnUserDidCancel()
}

//var player: AVAudioPlayer?
@objc(RNPaymobAccept)
class RNPaymobAccept: UIViewController, AcceptSDKDelegate {
   
    let accept: AcceptSDK = AcceptSDK()
    var successCallback: RCTPromiseResolveBlock!
    var errorCallback: RCTPromiseRejectBlock!
//    accept.delegate = self

    @objc public weak var delegate: RNWeAcceptModuleDelegate?
    
//    @objc(RNAcceptSDK)
//    func RNAcceptSDK() {
//        accept.delegate = self
//    }
    
//    init() {
//
//        super.init()
//      }
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
      return true
    }
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    @objc public func payWithNoToken(_ data:NSDictionary, successCallback:  @escaping RCTPromiseResolveBlock, errorCallback:  @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async { [weak self] in
            self?._payWithNoToken(data, successCallback:successCallback , errorCallback:errorCallback)
        }

    }
    
    public func _payWithNoToken(_ data:NSDictionary, successCallback: @escaping RCTPromiseResolveBlock, errorCallback: @escaping RCTPromiseRejectBlock) {
        accept.delegate = self
        self.successCallback = successCallback
        self.errorCallback = errorCallback
        let topVC = topMostController()

        do {
            
//            print(json);
            let bData = [  "apartment": "NA",
                           "email": "NA",
                           "floor": "NA",
                           "first_name": "NA",
                           "street": "NA",
                           "building": "NA",
                           "phone_number": "NA",
                           "shipping_method": "NA",
                           "postal_code": "NA",
                           "city": "NA",
                           "country": "NA",
                           "last_name": "NA",
                           "state": "NA"
            ]
            successCallback([data["paymentKey"]])
            try accept.presentPayVC(vC: topVC, billingData: bData, paymentKey:data["paymentKey"] as! String,  saveCardDefault: false, showSaveCard: false, showAlerts: true)

//                                    saveCardDefault: json["saveCardDefault"],
//                                    showSaveCard: json["showSaveCard"],
//                                    showAlerts: json["showAlerts"],
//                                    token: json["token"],
//                                    maskedPanNumber: json["maskedPanNumber"],
//                                    buttonsColor: json["buttonsColor"],
//                                    isEnglish: json["isEnglish"],
//                                    backgroundColor: json["backgroundColor"],
//                                    navBarColor: json["navBarColor"],
//                                    navBarTextColor: json["navBarTextColor"],
//                                    textFieldBackgroundColor: json["textFieldBackgroundColor"],
//                                    textFieldTextColor: json["textFieldTextColor"],
//                                    titleLabelTextColor: json["titleLabelTextColor"],
//                                    inputLabelTextColor: json["inputLabelTextColor"])
        } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
//           print(errorMessage)
            self.errorCallback("-1",errorMessage, nil)
       }  catch let error {
//           print(error.localizedDescription)
        self.errorCallback("-1", error.localizedDescription, error)
       }

        
    }
    @objc func presentPayVC(vC: UIViewController, billingData: [String : String], paymentKey: String, saveCardDefault: Bool, showSaveCard: Bool, showAlerts: Bool, token: String? = nil, maskedPanNumber: String? = nil, buttonsColor: UIColor? = nil, isEnglish: Bool = true, backgroundColor: UIColor? = nil, navBarColor: UIColor? = nil, navBarTextColor: UIColor? = nil, textFieldBackgroundColor: UIColor? = nil, textFieldTextColor: UIColor? = nil, titleLabelTextColor: UIColor? = nil, inputLabelTextColor: UIColor? = nil, buttonText: String = "", cardNameLabelText: String = "", cardNumberLabelText: String = "", expirationLabelText: String = "", cvvLabelText: String = "") {
        
        do {
            try accept.presentPayVC(vC: vC,
                                    billingData: billingData,
                                    paymentKey: paymentKey,
                                    saveCardDefault: saveCardDefault,
                                    showSaveCard: showSaveCard,
                                    showAlerts: showAlerts,
                                    token: token,
                                    maskedPanNumber: maskedPanNumber,
                                    buttonsColor: buttonsColor,
                                    isEnglish: isEnglish,
                                    backgroundColor: backgroundColor,
                                    navBarColor: navBarColor,
                                    navBarTextColor: navBarTextColor,
                                    textFieldBackgroundColor: textFieldBackgroundColor,
                                    textFieldTextColor: textFieldTextColor,
                                    titleLabelTextColor: titleLabelTextColor,
                                    inputLabelTextColor: inputLabelTextColor)
        } catch let error as NSError {
                print("\(error.userInfo)")
        }
        
    }
    
    public func paymentAttemptFailed(_ error: AcceptSDKError, detailedDescription: String) {
        self.successCallback([false, detailedDescription, error.localizedDescription])
//        self.delegate?.rnPaymentAttemptFailed(error.localizedDescription, detailedDescription: detailedDescription)
    }
    
    public func transactionRejected(_ payData: PayResponse) {
//        self.delegate?.rnTransactionRejected(payResponseToDictionary(payData: payData))
        self.successCallback([false, 400, "Transaction Rejected!!"])
    }
    
    public func transactionAccepted(_ payData: PayResponse) {
//        self.delegate?.rnTransactionAccepted(payResponseToDictionary(payData: payData))
        self.successCallback([true, 0, "", ""])
    }
    
    public func transactionAccepted(_ payData: PayResponse, savedCardData: SaveCardResponse) {
//        self.delegate?.rnTransactionAccepted(payResponseToDictionary(payData: payData), savedCardData: saveCardResponseToDictionary(savedCardData: savedCardData))
        self.successCallback([true, 0, "", savedCardData.token])
    }
    
    public func userDidCancel3dSecurePayment(_ pendingPayData: PayResponse) {
//        self.delegate?.rnUserDidCancel3dSecurePayment(payResponseToDictionary(payData: pendingPayData))
        self.successCallback([false, 0, "User canceled 3-d secure verification!!"])
    }
    
    public func userDidCancel() {
//        self.delegate?.rnUserDidCancel()
        self.successCallback([false, 0, "User canceled!!"])
    }
    
    func saveCardResponseToDictionary(savedCardData: SaveCardResponse) -> [String : Any] {
        return [
            "card_subtype" : savedCardData.card_subtype,
            "id" : savedCardData.id,
            "token" : savedCardData.token,
            "created_at" : savedCardData.created_at,
            "masked_pan" : savedCardData.masked_pan,
            "merchant_id" : savedCardData.merchant_id,
            "order_id" : savedCardData.order_id as Any,
            "email" : savedCardData.email as Any
        ] as [String : Any]
    }
    
    func payResponseToDictionary(payData: PayResponse) -> [String : Any] {
        
        return [
            "amount_cents": payData.amount_cents,
             "is_refunded": payData.is_refunded,
             "is_capture": payData.is_capture,
             "captured_amount": payData.captured_amount,
             "source_data_type": payData.source_data_type,
             "pending": payData.pending,
             "is_3d_secure": payData.is_3d_secure,
             "id": payData.id,
             "is_void": payData.is_void,
             "currency": payData.currency,
             "is_auth": payData.is_auth,
             "is_refund": payData.is_refund,
             "owner": payData.owner,
             "is_voided": payData.is_voided,
             "source_data_pan": payData.source_data_pan,
             "profile_id": payData.profile_id,
             "success": payData.success,
             "dataMessage": payData.dataMessage,
             "source_data_sub_type": payData.source_data_sub_type,
             "error_occured": payData.error_occured,
             "is_standalone_payment": payData.is_standalone_payment,
             "created_at": payData.created_at,
             "refunded_amount_cents": payData.refunded_amount_cents,
             "integration_id": payData.integration_id,
             "order": payData.order
        ] as [String : Any]
        
    }
}
