#import "LoginDTOResponse.h"

@implementation Account

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.affiliateId = (NSString*) [dictionary objectForKey:@"affiliateId"];
        self.email = (NSString*) [dictionary objectForKey:@"email"];
        self.nickname = (NSString*) [dictionary objectForKey:@"nickname"];
        self.userId = (NSString*) [dictionary objectForKey:@"id"];
    }
    return self;
}

@end


@implementation LoginDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.account = [[Account alloc] initFromDictionary:[dictionary objectForKey:@"account"]];
        self.message = (NSString*) [dictionary objectForKey:@"message"];
        self.provider = (NSString*) [dictionary objectForKey:@"provider"];
        self.secondFactorRequired = (NSString*) [dictionary objectForKey:@"secondFactorRequired"];
    }
    return self;
}

@end
