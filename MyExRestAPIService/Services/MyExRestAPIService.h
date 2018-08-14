#import <Foundation/Foundation.h>
#import "DTORequest.h"
#import "DTOResponse.h"
#import "ResponseError.h"
#import "AddCountryDTOResponse.h"
#import "GetCountryDTOResponse.h"
#import "AllCountriesDTOResponse.h"
#import "ResendConfirmationEmailDTORequest.h"
#import "PasswordDTORequest.h"
#import "UserInfoDTOResponse.h"
#import "User2FADTOResponse.h"
#import "ReferralsDTOResponse.h"
#import "ReferralInfoDTOResponse.h"
#import "ReferralDetailsDTOResponse.h"
#import "MakeOrderDTOResponse.h"
#import "OrderHistoryDTOResponse.h"
#import "UserOrdersDTOResponse.h"
#import "AssetsDTOResponse.h"
#import "DeleteOrdersDTOResponse.h"
#import "NewOrderDTORequest.h"
#import "LoginDTORequest.h"
#import "LoginDTOResponse.h"
#import "CookieService.h"
#import "AssetsInfoDTOResponse.h"
#import "WalletDepositDTOResponse.h"
#import "WalletDepositDTORequest.h"
#import "WithdrawalDTORequest.h"
#import "SettingsDTOResponse.h"
#import "SettingDTORequest.h"
#import "DeleteAvatarsDTOResponse.h"
#import "UploadRequestDTOResponse.h"
#import "UploadRequestDTORequest.h"
#import "AddAvatarDTORequest.h"
#import "DocumentDTOResponse.h"
#import "DocumentDTORequest.h"
#import "AddOrReplaceCountryDTOResponse.h"
#import "CountryDTORequest.h"
#import "EmailConfirmationDTORequest.h"
#import "PasswordResetDTORequest.h"

@interface MyExRestAPIService : NSObject {
    NSURLSession *_session;
    NSURLSessionConfiguration *_config;
    CookieService *_cookieService;
}

- (void) getCountryById:(NSString*)countryId
           successBlock:(void(^)(GetCountryDTOResponse *dto))successBlock
           failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getAllCountriesWithSearch:(NSString*)search
                              page:(int)page
                           perPage:(int)perPage
                      successBlock:(void(^)(AllCountriesDTOResponse *dto))successBlock
                      failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteCountryById:(NSString*)countryId
              successBlock:(void(^)(void))successBlock
              failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) addCountry:(CountryDTORequest*)dto
       successBlock:(void(^)(AddCountryDTOResponse *dto))successBlock
       failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) addOrReplaceCountry:(CountryDTORequest*)dto
                successBlock:(void(^)(AddOrReplaceCountryDTOResponse *dto))successBlock
                failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) resendConfirmationEmail:(ResendConfirmationEmailDTORequest*)dto
                    successBlock:(void(^)(void))successBlock
                    failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) confirmEmail:(EmailConfirmationDTORequest*)dto
         successBlock:(void(^)(void))successBlock
         failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) resetPassword:(PasswordResetDTORequest*)dto
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

- (void) getReferralInfoById:(NSString*)userId
                successBlock:(void(^)(ReferralInfoDTOResponse *dto))successBlock
                failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getReferralsWithSearch:(NSString*)search
                           page:(int)page
                        perPage:(int)perPage
         successBlock:(void(^)(ReferralsDTOResponse *dto))successBlock
         failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getReferralDetailsById:(NSString*)userId
                   successBlock:(void(^)(ReferralDetailsDTOResponse *dto))successBlock
                   failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getAssetsOnSuccessBlock:(void(^)(AssetsDTOResponse *dto))successBlock
                    failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getUserOrdersOnSuccessBlock:(void(^)(UserOrdersDTOResponse *dto))successBlock
                        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) makeOrder:(NewOrderDTORequest*)dto
      successBlock:(void(^)(MakeOrderDTOResponse *dto))successBlock
      failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteOrderById:(NSString*)orderId
            successBlock:(void(^)(void))successBlock
            failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteAllOrdersOnSuccessBlock:(void(^)(DeletedOrdersDTOResponse *dto))successBlock
                          failureBlock:(void(^)(ResponseError *error))failureBlock;
                      
- (void) getOrderHistoryWithLimit:(int)limit
                           offset:(int)offset
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

- (void) addUserSetting:(SettingDTORequest*)dto
           successBlock:(void(^)(void))successBlock
           failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteUserSetting:(SettingDTORequest*)dto
              successBlock:(void(^)(void))successBlock
              failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) createUploadAvatarRequest:(UploadRequestDTORequest*)dto
                successBlock:(void(^)(UploadRequestDTOResponse *dto))successBlock
                failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) addAvatar:(AddAvatarDTORequest*)dto
      successBlock:(void(^)(void))successBlock
      failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) deleteAvatarsOnSuccessBlock:(void(^)(DeleteAvatarsDTOResponse *dto))successBlock
                        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) createUploadDocumentRequest:(UploadRequestDTORequest*)dto
                        successBlock:(void(^)(UploadRequestDTOResponse *dto))successBlock
                        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (void) getDocument:(DocumentDTORequest*)dto
        successBlock:(void(^)(DocumentDTOResponse *dto))successBlock
        failureBlock:(void(^)(ResponseError *error))failureBlock;

- (NSDictionary*) toDictionaryFromData:(NSData*)data;
- (BOOL) isRequestSuccess:(NSInteger)statusCode;

@end

