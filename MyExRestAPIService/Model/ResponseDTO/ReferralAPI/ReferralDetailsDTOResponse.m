#import "ReferralDetailsDTOResponse.h"

@implementation ReferralDetailsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliate_id = (NSString*) [dictionary objectForKey:@"affiliate_id"];
        self.user_name = (NSString*) [dictionary objectForKey:@"user_name"];
    }
    return self;
}

@end
