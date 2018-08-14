#import "UploadRequestDTORequest.h"

@implementation UploadRequestDTORequest

-(instancetype) init {
    if (self = [super init]) {
        self.fileName = @"";
        self.fileSize = @"";
        self.mimeType = @"";
    }
    return self;
}

-(NSDictionary *) toDictionary {
    NSDictionary *dictionary = @{
                                 @"fileName":self.fileName,
                                 @"fileSize":self.fileSize,
                                 @"mimeType":self.mimeType
                                 };
    return dictionary;
}

@end
