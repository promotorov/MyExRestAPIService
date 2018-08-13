#import "ResponseError.h"

@implementation ResponseError

-(instancetype) initWithMessage:(NSString*)message
                 withStatusCode:(NSString *)statusCode
                withMessageCode:(NSString *)messageCode
{
    if (self = [super init]) {
        self.message = message;
        self.statusCode = statusCode;
        self.messageCode = messageCode;
    }
    return self;
}

@end
