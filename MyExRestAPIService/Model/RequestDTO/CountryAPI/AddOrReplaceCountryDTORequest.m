#import "AddOrReplaceCountryDTORequest.h"

@implementation AddOrReplaceCountryDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.countryId = @"";
        self.name = @"";
        self.kyc = @"";
        self.code = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{@"id":self.countryId,
                                 @"name":self.name,
                                 @"kyc":self.kyc,
                                 @"code":self.code};
    return dictionary;
}

@end
