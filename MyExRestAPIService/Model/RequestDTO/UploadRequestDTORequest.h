#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface UploadRequestDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *mimeType;
@property (nonatomic) NSString *fileName;
@property (nonatomic) NSString *fileSize;

@end

