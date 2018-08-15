#import <ARKit/ARKit.h>
#import "VerificationRequestInfoDTOResponse.h"

@implementation VerificationRequestInfoDTOResponse

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        dictionary = dictionary[@"data"];
        self.fields = dictionary[@"fields"];
        self.uid = dictionary[@"uid"];
        self.kind = dictionary[@"kind"];
        self.status = dictionary[@"status"];
        NSArray *documents = dictionary[@"documents"];
        self.documents = [[NSMutableArray alloc] initWithCapacity:[dictionary count]];
        for (NSDictionary *documentDictionary in documents)
            [self.documents addObject:[[Document alloc] initFromDictionary:documentDictionary]];
    }
    return self;
}

@end