#import "AddOrReplaceCountryDTOResponse.h"

@implementation AddOrReplaceCountryDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init])
        self.data = (NSString*) [dictionary objectForKey:@"data"];
    return self;
}

@end

