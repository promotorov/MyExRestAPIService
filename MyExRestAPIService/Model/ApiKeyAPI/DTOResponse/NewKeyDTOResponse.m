#import "NewKeyDTOResponse.h"

@implementation NewKeyDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.key = [[KeyDTOResponse alloc] initFromDictionary:dictionary];
    }
    return self;
}

@end
