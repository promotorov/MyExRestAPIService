#import <Foundation/Foundation.h>
#import "DTORequest.h"
#import "DTOResponse.h"
#import "ResponseError.h"
#import "AddCountryDTOResponse.h"
#import "GetCountryDTOResponse.h"
#import "AllCountriesDTOResponse.h"
#import "DeleteCountryDTORequest.h"
#import "AllCountriesDTORequest.h"
#import "GetCountryDTORequest.h"
#import "AddCountryDTORequest.h"
#import "ResendConfirmationEmailDTORequest.h"
#import "ConfirmEmailDTORequest.h"
#import "PasswordDTORequest.h"
#import "ResetPasswordDTORequest.h"
#import "UserInfoDTOResponse.h"
#import "User2FADTOResponse.h"
#import "GetReferralsDTORequest.h"
#import "GetReferralInfoDTORequest.h"
#import "ReferralsDTOResponse.h"
#import "ReferralInfoDTOResponse.h"
#import "ReferralDetailsDTOResponse.h"
#import "MakeOrderDTOResponse.h"
#import "OrderHistoryDTOResponse.h"
#import "UserOrdersDTOResponse.h"
#import "AssetsDTOResponse.h"
#import "DeleteOrdersDTOResponse.h"
#import "OrderHistoryDTORequest.h"
#import "MakeOrderDTORequest.h"
#import "DeleteOrderDTORequest.h"
#import "LoginDTORequest.h"
#import "LoginDTOResponse.h"
#import "CookieService.h"
#import "AssetsInfoDTOResponse.h"
#import "WalletDepositDTOResponse.h"
#import "WalletDepositDTORequest.h"
#import "WithdrawalDTORequest.h"
#import "SettingsDTOResponse.h"
#import "AddSettingDTORequest.h"
#import "DeleteSettingDTORequest.h"

@interface MyExRestAPIService : NSObject {
    NSURLSession *_session;
    NSURLSessionConfiguration *_config;
    CookieService *_cookieService;
}

- (void) getCountry:(GetCountryDTORequest*)dto
       successBlock:(void(^)(GetCountryDTOResponse *dto))successBlock
       failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getAllCountries:(AllCountriesDTORequest*)dto
            successBlock:(void(^)(AllCountriesDTOResponse *dto))successBlock
            failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteCountry:(DeleteCountryDTORequest*)dto
          successBlock:(void(^)(void))successBlock
          failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) addCountry:(AddCountryDTORequest*)dto
       successBlock:(void(^)(AddCountryDTOResponse *dto))successBlock
       failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) resendConfirmationEmail:(ResendConfirmationEmailDTORequest*)dto
                    successBlock:(void(^)(void))successBlock
                    failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) confirmEmail:(ConfirmEmailDTORequest*)dto
         successBlock:(void(^)(void))successBlock
         failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) resetPassword:(ResetPasswordDTORequest*)dto
          successBlock:(void(^)(void))successBlock
          failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) password:(PasswordDTORequest*)dto
     successBlock:(void(^)(void))successBlock
     failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getUserInfoOnSuccessBlock:(void(^)(UserInfoDTOResponse *dto))successBlock
                      failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) add2FAOnSuccessBlock:(void(^)(User2FADTOResponse *dto))successBlock
                 failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) get2FAOnSuccessBlock:(void(^)(User2FADTOResponse *dto))successBlock
                     failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getReferralInfoOnSuccessBlock:(void(^)(ReferralInfoDTOResponse *dto))successBlock
                          failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getReferralInfoById:(GetReferralInfoDTORequest*)dto
                successBlock:(void(^)(ReferralInfoDTOResponse *dto))successBlock
                failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getReferrals:(GetReferralsDTORequest*)dto
         successBlock:(void(^)(ReferralsDTOResponse *dto))successBlock
         failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getReferralDetails:(GetReferralInfoDTORequest*)dto
                successBlock:(void(^)(ReferralDetailsDTOResponse *dto))successBlock
               failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getAssetsOnSuccessBlock:(void(^)(AssetsDTOResponse *dto))successBlock
                    failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getUserOrdersOnSuccessBlock:(void(^)(UserOrdersDTOResponse *dto))successBlock
                        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) makeOrder:(MakeOrderDTORequest*)dto
      successBlock:(void(^)(MakeOrderDTOResponse *dto))successBlock
      failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteOrder:(DeleteOrderDTORequest*)dto
        successBlock:(void(^)(void))successBlock
        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteAllOrdersOnSuccessBlock:(void(^)(DeletedOrdersDTOResponse *dto))successBlock
                          failureBlock:(void(^)(ResponseError *error))failureBlock;
                      
- (void) getOrderHistory:(OrderHistoryDTORequest*)dto
            successBlock:(void(^)(OrderHistoryDTOResponse *dto))successBlock
            failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) login:(LoginDTORequest *)dto
  successBlock:(void(^)(LoginDTOResponse *dto))successBlock
  failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) logoutOnSuccessBlock:(void(^)(void))successBlock
                 failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getAssetsInfoOnSuccessBlock:(void(^)(AssetsInfoDTOResponse *dto))successBlock
                        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) createWalletDeposit:(WalletDepositDTORequest*)dto
                successBlock:(void(^)(WalletDepositDTOResponse *dto))successBlock
                failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) doWithdrawal:(WithdrawalDTORequest*)dto
         successBlock:(void(^)(void))successBlock
         failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getUserSettingsOnSuccessBlock:(void(^)(SettingsDTOResponse *dto))successBlock
                          failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) addUserSetting:(AddSettingDTORequest*)dto
           successBlock:(void(^)(void))successBlock
           failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteUserSetting:(DeleteSettingDTORequest*)dto
           successBlock:(void(^)(void))successBlock
           failureBlock:(void(^)(ResponseError *error))failureBlock;

- (NSDictionary*) toDictionaryFromData:(NSData*)data;
- (BOOL) isRequestSuccess:(NSInteger)statusCode;

@end

