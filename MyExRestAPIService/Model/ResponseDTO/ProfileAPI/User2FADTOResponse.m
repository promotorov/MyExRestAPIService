#import "User2FADTOResponse.h"

@implementation User2FADTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.secret = (NSString*) dictionary[@"secret"];
        self.otpUrl = (NSString*) dictionary[@"otpUrl"];
        self.provider = (NSString*) dictionary[@"provider"];
        self.enabled = (NSString*) dictionary[@"enabled"];
    }
    return self;
}

@end
