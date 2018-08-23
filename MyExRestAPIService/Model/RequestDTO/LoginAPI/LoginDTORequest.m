#import "LoginDTORequest.h"

@implementation LoginDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.email = @"";
        self.password = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    return @{
             @"email":self.email,
             @"password":self.password
             };
}

@end
