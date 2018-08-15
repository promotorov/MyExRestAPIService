#import "VerificationRequestDTORequest.h"

@implementation VerificationRequestDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.kind = @"";
        self.documents = [NSMutableArray new];
        self.extraFields = [NSDictionary new];
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{
            @"documents":self.documents,
            @"extraFields":self.extraFields,
            @"kind":self.kind
    };
    return dictionary;
}

@end
