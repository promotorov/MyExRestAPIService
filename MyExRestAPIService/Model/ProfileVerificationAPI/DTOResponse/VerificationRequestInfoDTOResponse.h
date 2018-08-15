#import <Foundation/Foundation.h>
#import "DTOResponse.h"
#import "Document.h"

@interface VerificationRequestInfoDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray *documents;
@property (nonatomic) NSDictionary *fields;
@property (nonatomic) NSString *uid;
@property (nonatomic) NSString *kind;
@property (nonatomic) NSString *status;

@end