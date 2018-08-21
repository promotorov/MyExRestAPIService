#import "DocumentsDTOResponse.h"

@implementation DocumentsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
        self.data = [[NSMutableArray<NSString*> alloc] initWithArray:dictionary[@"data"]];
    return self;
}

@end
