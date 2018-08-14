#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface AddAvatarDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *fileUploadUid;
@property (nonatomic) NSString *imageUrl;

@end
