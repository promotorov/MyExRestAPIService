#import "GetCountryDTOResponse.h"

@implementation GetCountryDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init])
        self.country = [[Country alloc] initFromDictionary:[dictionary objectForKey:@"data"]];
    return self;
}

@end
