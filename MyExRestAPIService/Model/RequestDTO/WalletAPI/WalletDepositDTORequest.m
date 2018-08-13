#import "WalletDepositDTORequest.h"

@implementation WalletDepositDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.assetId = @"";
        self.amount = @"";
        self.fiatPaymentMethod = @"";
        self.paymentSystem = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{@"assetId":self.assetId,
                                 @"paymentSystem":self.paymentSystem,
                                 @"fiatPaymentMethod":self.fiatPaymentMethod,
                                 @"amount":self.amount};
    return dictionary;
}

@end

