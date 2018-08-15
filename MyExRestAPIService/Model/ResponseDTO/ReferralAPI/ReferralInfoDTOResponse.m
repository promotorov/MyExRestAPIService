#import "ReferralInfoDTOResponse.h"

@implementation ReferralInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliate_id = (NSString*) dictionary[@"affiliate_id"];
        self.affiliates_count = (NSString*) dictionary[@"affiliates_count"];
        self.user_name = (NSString*) dictionary[@"user_name"];
    }
    return self;
}

@end
