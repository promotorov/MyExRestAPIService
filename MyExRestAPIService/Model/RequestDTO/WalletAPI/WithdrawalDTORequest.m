#import "WithdrawalDTORequest.h"

@implementation WithdrawalDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.assetId = @"";
        self.amount = @"";
        self.code = @"";
        self.transferId = @"";
        self.address = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{
                                 @"assetId":self.assetId,
                                 @"amount":self.amount,
                                 @"code":self.code,
                                 @"transferId":self.transferId,
                                 @"address":self.address
                                 };
    //@"provider":self.provider,
    //@"verificationCode":self.verificationCode};
    return dictionary;
}

@end
