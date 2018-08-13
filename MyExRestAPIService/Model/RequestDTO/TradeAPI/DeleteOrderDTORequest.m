#import "DeleteOrderDTORequest.h"

@implementation DeleteOrderDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.orderId = 0;
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{@"orderId":@(self.orderId)};
    return dictionary;
}

@end
