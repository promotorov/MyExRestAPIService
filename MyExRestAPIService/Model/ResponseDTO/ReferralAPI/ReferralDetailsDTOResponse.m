#import "ReferralDetailsDTOResponse.h"

@implementation ReferralDetailsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliate_id = (NSString*) dictionary[@"affiliate_id"];
        self.user_name = (NSString*) dictionary[@"user_name"];
    }
    return self;
}

@end
