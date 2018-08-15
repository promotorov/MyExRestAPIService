#import "Country.h"

@implementation Country

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.countryId = (NSString*) dictionary[@"id"];
        self.kyc = (NSString*) dictionary[@"kyc"];
        self.name = (NSString*) dictionary[@"name"];
        self.code = (NSString*) dictionary[@"code"];
    }
    return self;
}

@end
