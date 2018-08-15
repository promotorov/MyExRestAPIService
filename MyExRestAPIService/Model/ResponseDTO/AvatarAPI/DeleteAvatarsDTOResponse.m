#import "DeleteAvatarsDTOResponse.h"

@implementation DeleteAvatarsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
        self.data = (NSString*) dictionary[@"data"];
    return self;
}

@end
