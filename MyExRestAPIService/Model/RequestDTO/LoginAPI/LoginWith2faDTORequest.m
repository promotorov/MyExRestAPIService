#import "LoginWith2faDTORequest.h"

@implementation LoginWith2faDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.provider = @"";
        self.verificationCode = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    return @{
             @"provider":self.provider,
             @"verificationCode":self.verificationCode
             };
}

@end
