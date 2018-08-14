#import "AddAvatarDTORequest.h"

@implementation AddAvatarDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.fileUploadUid = @"";
        self.imageUrl = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{
                                 @"fileUploadUid":self.fileUploadUid,
                                 @"imageUrl":self.imageUrl
                                 };
    return dictionary;
}

@end

