#import "AssetsDTOResponse.h"

@implementation AssetsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.assets = [[NSMutableArray<AssetDTOResponse*> alloc] initWithCapacity:[dictionary count]];
        for (NSDictionary *subdict in dictionary)
            [self.assets addObject:[[AssetDTOResponse alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end

