#import "Filters.h"

@implementation Filters

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.search = (NSString*) [dictionary objectForKey:@"search"];
    }
    return self;
}

@end
