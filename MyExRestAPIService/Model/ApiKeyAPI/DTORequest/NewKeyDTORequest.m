#import "NewKeyDTORequest.h"

@implementation NewKeyDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.isInfo = @"";
        self.isTrade = @"";
        self.isWithdraw = @"";
        self.name = @"";
        self.ipWhiteList = [[NSMutableArray<NSString*> alloc] initWithCapacity:0];
    }
    return self;
}

-(NSDictionary *) toDictionary {
    return @{
             @"isInfo":self.isInfo,
             @"name":self.name,
             @"isTrade":self.isTrade,
             @"isWithdraw":self.isWithdraw,
             @"ipWhiteList":self.ipWhiteList
             };
}

@end
