#import "ReferralsDTOResponse.h"

@implementation Referral

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliate_id = (NSString*) [dictionary objectForKey:@"affiliate_id"];
        self.email = (NSString*) [dictionary objectForKey:@"email"];
        self.user_name = (NSString*) [dictionary objectForKey:@"user_name"];
        self.user_id = (NSString*) [dictionary objectForKey:@"user_id"];
        self.registration_date = (NSString*) [dictionary objectForKey:@"registration_date"];
    }
    return self;
}

@end


@implementation ReferralsDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.paging = [[Paging alloc] initFromDictionary:[dictionary objectForKey:@"paging"]];
        NSDictionary *referrals = [dictionary objectForKey:@"data"];
        self.referrals = [[NSMutableArray alloc] initWithCapacity:[referrals count]];
        self.filters = [[Filters alloc] initFromDictionary:[dictionary objectForKey:@"filters"]];
        for (NSDictionary *subdict in referrals)
            [self.referrals addObject:[[Referral alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end
