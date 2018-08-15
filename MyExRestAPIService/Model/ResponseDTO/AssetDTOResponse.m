#import "AssetDTOResponse.h"

@implementation AssetDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.asset = (NSString*) dictionary[@"asset"];
        self.balance = (NSString*) dictionary[@"balance"];
    }
    return self;
}

@end
