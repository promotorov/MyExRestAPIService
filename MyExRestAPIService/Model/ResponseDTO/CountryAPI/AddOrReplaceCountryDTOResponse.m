#import "AddOrReplaceCountryDTOResponse.h"

@implementation AddOrReplaceCountryDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init])
        self.data = (NSString*) dictionary[@"data"];
    return self;
}

@end

