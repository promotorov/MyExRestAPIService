#import "WalletDepositDTOResponse.h"

@implementation WalletDepositDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
        self.address = dictionary[@"address"];
    return self;
}

@end
