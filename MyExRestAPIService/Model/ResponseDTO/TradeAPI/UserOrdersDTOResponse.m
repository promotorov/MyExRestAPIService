#import "UserOrdersDTOResponse.h"

@implementation UserOrdersDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.orders = [[NSMutableArray<OrderDTOResponse*> alloc] initWithCapacity:[dictionary count]];
        for (NSDictionary *subdict in dictionary)
            [self.orders addObject:[[OrderDTOResponse alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end

