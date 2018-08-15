#import "OrderDTOResponse.h"

@implementation OrderDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.orderId = (NSString*) dictionary[@"orderId"];
        self.total = (NSString*) dictionary[@"total"];
        self.orderType = (NSString*) dictionary[@"orderType"];
        self.commission = (NSString*) dictionary[@"commission"];
        self.createdAt = (NSString*) dictionary[@"createdAt"];
        self.unitsFilled = (NSString*) dictionary[@"unitsFilled"];
        self.isPending = (NSString*) dictionary[@"isPending"];
        self.status = (NSString*) dictionary[@"status"];
        self.type = (NSString*) dictionary[@"type"];
        self.amount = (NSString*) dictionary[@"amount"];
        self.price = (NSString*) dictionary[@"price"];
        self.isLimit = (NSString*) dictionary[@"isLimit"];
        self.instrument = (NSString*) dictionary[@"instrument"];
    }
    return self;
}

@end
