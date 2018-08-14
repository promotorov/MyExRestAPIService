#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface UploadRequestDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *uid;
@property (nonatomic) NSString *expiresAt;
@property (nonatomic) NSString *mimeType;
@property (nonatomic) NSString *updatedAt;
@property (nonatomic) NSString *cloudStorageKind;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *linkUrl;
@property (nonatomic) NSString *uploadUrl;

@end

