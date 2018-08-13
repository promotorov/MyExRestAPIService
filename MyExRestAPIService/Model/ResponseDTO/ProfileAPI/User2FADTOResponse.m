#import "User2FADTOResponse.h"

@implementation User2FADTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.secret = (NSString*) [dictionary objectForKey:@"secret"];
        self.otpUrl = (NSString*) [dictionary objectForKey:@"otpUrl"];
        self.provider = (NSString*) [dictionary objectForKey:@"provider"];
        self.enabled = (NSString*) [dictionary objectForKey:@"enabled"];
    }
    return self;
}

@end
