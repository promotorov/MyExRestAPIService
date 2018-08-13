#import "UserInfoDTOResponse.h"

@implementation UserInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        dictionary = [dictionary objectForKey:@"data"];
        self.avatar_url = (NSString*) [dictionary objectForKey:@"avatar_url"];
        self.userId = (NSString*) [dictionary objectForKey:@"id"];
        self.email = (NSString*) [dictionary objectForKey:@"email"];
        self.role = (NSString*) [dictionary objectForKey:@"role"];
        self.is_active = (NSString*) [dictionary objectForKey:@"is_active"];
        self.is_verified = (NSString*) [dictionary objectForKey:@"is_verified"];
        self.nickname = (NSString*) [dictionary objectForKey:@"nickname"];
        self.first_name = (NSString*) [dictionary objectForKey:@"first_name"];
        self.last_name = (NSString*) [dictionary objectForKey:@"last_name"];
        self.middle_name = (NSString*) [dictionary objectForKey:@"middle_name"];
        self.date_created = (NSString*) [dictionary objectForKey:@"date_created"];
        self.last_login = (NSString*) [dictionary objectForKey:@"last_login"];
        self.affiliate_id = (NSString*) [dictionary objectForKey:@"affiliate_id"];
        self.referral_id = (NSString*) [dictionary objectForKey:@"referral_id"];
        NSDictionary *assetsDictionary = [dictionary objectForKey:@"assets"];
        self.assets = [[NSMutableArray alloc] initWithCapacity:[assetsDictionary count]];
        for (NSDictionary *subdict in assetsDictionary)
            [self.assets addObject:[[AssetDTOResponse alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end
