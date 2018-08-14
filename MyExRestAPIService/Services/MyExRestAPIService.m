#import "MyExRestAPIService.h"
#import "NSStringHelper.h"

typedef void (^RequestDidCompleteSuccsess)(NSData *data, NSHTTPURLResponse *response);
#define SERVER_ROOT_URL @"https://api.blockbitdev.xyz"
#define SERVER_API_URL [SERVER_ROOT_URL stringByAppendingString:@"/frontoffice/"]
static NSString *const UserCountriesUrl = @"backoffice/countries";
static NSString *const CountryUrl = @"backoffice/country";
static NSString *const UserInfoUrl = @"backoffice/user";
static NSString *const User2FAUrl = @"api/profile/2fa";
static NSString *const ResetPasswordUrl = @"api/profile/reset-password";
static NSString *const ResendConfirmationEmailUrl = @"api/profile/resend-confirmation-email";
static NSString *const ConfirmEmailUrl = @"api/profile/confirm-email";
static NSString *const PasswordUrl = @"api/profile/2fa";
static NSString *const ReferralInfoUrl = @"backoffice/referral-info";
static NSString *const ReferralsUrl = @"backoffice/referrals";
static NSString *const ReferralDetailsUrl = @"backoffice/referral";
static NSString *const AssetsUrl = @"api/assets";
static NSString *const UserOrdersUrl = @"api/orders/my";
static NSString *const MakeOrderUrl = @"api/order";
static NSString *const OrderHistoryUrl = @"api/order_history";
static NSString *const DeleteOrdersUrl = @"api/orders";
static NSString *const SignInUrl = @"api/sign-in";
static NSString *const SignOutUrl = @"api/sign-out";
static NSString *const AssetsInfoUrl = @"api/assets-info";
static NSString *const WalletDepositUrl = @"api/wallet/deposit";
static NSString *const WithdrawalUrl = @"api/wallet/withdrawal";
static NSString *const SettingsUrl = @"api/settings";
static NSString *const SettingUrl = @"api/setting";
static NSString *const UploadAvatarRequestUrl = @"api/avatars/upload_request";
static NSString *const AvatarsUrl = @"api/avatars";
static NSString *const DocumentUrl = @"api/documents";
static NSString *const UploadDocumentRequestUrl = @"api/documents/upload_request";

@implementation MyExRestAPIService

- (instancetype) init {
    if (self = [super init]) {
        _cookieService = [[CookieService alloc] init];
        _config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _config.HTTPShouldSetCookies = NO;
        _config.HTTPCookieAcceptPolicy = NSHTTPCookieAcceptPolicyAlways;
        _session = [NSURLSession sessionWithConfiguration:_config delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    }
    return self;
}

// CountryAPI
//+
- (void) getAllCountriesWithSearch:(NSString *)search
                              page:(int)page perPage:(int)perPage
                      successBlock:(void (^)(AllCountriesDTOResponse *))successBlock
                      failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting user countries...");
    NSString *url = [NSString stringWithFormat:@"%@%@", UserCountriesUrl, [NSString stringWithFormat:@"?Search=%@&Page=%d&PerPage=%d", search, page, perPage]];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        AllCountriesDTOResponse *dto = [[AllCountriesDTOResponse alloc]
                                     initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getCountryById:(NSString *)countryId
           successBlock:(void (^)(GetCountryDTOResponse *))successBlock
           failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting a country...");
    if ([countryId isBlank]) {
        @throw [NSException exceptionWithName:@"Incorrect counryId" reason:@"getCountry" userInfo:nil];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@/%@", CountryUrl, countryId];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        GetCountryDTOResponse *dto = [[GetCountryDTOResponse alloc]
                                        initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) deleteCountryById:(NSString *)countryId
              successBlock:(void (^)(void))successBlock
              failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting delet a country ...");
    if ([countryId isBlank]) {
        @throw [NSException exceptionWithName:@"Incorrect counryId" reason:@"deleteCountry" userInfo:nil];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@/%@", CountryUrl, countryId];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"DELETE" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) addCountry:(CountryDTORequest *)dto
       successBlock:(void (^)(AddCountryDTOResponse *))successBlock
       failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting add country...");
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        AddCountryDTOResponse *dto = [[AddCountryDTOResponse alloc]
                                      initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:CountryUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) addOrReplaceCountry:(CountryDTORequest *)dto
                successBlock:(void (^)(AddOrReplaceCountryDTOResponse *))successBlock
                failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting add or replace country...");
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        AddOrReplaceCountryDTOResponse *dto = [[AddOrReplaceCountryDTOResponse alloc]
                                               initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:CountryUrl withRequestType:@"PUT" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// ProfileAPI
//+
- (void) resetPassword:(PasswordResetDTORequest *)dto
          successBlock:(void (^)(void))successBlock
          failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting reset a password ...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:ResetPasswordUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) password:(PasswordDTORequest *)dto
     successBlock:(void (^)(void))successBlock
     failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting ...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:PasswordUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) confirmEmail:(EmailConfirmationDTORequest *)dto
         successBlock:(void (^)(void))successBlock
         failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting confirm email");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:ConfirmEmailUrl  withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) resendConfirmationEmail:(ResendConfirmationEmailDTORequest *)dto
                    successBlock:(void (^)(void))successBlock
                    failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"sending a confirmation email ...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:ResendConfirmationEmailUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) get2FAOnSuccessBlock:(void (^)(User2FADTOResponse *))successBlock
                 failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting user's 2fa ...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        User2FADTOResponse *dto = [[User2FADTOResponse alloc]
                                   initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:User2FAUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) add2FAOnSuccessBlock:(void (^)(User2FADTOResponse *))successBlock
                 failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"adding 2fa ...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        User2FADTOResponse *dto = [[User2FADTOResponse alloc]
                                    initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:User2FAUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getUserInfoOnSuccessBlock:(void (^)(UserInfoDTOResponse *))successBlock
                      failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting fins user info ...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        UserInfoDTOResponse *dto = [[UserInfoDTOResponse alloc]
                                   initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:UserInfoUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// Refarral API
//+
- (void) getReferralsWithSearch:(NSString *)search page:(int)page perPage:(int)perPage
                   successBlock:(void (^)(ReferralsDTOResponse *))successBlock
                   failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting find referrals...");
    NSString *url = [NSString stringWithFormat:@"%@%@", ReferralsUrl, [NSString stringWithFormat:@"?Search=%@&Page=%d&PerPage=%d", search, page, perPage]];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        ReferralsDTOResponse *dto = [[ReferralsDTOResponse alloc]
                                    initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getReferralInfoOnSuccessBlock:(void (^)(ReferralInfoDTOResponse *))successBlock
                          failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting referrals info...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        ReferralInfoDTOResponse *dto = [[ReferralInfoDTOResponse alloc]
                                    initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:ReferralInfoUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getReferralDetailsById:(NSString *)userId
                   successBlock:(void (^)(ReferralDetailsDTOResponse *))successBlock
                   failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting referral details...");
    if ([userId isBlank]) {
        @throw [NSException exceptionWithName:@"Incorrect userId" reason:@"getReferralDetails" userInfo:nil];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@/%@/details", ReferralDetailsUrl, userId];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        ReferralDetailsDTOResponse *dto = [[ReferralDetailsDTOResponse alloc]
                                        initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

//+
- (void) getReferralInfoById:(NSString *)userId
                successBlock:(void (^)(ReferralInfoDTOResponse *))successBlock
                failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting referral info by userId...");
    if ([userId isBlank]) {
        @throw [NSException exceptionWithName:@"Incorrect counryId" reason:@"getReferralInfoById" userInfo:nil];
        return;
    }
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        ReferralInfoDTOResponse *dto = [[ReferralInfoDTOResponse alloc]
                                        initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    NSString *url = [NSString stringWithFormat:@"%@/%@", ReferralInfoUrl, userId];
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// TradeAPI
//+
- (void) makeOrder:(NewOrderDTORequest *)dto
      successBlock:(void (^)(MakeOrderDTOResponse *))successBlock
      failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"creating an order ...");
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        MakeOrderDTOResponse *dto = [[MakeOrderDTOResponse alloc]
                                        initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:MakeOrderUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) deleteOrderById:(NSString *)orderId
            successBlock:(void (^)(void))successBlock
            failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"start deleting an order ...");
    if ([orderId isBlank]) {
        @throw [NSException exceptionWithName:@"Incorrect orderId" reason:@"deleteOrder" userInfo:nil];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@/%@", DeleteOrdersUrl, orderId];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"DELETE" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) deleteAllOrdersOnSuccessBlock:(void (^)(DeletedOrdersDTOResponse *))successBlock
                          failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"start deleting orders ...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        DeletedOrdersDTOResponse *dto = [[DeletedOrdersDTOResponse alloc]
                                     initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:DeleteOrdersUrl withRequestType:@"DELETE" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getUserOrdersOnSuccessBlock:(void (^)(UserOrdersDTOResponse *))successBlock
                        failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting find user orders...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        UserOrdersDTOResponse *dto = [[UserOrdersDTOResponse alloc]
                                         initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:UserOrdersUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getOrderHistoryWithLimit:(int)limit
                           offset:(int)offset
                     successBlock:(void (^)(OrderHistoryDTOResponse *))successBlock
                     failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"starting find user orders...");
    NSString *url = [NSString stringWithFormat:@"%@%@", OrderHistoryUrl, [NSString stringWithFormat:@"?offset=%d&limit=%d", offset, limit]];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        OrderHistoryDTOResponse *dto = [[OrderHistoryDTOResponse alloc]
                                      initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getAssetsOnSuccessBlock:(void (^)(AssetsDTOResponse *))successBlock
                    failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting assets...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        AssetsDTOResponse *dto = [[AssetsDTOResponse alloc]
                                        initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:AssetsUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// LoginAPI
//+
- (void) login:(LoginDTORequest *)dto
  successBlock:(void (^)(LoginDTOResponse *))successBlock
  failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"loggining...");
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [_cookieService deleteAllCookies];
    [_cookieService saveAllCookies:storage];
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSArray* authToken = [NSHTTPCookie
                              cookiesWithResponseHeaderFields:[response allHeaderFields]
                              forURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", SERVER_API_URL, SignInUrl]]];
        if([authToken count] > 0) {
            [storage setCookie:authToken[0]];
            [self->_cookieService saveAllCookies:storage];
        }
        
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        LoginDTOResponse *dto = [[LoginDTOResponse alloc]
                                  initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:SignInUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) logoutOnSuccessBlock:(void (^)(void))successBlock
                 failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"log out starting...");
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        [self->_cookieService deleteAllCookies];
        [self->_cookieService saveAllCookies:[NSHTTPCookieStorage sharedHTTPCookieStorage]];
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:nil toURL:SignOutUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// AssetAPI
//+
- (void) getAssetsInfoOnSuccessBlock:(void (^)(AssetsInfoDTOResponse *))successBlock
                        failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting assets info...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        AssetsInfoDTOResponse *dto = [[AssetsInfoDTOResponse alloc]
                                  initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:AssetsInfoUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// WalletAPI

- (void) doWithdrawal:(WithdrawalDTORequest *)dto
         successBlock:(void (^)(void))successBlock
         failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"trying get withdrawal...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:WithdrawalUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

- (void) createWalletDeposit:(WalletDepositDTORequest *)dto
                successBlock:(void (^)(WalletDepositDTOResponse *))successBlock
                failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"creating a wallet deposit...");
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        WalletDepositDTOResponse *dto = [[WalletDepositDTOResponse alloc]
                                      initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:WalletDepositUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// SettingsAPI
//+
- (void) getUserSettingsOnSuccessBlock:(void (^)(SettingsDTOResponse *))successBlock
                          failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting settings...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        SettingsDTOResponse *dto = [[SettingsDTOResponse alloc]
                                         initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:SettingsUrl withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) addUserSetting:(SettingDTORequest *)dto
           successBlock:(void (^)(void))successBlock
           failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"adding a setting...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:SettingUrl withRequestType:@"PUT" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) deleteUserSetting:(SettingDTORequest *)dto
              successBlock:(void (^)(void))successBlock
              failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"deleting a setting...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:SettingUrl withRequestType:@"DELETE" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// AvatarAPI
//+
- (void) addAvatar:(AddAvatarDTORequest *)dto
      successBlock:(void (^)(void))successBlock
      failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"adding an avatar...");
    NSData *jsonData = [self makeRequestBody:dto];
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        if (successBlock)
            successBlock();
    };
    [self doRequestWithJson:jsonData toURL:AvatarsUrl withRequestType:@"PUT" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) deleteAvatarsOnSuccessBlock:(void (^)(DeleteAvatarsDTOResponse *))successBlock
                        failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"deletting avatars...");
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        DeleteAvatarsDTOResponse *dto = [[DeleteAvatarsDTOResponse alloc]
                                         initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:AvatarsUrl withRequestType:@"DELETE" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) createUploadAvatarRequest:(UploadRequestDTORequest *)dto
                      successBlock:(void (^)(UploadRequestDTOResponse *))successBlock
                      failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"creating upload avatar request...");
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        UploadRequestDTOResponse *dto = [[UploadRequestDTOResponse alloc]
                                               initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:UploadAvatarRequestUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

// DocumentAPI
//+
- (void) createUploadDocumentRequest:(UploadRequestDTORequest *)dto
                        successBlock:(void (^)(UploadRequestDTOResponse *))successBlock
                        failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"creating upload document request...");
    NSData *jsonData = [self makeRequestBody:dto];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        UploadRequestDTOResponse *dto = [[UploadRequestDTOResponse alloc]
                                         initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:jsonData toURL:UploadDocumentRequestUrl withRequestType:@"POST" successBlock:requestSuccessBlock failureBlock:failureBlock];
}
//+
- (void) getDocument:(DocumentDTORequest *)dto
        successBlock:(void (^)(DocumentDTOResponse *))successBlock
        failureBlock:(void (^)(ResponseError *))failureBlock
{
    NSLog(@"getting a document ...");
    if ([dto.uploadUid isBlank]) {
        @throw [NSException exceptionWithName:@"Incorrect uploadUid" reason:@"getDocument" userInfo:nil];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", DocumentUrl, dto.uploadUid, @"link"];
    __weak typeof(self) weakSelf = self;
    RequestDidCompleteSuccsess requestSuccessBlock = ^(NSData *data, NSHTTPURLResponse *response) {
        NSDictionary *dictionary = [weakSelf toDictionaryFromData:data];
        DocumentDTOResponse *dto = [[DocumentDTOResponse alloc]
                                         initFromDictionary:dictionary];
        if (successBlock)
            successBlock(dto);
    };
    [self doRequestWithJson:nil toURL:url withRequestType:@"GET" successBlock:requestSuccessBlock failureBlock:failureBlock];
}

- (NSData*) makeRequestBody:(id <DTORequest>) dto {
    NSLog(@"making request body...");
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[dto toDictionary] options:0 error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    }
    else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString);
        return [NSData dataWithBytes:[jsonString UTF8String] length:[jsonString lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    }
    return jsonData;
}

- (void) doRequestWithJson:(NSData*)jsonData
                     toURL:(NSString*)urlString
           withRequestType:(NSString*)type
                   successBlock:(RequestDidCompleteSuccsess)successBlock
                   failureBlock:(void(^)(ResponseError *error))failureBlock
{
    NSLog(@"starting request...");
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat: @"%@%@", SERVER_API_URL, urlString]];
    NSLog(@"%@", requestURL);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    if ([cookies count] > 0) {
        NSDictionary* headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        [request setAllHTTPHeaderFields:headers];
    }
    
    [request setHTTPMethod:type];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    if (jsonData != nil) {
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]]
       forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: jsonData];
    }
    
    void (^requestDidCompleteBlock)(NSData *, NSURLResponse *, NSError *);
    requestDidCompleteBlock = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error && failureBlock) {
            failureBlock([[ResponseError alloc] initWithMessage:@"UnknownError" withStatusCode:@"UnknownError" withMessageCode:@"UnknownError"]);
            return;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
        if ([self isRequestSuccess:httpResponse.statusCode]) {
            NSLog(@"Sucseefull");
            if (successBlock)
                successBlock(data, httpResponse);
            return;
        }
        NSLog(@"%@", httpResponse);
        if (!failureBlock) return;
        NSString *code = [NSString stringWithFormat:@"%li", httpResponse.statusCode];
        if (httpResponse.statusCode == 401) {
            failureBlock([[ResponseError alloc] initWithMessage:@"Unauthorized" withStatusCode:code withMessageCode:@""]);
        }
        else if ([self isRequestDidCompleteWithServerError:httpResponse.statusCode]) {
            failureBlock([[ResponseError alloc] initWithMessage:@"ServerError" withStatusCode:code withMessageCode:@""]);
        }
        else {
            NSDictionary *dictionary = [self toDictionaryFromData:data];
            for (NSDictionary *subdict in [dictionary objectForKey:@"errors"]) {
                NSString *statusCode = [NSString stringWithFormat:@"%li", httpResponse.statusCode];
                if (!subdict) {
                    failureBlock([[ResponseError alloc] initWithMessage:@"" withStatusCode:statusCode withMessageCode:@""]);
                    return;
                }
                NSString *message = (NSString*) [subdict objectForKey:@"message"];
                NSString *messageCode = (NSString*) [subdict objectForKey:@"code"];
                failureBlock([[ResponseError alloc] initWithMessage:message withStatusCode:statusCode withMessageCode:messageCode]);
                break;
            }
        }
    };
    
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request
                                             completionHandler:requestDidCompleteBlock];
    [task resume];
}


- (NSDictionary*) toDictionaryFromData:(NSData*) data {
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!dictionary)
        @throw [NSException exceptionWithName:@"IncorrectJSON" reason:@"JSON" userInfo:nil];
    NSLog(@"%@", dictionary);
    return dictionary;
}

- (BOOL) isRequestSuccess:(NSInteger) statusCode {
    unichar firstNumber = [[NSString stringWithFormat:@"%ld", statusCode] characterAtIndex:0];
    if (firstNumber == '2') return TRUE;
    else return FALSE;
}

- (BOOL) isRequestDidCompleteWithServerError:(NSInteger) statusCode {
    unichar firstNumber = [[NSString stringWithFormat:@"%ld", statusCode] characterAtIndex:0];
    if (firstNumber == '5') return TRUE;
    else return FALSE;
}

@end
