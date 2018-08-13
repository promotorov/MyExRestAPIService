#import "DeleteSettingDTORequest.h"

@implementation DeleteSettingDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.type = @"";
        self.value = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{
                                 @"type":self.type,
                                 @"value":self.value
                                 };
    return dictionary;
}

@end

