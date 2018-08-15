#import "Paging.h"

@implementation Paging

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.page = (NSString*) dictionary[@"page"];
        self.per_page = (NSString*) dictionary[@"per_page"];
        self.total = (NSString*) dictionary[@"total"];
    }
    return self;
}

@end
