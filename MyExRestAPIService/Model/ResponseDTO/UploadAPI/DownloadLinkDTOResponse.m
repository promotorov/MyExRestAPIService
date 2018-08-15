#import "DownloadLinkDTOResponse.h"

@implementation DownloadLinkDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        dictionary = dictionary[@"data"];
        self.uid = (NSString*) dictionary[@"uid"];
        self.expiresAt = (NSString*) dictionary[@"expiresAt"];
        self.cloudStorageKind = (NSString*) dictionary[@"cloudStorageKind"];
        self.linkUrl = (NSString*) dictionary[@"linkUrl"];
        self.mimeType = (NSString*) dictionary[@"mimeType"];
        self.status = (NSString*) dictionary[@"status"];
    }
    return self;
}

@end
