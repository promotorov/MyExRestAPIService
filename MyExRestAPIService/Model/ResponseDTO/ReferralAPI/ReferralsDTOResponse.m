#import "ReferralsDTOResponse.h"

@implementation Referral

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliate_id = (NSString*) dictionary[@"affiliate_id"];
        self.email = (NSString*) dictionary[@"email"];
        self.user_name = (NSString*) dictionary[@"user_name"];
        self.user_id = (NSString*) dictionary[@"user_id"];
        self.registration_date = (NSString*) dictionary[@"registration_date"];
    }
    return self;
}

@end


@implementation ReferralsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.paging = [[Paging alloc] initFromDictionary:dictionary[@"paging"]];
        NSDictionary *referrals = dictionary[@"data"];
        self.referrals = [[NSMutableArray alloc] initWithCapacity:[referrals count]];
        self.filters = [[Filters alloc] initFromDictionary:dictionary[@"filters"]];
        for (NSDictionary *subdict in referrals)
            [self.referrals addObject:[[Referral alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end
