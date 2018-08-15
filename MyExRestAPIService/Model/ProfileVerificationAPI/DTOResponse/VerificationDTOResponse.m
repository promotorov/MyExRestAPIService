#import <ARKit/ARKit.h>
#import "VerificationDTOResponse.h"

@implementation VerificationDTOResponse

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        dictionary = dictionary[@"data"];
        self.verificationLevel = dictionary[@"verificationLevel"];
        self.verificationClaims = [[NSMutableArray alloc] initWithArray:dictionary[@"verificationClaims"]];
    }
    return self;
}

@end