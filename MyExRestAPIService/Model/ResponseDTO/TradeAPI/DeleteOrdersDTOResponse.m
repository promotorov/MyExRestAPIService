#import "DeleteOrdersDTOResponse.h"

@implementation DeletedOrdersDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init])
        self.data = (NSString*) [dictionary objectForKey:@"data"];
    return self;
}

@end
