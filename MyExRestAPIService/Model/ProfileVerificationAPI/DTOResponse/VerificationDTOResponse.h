#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface VerificationDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *verificationLevel;
@property (nonatomic) NSMutableArray *verificationClaims;

@end