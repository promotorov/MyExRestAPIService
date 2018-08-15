#import <Foundation/Foundation.h>
#import "DTOResponse.h"
#import "DTORequest.h"

@interface Document : NSObject<DTOResponse, DTORequest>

@property (nonatomic) NSString *fileUploadUid;
@property (nonatomic) NSString *documentType;
@property (nonatomic) NSString *pageIndex;

@end