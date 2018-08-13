#import "Paging.h"

@implementation Paging

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.page = (NSString*) [dictionary objectForKey:@"page"];
        self.per_page = (NSString*) [dictionary objectForKey:@"per_page"];
        self.total = (NSString*) [dictionary objectForKey:@"total"];
    }
    return self;
}

@end
