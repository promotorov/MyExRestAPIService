#import "AllKeysDTOResponse.h"

@implementation AllKeysDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.keys = [[NSMutableArray<KeyDTOResponse*> alloc] initWithCapacity:[dictionary count]];
        for (NSDictionary *subdict in dictionary){
            [self.keys addObject:[[KeyDTOResponse alloc] initFromDictionary:subdict]];
        }
    }
    return self;
}

@end
