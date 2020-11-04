#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>


//@implementation RNPaymobAccept
//
//RCT_EXPORT_MODULE()
//
//RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
//{
//    // TODO: Implement some actually useful functionality
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
//}
//
//@end

@interface RCT_EXTERN_MODULE(RNPaymobAccept, RCTViewManager)
RCT_EXTERN_METHOD(playSound:(NSString *)url)
RCT_EXTERN_METHOD(payWithNoToken:(NSDictionary *)json successCallback:(RCTResponseSenderBlock)successCallback errorCallback:(RCTResponseErrorBlock)errorCallback)
RCT_EXTERN_METHOD(presentPayVC:(UIViewController)vc
                 billingData:(NSDictionary<NSString,NSString>)billingData
                 paymentKey:(NSString) paymentKey
                 saveCardDefault: (BOOL)saveCardDefault
                 showSaveCard: (BOOL)showSaveCard
                 showAlerts: (BOOL)showAlerts
                 token(NSString): [token
                                   maskedPanNumber:(NSString)maskedPanNumber
                                   buttonsColor:(UIColor)buttonsColor
                 isEnglish: (BOOL)isEnglish
                 backgroundColor:(UIColor)backgroundColor
                 navBarColor:(UIColor)navBarColor
                 textFieldBackgroundColor:(UIColor)textFieldBackgroundColor
                                   textFieldTextColor:(UIColor)textFieldTextColor
                                   titleLabelTextColor:(UIColor)titleLabelTextColor
                                   inputLabelTextColor:(UIColor)inputLabelTextColor
                                   buttonText:(NSString) buttonText
                                   cardNameLabelText:(NSString) cardNameLabelText
                                   cardNumberLabelText:(NSString) cardNumberLabelText
                                   expirationLabelText:(NSString) expirationLabelText
                                   cvvLabelText:(NSString) cvvLabelText
                 )
+ (BOOL)requiresMainQueueSetup
{
    return YES;
}
@end
//@interface RNPaymobAccept : NSObject
//@end
//
//@interface RNPaymobAccept (RCTExternModule) <RCTBridgeModule>
//@end
//
//@implementation RNPaymobAccept (RCTExternModule)
//dispatch_queue_t RCTJSThread;
//void RCTRegisterModule(Class);
//+ (NSString *)moduleName {
//    return @"RNPaymobAccept";
//}
//+ (void)load {
//    RCTRegisterModule(self);
//}
//
//+ (const RCTMethodInfo *)__rct_export__uniqueID {
//    static RCTMethodInfo config = {"payWithNoToken"};
//    return &config;
//}
//@end
