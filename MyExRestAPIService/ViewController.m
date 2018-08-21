#import "ViewController.h"
#import "MyExRestAPIService.h"
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
#import "AddOrReplaceCountryDTOResponse.h"
#import "CountryDTORequest.h"
#import "EmailConfirmationDTORequest.h"
#import "PasswordResetDTORequest.h"
#import "UserDTORequest.h"
#import "DownloadLinkDTOResponse.h"
#import "UploadingDTOResponse.h"
#import "DocumentsDTOResponse.h"

@interface ViewController ()

@end

@implementation ViewController

UILabel *pressedButton;
UILabel *logoutResponseStatus;
UILabel *userResponseStatus;
id<DTOResponse> dtoResponse;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _service = [[MyExRestAPIService alloc] init];
    _cookie = [[CookieService alloc] init];
    [_cookie loadSavedCookies];
    UILabel *loadedCookieNumber = [[UILabel alloc] init];
    loadedCookieNumber.textColor = [UIColor blackColor];
    [loadedCookieNumber setFrame:CGRectMake(30, 105, 250, 30)];
    loadedCookieNumber.backgroundColor=[UIColor clearColor];
    loadedCookieNumber.userInteractionEnabled=NO;
    loadedCookieNumber.text= [NSString stringWithFormat:@"total loaded cookies: %li",
                              [[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies count]];
    [self.view addSubview:loadedCookieNumber];
    
    pressedButton = [[UILabel alloc] init];
    pressedButton.textColor = [UIColor blackColor];
    [pressedButton setFrame:CGRectMake(290, 105, 100, 30)];
    pressedButton.backgroundColor=[UIColor clearColor];
    pressedButton.userInteractionEnabled=NO;
    pressedButton.text = @"Nothing";
    [self.view addSubview:pressedButton];
    
    logoutResponseStatus = [[UILabel alloc] init];
    logoutResponseStatus.textColor = [UIColor blackColor];
    [logoutResponseStatus setFrame:CGRectMake(290, 140, 100, 30)];
    logoutResponseStatus.backgroundColor=[UIColor clearColor];
    logoutResponseStatus.userInteractionEnabled=NO;
    logoutResponseStatus.text = @"Nothing";
    [self.view addSubview:logoutResponseStatus];
    
    userResponseStatus = [[UILabel alloc] init];
    userResponseStatus.textColor = [UIColor blackColor];
    [userResponseStatus setFrame:CGRectMake(290, 200, 100, 30)];
    userResponseStatus.backgroundColor=[UIColor clearColor];
    userResponseStatus.userInteractionEnabled=NO;
    userResponseStatus.text = @"NothingP";
    [self.view addSubview:userResponseStatus];
    
    UIButton *loginCorrectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginCorrectButton addTarget:self
                           action:@selector(testLoginCorrect:)
                 forControlEvents:UIControlEventTouchUpInside];
    loginCorrectButton.backgroundColor =[UIColor blackColor];
    [loginCorrectButton setTitle:@"CorrectLogin" forState:UIControlStateNormal];
    loginCorrectButton.frame = CGRectMake(30, 50, 150, 50);
    [self.view addSubview:loginCorrectButton];
    
    UIButton *loginInCorrectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginInCorrectButton addTarget:self
                             action:@selector(testLoginInCorrect:)
                   forControlEvents:UIControlEventTouchUpInside];
    loginInCorrectButton.backgroundColor =[UIColor blackColor];
    [loginInCorrectButton setTitle:@"FalsetLogin" forState:UIControlStateNormal];
    loginInCorrectButton.frame = CGRectMake(200, 50, 150, 50);
    [self.view addSubview:loginInCorrectButton];
    
    UIButton *logOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [logOutButton addTarget:self
                     action:@selector(testLogout:)
           forControlEvents:UIControlEventTouchUpInside];
    logOutButton.backgroundColor =[UIColor blackColor];
    [logOutButton setTitle:@"Logout" forState:UIControlStateNormal];
    logOutButton.frame = CGRectMake(30, 140, 150, 50);
    [self.view addSubview:logOutButton];
    
    UIButton *userButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [userButton addTarget:self
                   action:@selector(testUser:)
         forControlEvents:UIControlEventTouchUpInside];
    userButton.backgroundColor =[UIColor blackColor];
    [userButton setTitle:@"User" forState:UIControlStateNormal];
    userButton.frame = CGRectMake(30, 200, 150, 50);
    [self.view addSubview:userButton];
    
    UIButton *userOrdersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [userOrdersButton addTarget:self
                         action:@selector(testUserOrders:)
               forControlEvents:UIControlEventTouchUpInside];
    userOrdersButton.backgroundColor =[UIColor blackColor];
    [userOrdersButton setTitle:@"UserOrders" forState:UIControlStateNormal];
    userOrdersButton.frame = CGRectMake(30, 260, 150, 25);
    [self.view addSubview:userOrdersButton];
    
    UIButton *makeOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [makeOrderButton addTarget:self
                        action:@selector(testMakeOrder:)
              forControlEvents:UIControlEventTouchUpInside];
    makeOrderButton.backgroundColor =[UIColor blackColor];
    [makeOrderButton setTitle:@"MakeOrder" forState:UIControlStateNormal];
    makeOrderButton.frame = CGRectMake(30, 290, 150, 25);
    [self.view addSubview:makeOrderButton];
    
    UIButton *deleteOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteOrderButton addTarget:self
                          action:@selector(testDeleteOrder:)
                forControlEvents:UIControlEventTouchUpInside];
    deleteOrderButton.backgroundColor =[UIColor blackColor];
    [deleteOrderButton setTitle:@"DeleteOrder" forState:UIControlStateNormal];
    deleteOrderButton.frame = CGRectMake(200, 290, 150, 25);
    [self.view addSubview:deleteOrderButton];
    
    UIButton *deleteAllOrdersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteAllOrdersButton addTarget:self
                              action:@selector(testDeleteAllOrders:)
                    forControlEvents:UIControlEventTouchUpInside];
    deleteAllOrdersButton.backgroundColor =[UIColor blackColor];
    [deleteAllOrdersButton setTitle:@"DeleteAllOrders" forState:UIControlStateNormal];
    deleteAllOrdersButton.frame = CGRectMake(30, 320, 150, 25);
    [self.view addSubview:deleteAllOrdersButton];
    
    UIButton *orderHistoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [orderHistoryButton addTarget:self
                           action:@selector(testOrderHistory:)
                 forControlEvents:UIControlEventTouchUpInside];
    orderHistoryButton.backgroundColor =[UIColor blackColor];
    [orderHistoryButton setTitle:@"OrderHistory" forState:UIControlStateNormal];
    orderHistoryButton.frame = CGRectMake(200, 320, 150, 25);
    [self.view addSubview:orderHistoryButton];
    
    UIButton *getAssetsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [getAssetsButton addTarget:self
                        action:@selector(testAssets:)
              forControlEvents:UIControlEventTouchUpInside];
    getAssetsButton.backgroundColor =[UIColor blackColor];
    [getAssetsButton setTitle:@"Assets" forState:UIControlStateNormal];
    getAssetsButton.frame = CGRectMake(30, 350, 150, 25);
    [self.view addSubview:getAssetsButton];
    
    UIButton *getCountryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [getCountryButton addTarget:self
                         action:@selector(testCountry:)
               forControlEvents:UIControlEventTouchUpInside];
    getCountryButton.backgroundColor =[UIColor blackColor];
    [getCountryButton setTitle:@"Country" forState:UIControlStateNormal];
    getCountryButton.frame = CGRectMake(200, 350, 150, 25);
    [self.view addSubview:getCountryButton];
    
    UIButton *getUserCountriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [getUserCountriesButton addTarget:self
                               action:@selector(testUserCountries:)
                     forControlEvents:UIControlEventTouchUpInside];
    getUserCountriesButton.backgroundColor =[UIColor blackColor];
    [getUserCountriesButton setTitle:@"UserCountries" forState:UIControlStateNormal];
    getUserCountriesButton.frame = CGRectMake(30, 380, 150, 25);
    [self.view addSubview:getUserCountriesButton];
    
    UIButton *deleteCountryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteCountryButton addTarget:self
                            action:@selector(testDeleteCountry:)
                  forControlEvents:UIControlEventTouchUpInside];
    deleteCountryButton.backgroundColor =[UIColor blackColor];
    [deleteCountryButton setTitle:@"DeleteCountry" forState:UIControlStateNormal];
    deleteCountryButton.frame = CGRectMake(200, 380, 150, 25);
    [self.view addSubview:deleteCountryButton];
    
    UIButton *addCountryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addCountryButton addTarget:self
                         action:@selector(testAddCountry:)
               forControlEvents:UIControlEventTouchUpInside];
    addCountryButton.backgroundColor =[UIColor blackColor];
    [addCountryButton setTitle:@"AddCountry" forState:UIControlStateNormal];
    addCountryButton.frame = CGRectMake(30, 410, 150, 25);
    [self.view addSubview:addCountryButton];
    
    UIButton *resetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [resetPasswordButton addTarget:self
                            action:@selector(testResetPassword:)
                  forControlEvents:UIControlEventTouchUpInside];
    resetPasswordButton.backgroundColor =[UIColor blackColor];
    [resetPasswordButton setTitle:@"ResetPassword" forState:UIControlStateNormal];
    resetPasswordButton.frame = CGRectMake(200, 410, 150, 25);
    [self.view addSubview:resetPasswordButton];
    
    UIButton *resendConfirmationEmailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [resendConfirmationEmailButton addTarget:self
                                      action:@selector(testResendEmail:)
                            forControlEvents:UIControlEventTouchUpInside];
    resendConfirmationEmailButton.backgroundColor =[UIColor blackColor];
    [resendConfirmationEmailButton setTitle:@"ResendConfirmationEmail" forState:UIControlStateNormal];
    resendConfirmationEmailButton.frame = CGRectMake(30, 440, 150, 25);
    [self.view addSubview:resendConfirmationEmailButton];
    
    UIButton *user2FAbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [user2FAbutton addTarget:self
                      action:@selector(testUser2FA:)
            forControlEvents:UIControlEventTouchUpInside];
    user2FAbutton.backgroundColor =[UIColor blackColor];
    [user2FAbutton setTitle:@"User2FA" forState:UIControlStateNormal];
    user2FAbutton.frame = CGRectMake(200, 440, 150, 25);
    [self.view addSubview:user2FAbutton];
    
    UIButton *add2FAbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [add2FAbutton addTarget:self
                     action:@selector(testAdd2FA:)
           forControlEvents:UIControlEventTouchUpInside];
    add2FAbutton.backgroundColor =[UIColor blackColor];
    [add2FAbutton setTitle:@"Add2FA" forState:UIControlStateNormal];
    add2FAbutton.frame = CGRectMake(30, 470, 150, 25);
    [self.view addSubview:add2FAbutton];
    
    UIButton *getAssetsInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [getAssetsInfoButton addTarget:self
                            action:@selector(testAssetsInfo:)
                  forControlEvents:UIControlEventTouchUpInside];
    getAssetsInfoButton.backgroundColor =[UIColor blackColor];
    [getAssetsInfoButton setTitle:@"AssetsInfo" forState:UIControlStateNormal];
    getAssetsInfoButton.frame = CGRectMake(200, 470, 150, 25);
    [self.view addSubview:getAssetsInfoButton];
    
    UIButton *getUserSettings = [UIButton buttonWithType:UIButtonTypeCustom];
    [getUserSettings addTarget:self
                        action:@selector(testUserSettings:)
              forControlEvents:UIControlEventTouchUpInside];
    getUserSettings.backgroundColor =[UIColor blackColor];
    [getUserSettings setTitle:@"UserSettings" forState:UIControlStateNormal];
    getUserSettings.frame = CGRectMake(30, 500, 150, 25);
    [self.view addSubview:getUserSettings];
    
    UIButton *getReferralInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    [getReferralInfo addTarget:self
                        action:@selector(testReferralInfo:)
              forControlEvents:UIControlEventTouchUpInside];
    getReferralInfo.backgroundColor =[UIColor blackColor];
    [getReferralInfo setTitle:@"ReferralInfo" forState:UIControlStateNormal];
    getReferralInfo.frame = CGRectMake(200, 500, 150, 25);
    [self.view addSubview:getReferralInfo];
    
    UIButton *getReferrals = [UIButton buttonWithType:UIButtonTypeCustom];
    [getReferrals addTarget:self
                     action:@selector(testReferrals:)
           forControlEvents:UIControlEventTouchUpInside];
    getReferrals.backgroundColor =[UIColor blackColor];
    [getReferrals setTitle:@"Referrals" forState:UIControlStateNormal];
    getReferrals.frame = CGRectMake(30, 530, 150, 25);
    [self.view addSubview:getReferrals];
    
    UIButton *getReferralInfoById = [UIButton buttonWithType:UIButtonTypeCustom];
    [getReferralInfoById addTarget:self
                            action:@selector(testReferralInfoById:)
                  forControlEvents:UIControlEventTouchUpInside];
    getReferralInfoById.backgroundColor =[UIColor blackColor];
    [getReferralInfoById setTitle:@"ReferralInfoById" forState:UIControlStateNormal];
    getReferralInfoById.frame = CGRectMake(200, 530, 150, 25);
    [self.view addSubview:getReferralInfoById];
    
    UIButton *getReferralDetails = [UIButton buttonWithType:UIButtonTypeCustom];
    [getReferralDetails addTarget:self
                           action:@selector(testReferralDetails:)
                 forControlEvents:UIControlEventTouchUpInside];
    getReferralDetails.backgroundColor =[UIColor blackColor];
    [getReferralDetails setTitle:@"ReferralDetails" forState:UIControlStateNormal];
    getReferralDetails.frame = CGRectMake(30, 560, 150, 25);
    [self.view addSubview:getReferralDetails];
    
    UIButton *confirmEmailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmEmailButton addTarget:self
                           action:@selector(testConfirmEmail:)
                 forControlEvents:UIControlEventTouchUpInside];
    confirmEmailButton.backgroundColor =[UIColor blackColor];
    [confirmEmailButton setTitle:@"ConfirmEmail" forState:UIControlStateNormal];
    confirmEmailButton.frame = CGRectMake(200, 560, 150, 25);
    [self.view addSubview:confirmEmailButton];
    
    UIButton *passwordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [passwordButton addTarget:self
                       action:@selector(testPassword:)
             forControlEvents:UIControlEventTouchUpInside];
    passwordButton.backgroundColor =[UIColor blackColor];
    [passwordButton setTitle:@"Password" forState:UIControlStateNormal];
    passwordButton.frame = CGRectMake(30, 590, 150, 25);
    [self.view addSubview:passwordButton];
    
    UIButton *deleteSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteSettingButton addTarget:self
                       action:@selector(testDeleteSetting:)
             forControlEvents:UIControlEventTouchUpInside];
    deleteSettingButton.backgroundColor =[UIColor blackColor];
    [deleteSettingButton setTitle:@"DeleteSetting" forState:UIControlStateNormal];
    deleteSettingButton.frame = CGRectMake(200, 590, 150, 25);
    [self.view addSubview:deleteSettingButton];
    
    UIButton *putSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [putSettingButton addTarget:self
                            action:@selector(testPutSetting:)
                  forControlEvents:UIControlEventTouchUpInside];
    putSettingButton.backgroundColor =[UIColor blackColor];
    [putSettingButton setTitle:@"PutSetting" forState:UIControlStateNormal];
    putSettingButton.frame = CGRectMake(30, 620, 150, 25);
    [self.view addSubview:putSettingButton];
    
    UIButton *uploadRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [uploadRequestButton addTarget:self
                         action:@selector(testUploadRequest:)
               forControlEvents:UIControlEventTouchUpInside];
    uploadRequestButton.backgroundColor =[UIColor blackColor];
    [uploadRequestButton setTitle:@"UploadAvatarRequest" forState:UIControlStateNormal];
    uploadRequestButton.frame = CGRectMake(200, 620, 150, 25);
    [self.view addSubview:uploadRequestButton];
    
    UIButton *deleteAvatarsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteAvatarsButton addTarget:self
                            action:@selector(testDeleteAvatar:)
                  forControlEvents:UIControlEventTouchUpInside];
    deleteAvatarsButton.backgroundColor =[UIColor blackColor];
    [deleteAvatarsButton setTitle:@"DeleteAvatars" forState:UIControlStateNormal];
    deleteAvatarsButton.frame = CGRectMake(30, 650, 150, 25);
    [self.view addSubview:deleteAvatarsButton];
    
    UIButton *addAvatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addAvatarButton addTarget:self
                            action:@selector(testAddAvatar:)
                  forControlEvents:UIControlEventTouchUpInside];
    addAvatarButton.backgroundColor =[UIColor blackColor];
    [addAvatarButton setTitle:@"AddAvatar" forState:UIControlStateNormal];
    addAvatarButton.frame = CGRectMake(200, 650, 150, 25);
    [self.view addSubview:addAvatarButton];
    
    UIButton *uploadDocumentRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [uploadDocumentRequestButton addTarget:self
                        action:@selector(testUploadDocument:)
              forControlEvents:UIControlEventTouchUpInside];
    uploadDocumentRequestButton.backgroundColor =[UIColor blackColor];
    [uploadDocumentRequestButton setTitle:@"UploadDocument" forState:UIControlStateNormal];
    uploadDocumentRequestButton.frame = CGRectMake(30, 680, 150, 25);
    [self.view addSubview:uploadDocumentRequestButton];
    
    UIButton *documentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [documentButton addTarget:self
                                    action:@selector(testGetDocument:)
                          forControlEvents:UIControlEventTouchUpInside];
    documentButton.backgroundColor =[UIColor blackColor];
    [documentButton setTitle:@"Document" forState:UIControlStateNormal];
    documentButton.frame = CGRectMake(200, 680, 150, 25);
    [self.view addSubview:documentButton];
    
    UIButton *addOrReplaceCountryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addOrReplaceCountryButton addTarget:self
                       action:@selector(testReplaceCountry:)
             forControlEvents:UIControlEventTouchUpInside];
    addOrReplaceCountryButton.backgroundColor =[UIColor blackColor];
    [addOrReplaceCountryButton setTitle:@"AddOrReplaceCountry" forState:UIControlStateNormal];
    addOrReplaceCountryButton.frame = CGRectMake(30, 710, 150, 25);
    [self.view addSubview:addOrReplaceCountryButton];
    
    UIButton *updateUserButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [updateUserButton addTarget:self
                                  action:@selector(testUpdateUser:)
                        forControlEvents:UIControlEventTouchUpInside];
    updateUserButton.backgroundColor =[UIColor blackColor];
    [updateUserButton setTitle:@"UpdateUser" forState:UIControlStateNormal];
    updateUserButton.frame = CGRectMake(200, 710, 150, 25);
    [self.view addSubview:updateUserButton];
    
    UIButton *downloadLinkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [downloadLinkButton addTarget:self
                         action:@selector(testDownloadLink:)
               forControlEvents:UIControlEventTouchUpInside];
    downloadLinkButton.backgroundColor =[UIColor blackColor];
    [downloadLinkButton setTitle:@"DownloadLink" forState:UIControlStateNormal];
    downloadLinkButton.frame = CGRectMake(30, 740, 150, 25);
    [self.view addSubview:downloadLinkButton];
    
    UIButton *getUploadingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [getUploadingButton addTarget:self
                         action:@selector(testUploading:)
               forControlEvents:UIControlEventTouchUpInside];
    getUploadingButton.backgroundColor =[UIColor blackColor];
    [getUploadingButton setTitle:@"Uploading" forState:UIControlStateNormal];
    getUploadingButton.frame = CGRectMake(200, 740, 150, 25);
    [self.view addSubview:getUploadingButton];

    UIButton *createVerificationRequestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [createVerificationRequestButton addTarget:self
                           action:@selector(testVerificationRequest:)
                 forControlEvents:UIControlEventTouchUpInside];
    createVerificationRequestButton.backgroundColor =[UIColor blackColor];
    [createVerificationRequestButton setTitle:@"VerificationRequest" forState:UIControlStateNormal];
    createVerificationRequestButton.frame = CGRectMake(30, 770, 150, 25);
    [self.view addSubview:createVerificationRequestButton];

    UIButton *verifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [verifyButton addTarget:self
                           action:@selector(testVerify:)
                 forControlEvents:UIControlEventTouchUpInside];
    verifyButton.backgroundColor =[UIColor blackColor];
    [verifyButton setTitle:@"Verify" forState:UIControlStateNormal];
    verifyButton.frame = CGRectMake(200, 770, 150, 25);
    [self.view addSubview:verifyButton];
}

- (void) testVerify:(UIButton*)sender {
    /*[_service getVerificationRequestInfoByUserUid:@"00000000-0000-0000-0000-000000000002" requestUid:@"333" verificationUid:@"444" successBlock:^(VerificationRequestInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];*/
    /*[_service getVerificationRequestInfoByUid:@"00000000-0000-0000-0000-000000000002" successBlock:^(VerificationRequestInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];*/
    [_service getLatestVerificationRequestInfoByUserId:@"00000000-0000-0000-0000-000000000002" kindString:@"kind" successBlock:^(VerificationRequestInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testVerificationRequest:(UIButton *)sender {
    VerificationRequestDTORequest *dto = [[VerificationRequestDTORequest alloc] init];
    [_service createVerificationRequest:dto successBlock:^(VerificationRequestInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testReferralInfoById:(UIButton*)sender{
    [_service getReferralInfoById:@"00000000-0000-0000-0000-000000000001"
                     successBlock:^(ReferralInfoDTOResponse *dto) {
                         
                     }
                     failureBlock:^(ResponseError *error) {
                         
                     }];
}

- (void) testUploading:(UIButton*)sender {
    [_service getUploadingInfoByUploadUid:@"8ff8776e-c7b9-45aa-9921-96d9bf5dea8b" successBlock:^(UploadingDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testDownloadLink:(UIButton*)sender {
    [_service downloadLinkByUploadUid:@"8ff8776e-c7b9-45aa-9921-96d9bf5dea8b" successBlock:^(DownloadLinkDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUpdateUser:(UIButton*)sender{
    UserDTORequest *dto = [[UserDTORequest alloc] init];
    dto.email = @"bob@mailinator.com";
    dto.nickname = @"bob";
    dto.firstName = @"firstname";
    dto.middleName = @"middlename";
    dto.lastName = @"lastname";
    dto.countryId = @"AFG";
    //[dto.documentsUrls addObject:@"http://test.com.ru/test_url"];
    //[dto.documentsUrls addObject:@"http://test.com.ru/test_url2"];
    [_service updateUserInfo:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUploadRequest:(UIButton*)sender{
    UploadRequestDTORequest *dto = [[UploadRequestDTORequest alloc] init];
    dto.mimeType = @"type";
    dto.fileSize = @"1024";
    dto.fileName = @"name.jpg";
    [_service createUploadAvatarRequest:dto successBlock:^(UploadRequestDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUploadDocument:(UIButton*)sender{
    UploadRequestDTORequest *dto = [[UploadRequestDTORequest alloc] init];
    dto.mimeType = @"type2";
    dto.fileSize = @"512";
    dto.fileName = @"document.jpg";
    [_service createUploadDocumentRequest:dto successBlock:^(UploadRequestDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testGetDocument:(UIButton*)sender{;
    [_service getDocumentByUploadUid:@"8ff8776e-c7b9-45aa-9921-96d9bf5dea8b"
                        successBlock:^(DocumentDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testDeleteAvatar:(UIButton*)sender{
    [_service deleteAvatarsOnSuccessBlock:^(DeleteAvatarsDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testAddAvatar:(UIButton*)sender{
    AddAvatarDTORequest *dto = [[AddAvatarDTORequest alloc] init];
    dto.fileUploadUid = @"7689e60f-ff07-42b0-a5de-62d138857501";
    dto.imageUrl = @"https://blockbitcdnstorage.blob.core.windows.net/avatars/00000000-0000-0000-0000-000000000002/b71ff685-bc32-46bb-8e24-30f5e8aa9851-fff.jpg";
    [_service addAvatar:dto successBlock:^{
    
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testDeleteSetting:(UIButton*)sender{
    SettingDTORequest *dto = [[SettingDTORequest alloc] init];
    dto.type = @"preset";
    dto.value = @"weight";
    [_service deleteUserSetting:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testPutSetting:(UIButton*)sender{
    SettingDTORequest *dto = [[SettingDTORequest alloc] init];
    dto.type = @"favorite-market";
    dto.value = @"weight";
    [_service addUserSetting:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testReferralDetails:(UIButton*)sender{
    [_service getReferralDetailsById:@"00000000-0000-0000-0000-000000000001" successBlock:^(ReferralDetailsDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testResetPassword:(UIButton*)sender{
    PasswordResetDTORequest *dto = [[PasswordResetDTORequest alloc] init];
    dto.email = @"bobssss@mailinator.com";
    [_service resetPassword:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testPassword:(UIButton*)sender{
    PasswordDTORequest *dto = [[PasswordDTORequest alloc] init];
    dto.account.password = @"Qweqwe_1";
    dto.account.email = @"bob@mailinator.com";
    [_service password:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testConfirmEmail:(UIButton*)sender{
    EmailConfirmationDTORequest *dto = [[EmailConfirmationDTORequest alloc] init];
    dto.email = @"test@mailinator.com";
    [_service confirmEmail:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testAssetsInfo:(UIButton*)sender{
    [_service getAssetsInfoOnSuccessBlock:^(AssetsInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testReferralInfo:(UIButton*)sender{
    [_service getReferralInfoOnSuccessBlock:^(ReferralInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUserSettings:(UIButton*)sender{
    [_service getUserSettingsOnSuccessBlock:^(SettingsDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUser2FA:(UIButton*)sender{
    [_service get2FAOnSuccessBlock:^(User2FADTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testAdd2FA:(UIButton*)sender{
    [_service add2FAOnSuccessBlock:^(User2FADTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testResendEmail:(UIButton*)sender{
    ResendConfirmationEmailDTORequest *dto = [[ResendConfirmationEmailDTORequest alloc] init];
    dto.email = @"bob@mailinator.com";
    [_service resendConfirmationEmail:dto successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUserOrders:(UIButton*)sender{
    [_service getUserOrdersOnSuccessBlock:^(UserOrdersDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testCountry:(UIButton*)sender{
    [_service getCountryById:@"da" successBlock:^(GetCountryDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testAddCountry:(UIButton*)sender{
    CountryDTORequest *dto = [[CountryDTORequest alloc] init];
    dto.countryId = @"da";
    dto.name = @"db";
    dto.kyc = @"dc";
    dto.code = @"dd";
    [_service addCountry:dto successBlock:^(AddCountryDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testReplaceCountry:(UIButton*)sender{
    CountryDTORequest *dto = [[CountryDTORequest alloc] init];
    dto.countryId = @"aa";
    dto.name = @"bb";
    dto.kyc = @"cc";
    dto.code = @"dd";
    [_service addOrReplaceCountry:dto successBlock:^(AddOrReplaceCountryDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUserCountries:(UIButton*)sender{
    [_service getAllCountriesWithSearch:@"" page:2 perPage:10 successBlock:^(AllCountriesDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testReferrals:(UIButton*)sender{
    [_service getReferralsWithSearch:@"" page:2 perPage:10 successBlock:^(ReferralsDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testAssets:(UIButton*)sender{
    [_service getAssetsOnSuccessBlock:^(AssetsDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testOrderHistory:(UIButton*)sender{
    [_service getOrderHistoryWithLimit:10 offset:0 successBlock:^(OrderHistoryDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testMakeOrder:(UIButton*)sender{
    NewOrderDTORequest *dto = [[NewOrderDTORequest alloc] init];
    /*"instrument": "string",
    "type": "string",
    "amount": 0,
    "price": 0,
    "activationPrice": 0,
    "isLimit": true,
    "isStop": true */
    dto.instrument = @"ltc_btc";
    dto.type = @"buy";
    dto.amount = 2;
    dto.price = 2;
    dto.activationPrice = 2.1;
    dto.isLimit = @"true";
    dto.isStop = @"true";
    [_service makeOrder:dto successBlock:^(MakeOrderDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testDeleteAllOrders:(UIButton*)sender{
    [_service deleteAllOrdersOnSuccessBlock:^(DeletedOrdersDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testDeleteOrder:(UIButton*)sender{
    [_service deleteOrderById:@"-144115188075855870" successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testDeleteCountry:(UIButton*)sender{
    [_service deleteCountryById:@"dd" successBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testUser:(UIButton*)sender{
    [_service getUserInfoOnSuccessBlock:^(UserInfoDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testLoginCorrect:(UIButton*)sender{
    pressedButton.text = sender.titleLabel.text;
    LoginDTORequest *dto = [[LoginDTORequest alloc] init];
    dto.email = @"bob@mailinator.com";
    dto.password = @"Qweqwe_1";
    [_service login:dto successBlock:^(LoginDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testLogout:(UIButton*)sender{
    pressedButton.text = sender.titleLabel.text;
    NSLog(@"fff");
    [_service logoutOnSuccessBlock:^{
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}

- (void) testLoginInCorrect:(UIButton*)sender{
    pressedButton.text = sender.titleLabel.text;
    LoginDTORequest *dto = [[LoginDTORequest alloc] init];
    dto.email = @"bob222@mailinator.com";
    dto.password = @"Qweqwe_1";
    [_service login:dto successBlock:^(LoginDTOResponse *dto) {
        
    } failureBlock:^(ResponseError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
