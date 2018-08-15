#import "MakeOrderDTOResponse.h"

@implementation MakeOrderDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) self.order = [[OrderDTOResponse alloc] initFromDictionary:dictionary[@"order"]];
    return self;
}

@end
