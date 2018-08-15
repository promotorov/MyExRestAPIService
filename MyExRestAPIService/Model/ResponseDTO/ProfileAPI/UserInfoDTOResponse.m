#import "UserInfoDTOResponse.h"

@implementation UserInfoDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        dictionary = dictionary[@"data"];
        self.country = [[Country alloc] initFromDictionary:dictionary[@"country"]];
        self.avatar_url = (NSString*) dictionary[@"avatar_url"];
        self.userId = (NSString*) dictionary[@"id"];
        self.email = (NSString*) dictionary[@"email"];
        self.role = (NSString*) dictionary[@"role"];
        self.is_active = (NSString*) dictionary[@"is_active"];
        self.is_verified = (NSString*) dictionary[@"is_verified"];
        self.nickname = (NSString*) dictionary[@"nickname"];
        self.first_name = (NSString*) dictionary[@"first_name"];
        self.last_name = (NSString*) dictionary[@"last_name"];
        self.middle_name = (NSString*) dictionary[@"middle_name"];
        self.date_created = (NSString*) dictionary[@"date_created"];
        self.last_login = (NSString*) dictionary[@"last_login"];
        self.affiliate_id = (NSString*) dictionary[@"affiliate_id"];
        self.referral_id = (NSString*) dictionary[@"referral_id"];
        NSDictionary *assetsDictionary = dictionary[@"assets"];
        self.assets = [[NSMutableArray alloc] initWithCapacity:[assetsDictionary count]];
        for (NSDictionary *subdict in assetsDictionary)
            [self.assets addObject:[[AssetDTOResponse alloc] initFromDictionary:subdict]];
    }
    return self;
}

@end
