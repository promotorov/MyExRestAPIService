#import "Country.h"

@implementation Country

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.countryId = (NSString*) [dictionary objectForKey:@"id"];
        self.kyc = (NSString*) [dictionary objectForKey:@"kyc"];
        self.name = (NSString*) [dictionary objectForKey:@"name"];
        self.code = (NSString*) [dictionary objectForKey:@"code"];
    }
    return self;
}

@end
