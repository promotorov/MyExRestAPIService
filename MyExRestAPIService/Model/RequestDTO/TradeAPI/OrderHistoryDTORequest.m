#import "OrderHistoryDTORequest.h"

@implementation OrderHistoryDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.limit = 1000000000;
        self.offset = 0;
    }
    return self;
}

@end

