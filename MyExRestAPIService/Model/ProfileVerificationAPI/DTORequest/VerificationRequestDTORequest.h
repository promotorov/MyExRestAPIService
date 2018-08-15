#import <Foundation/Foundation.h>
#import "Document.h"
#import "DTORequest.h"

@interface VerificationRequestDTORequest : NSObject<DTORequest>

@property (nonatomic) NSMutableArray *documents;
@property (nonatomic) NSDictionary *extraFields;
@property (nonatomic) NSString *kind;

@end