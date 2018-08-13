#import "PasswordDTORequest.h"

@implementation PasswordDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.resetPasswordtoken = @"";
        self.account = [[PasswordAccountInfo alloc] init];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSDictionary *dictionary = [self.account toDictionary];
    return @{
             @"account":dictionary,
             @"resetPasswordToken":self.resetPasswordtoken
             };
}

@end


@implementation PasswordAccountInfo

-(instancetype) init {
    if (self = [super init]) {
        self.password = @"";
        self.email = @"";
    }
    return self;
}

- (NSDictionary*) toDictionary {
    return @{
             @"password":self.password,
             @"email":self.email
             };
}

@end
