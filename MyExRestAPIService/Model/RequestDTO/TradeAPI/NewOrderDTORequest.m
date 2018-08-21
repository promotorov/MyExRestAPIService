#import "NewOrderDTORequest.h"

@implementation NewOrderDTORequest

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
    NSDictionary *dictionary = @{
                                 @"instrument":self.instrument,
                                 @"type":self.type,
                                 @"amount":@(self.amount),
                                 @"price":@(self.price),
                                 @"activationPrice":@(self.activationPrice),
                                 @"isLimit":self.isLimit,
                                 @"isStop":self.isStop
                                 };
    return @{
             @"order":dictionary
             };
}

@end
