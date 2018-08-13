#import "AssetDTOResponse.h"

@implementation AssetDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.asset = (NSString*) [dictionary objectForKey:@"asset"];
        self.balance = (NSString*) [dictionary objectForKey:@"balance"];
    }
    return self;
}

@end
