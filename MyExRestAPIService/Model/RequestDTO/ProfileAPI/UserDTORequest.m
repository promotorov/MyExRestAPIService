#import "UserDTORequest.h"

@implementation UserDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.email = @"";
        self.firstName = @"";
        self.lastName = @"";
        self.middleName = @"";
        self.imageUrl = @"";
        self.countryId = @"";
        self.nickname = @"";
        self.documentsUrls = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    return @{
             @"firstName":self.firstName,
             @"email":self.email,
             @"lastName":self.lastName,
             @"middleName":self.middleName,
             @"imageUrl":self.imageUrl,
             @"countryId":self.countryId,
             @"nickname":self.nickname,
             @"documentsUrls":self.documentsUrls
             };
}

@end
