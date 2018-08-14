#import "EmailConfirmationDTORequest.h"

@implementation EmailConfirmationDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.token = @"";
        self.email = @"";
    }
    return self;
}

- (NSDictionary*) toDictionary {
    return @{
             @"token":self.token,
             @"email":self.email
             };
}

@end
