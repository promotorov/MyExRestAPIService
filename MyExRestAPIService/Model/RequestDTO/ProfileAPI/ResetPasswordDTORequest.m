#import "ResetPasswordDTORequest.h"

@implementation ResetPasswordDTORequest

-(instancetype) init {
    if (self = [super init]) self.email = @"";
    return self;
}

-(NSDictionary *) toDictionary {
    return @{@"email":self.email};
}

@end
