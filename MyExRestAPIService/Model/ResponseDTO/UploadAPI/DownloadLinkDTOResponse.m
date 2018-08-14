#import "DownloadLinkDTOResponse.h"

@implementation DownloadLinkDTOResponse

-(instancetype) initFromDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        dictionary = [dictionary objectForKey:@"data"];
        self.uid = (NSString*) [dictionary objectForKey:@"uid"];
        self.expiresAt = (NSString*) [dictionary objectForKey:@"expiresAt"];
        self.cloudStorageKind = (NSString*) [dictionary objectForKey:@"cloudStorageKind"];
        self.linkUrl = (NSString*) [dictionary objectForKey:@"linkUrl"];
        self.mimeType = (NSString*) [dictionary objectForKey:@"mimeType"];
        self.status = (NSString*) [dictionary objectForKey:@"status"];
    }
    return self;
}

@end
