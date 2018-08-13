#import "LoginDTORequest.h"

@implementation LoginDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.email = @"";
        self.password = @"";
        self.verificationCode = @"";
        self.provider = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{@"email":self.email,
                                 @"password":self.password};
                                 //@"provider":self.provider,
                                 //@"verificationCode":self.verificationCode};
    return dictionary;
}

@end
