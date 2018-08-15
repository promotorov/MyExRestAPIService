#import "LoginDTOResponse.h"

@implementation Account

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliateId = (NSString*) dictionary[@"affiliateId"];
        self.email = (NSString*) dictionary[@"email"];
        self.nickname = (NSString*) dictionary[@"nickname"];
        self.userId = (NSString*) dictionary[@"id"];
    }
    return self;
}

@end


@implementation LoginDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.account = [[Account alloc] initFromDictionary:dictionary[@"account"]];
        self.message = (NSString*) dictionary[@"message"];
        self.provider = (NSString*) dictionary[@"provider"];
        self.secondFactorRequired = (NSString*) dictionary[@"secondFactorRequired"];
    }
    return self;
}

@end
