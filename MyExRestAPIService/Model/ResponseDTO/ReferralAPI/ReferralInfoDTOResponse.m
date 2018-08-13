#import "ReferralInfoDTOResponse.h"

@implementation ReferralInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliate_id = (NSString*) [dictionary objectForKey:@"affiliate_id"];
        self.affiliates_count = (NSString*) [dictionary objectForKey:@"affiliates_count"];
        self.user_name = (NSString*) [dictionary objectForKey:@"user_name"];
    }
    return self;
}

@end
