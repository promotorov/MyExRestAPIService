#import "UploadingDTOResponse.h"

@implementation UploadingDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        dictionary = dictionary[@"data"];
        self.uid = (NSString*) dictionary[@"uid"];
        self.expiresAt = (NSString*) dictionary[@"expiresAt"];
        self.cloudStorageKind = (NSString*) dictionary[@"cloudStorageKind"];
        self.uploadUrl = (NSString*) dictionary[@"uploadUrl"];
        self.linkUrl = (NSString*) dictionary[@"linkUrl"];
        self.updatedAt = (NSString*) dictionary[@"updatedAt"];
        self.mimeType = (NSString*) dictionary[@"mimeType"];
        self.status = (NSString*) dictionary[@"status"];
    }
    return self;
}

@end
