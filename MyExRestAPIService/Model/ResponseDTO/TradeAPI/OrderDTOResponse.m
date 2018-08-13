#import "OrderDTOResponse.h"

@implementation OrderDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.orderId = (NSString*) [dictionary objectForKey:@"orderId"];
        self.total = (NSString*) [dictionary objectForKey:@"total"];
        self.orderType = (NSString*) [dictionary objectForKey:@"orderType"];
        self.commission = (NSString*) [dictionary objectForKey:@"commission"];
        self.createdAt = (NSString*) [dictionary objectForKey:@"createdAt"];
        self.unitsFilled = (NSString*) [dictionary objectForKey:@"unitsFilled"];
        self.isPending = (NSString*) [dictionary objectForKey:@"isPending"];
        self.status = (NSString*) [dictionary objectForKey:@"status"];
        self.type = (NSString*) [dictionary objectForKey:@"type"];
        self.amount = (NSString*) [dictionary objectForKey:@"amount"];
        self.price = (NSString*) [dictionary objectForKey:@"price"];
        self.isLimit = (NSString*) [dictionary objectForKey:@"isLimit"];
        self.instrument = (NSString*) [dictionary objectForKey:@"instrument"];
    }
    return self;
}

@end
