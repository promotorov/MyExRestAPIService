#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface DownloadLinkDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *uid;
@property (nonatomic) NSString *expiresAt;
@property (nonatomic) NSString *mimeType;
@property (nonatomic) NSString *cloudStorageKind;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *linkUrl;

@end
