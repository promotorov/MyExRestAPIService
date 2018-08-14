#import "NewOrderDTORequest.h"

@implementation OrderDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.instrument = @"";
        self.type = @"";
        self.amount = 0;
        self.price = 0;
        self.activationPrice = 0;
        self.isLimit = @"";
        self.isStop = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{@"instrument":self.instrument,
                                 @"type":self.type,
                                 @"amount":@(self.amount),
                                 @"price":@(self.price),
                                 @"activationPrice":@(self.activationPrice),
                                 @"isLimit":self.isLimit,
                                 @"isStop":self.isStop };
    return dictionary;
}

@end


@implementation NewOrderDTORequest

- (instancetype) init {
    if (self = [super init]) {
        self.order = [[OrderDTORequest alloc] init];
    }
    return self;
}

- (instancetype) initWithOrder:(OrderDTORequest *)order {
    if (self = [super init]) {
        self.order = order;
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{@"order":[self.order toDictionary]};
    return dictionary;
}

@end
