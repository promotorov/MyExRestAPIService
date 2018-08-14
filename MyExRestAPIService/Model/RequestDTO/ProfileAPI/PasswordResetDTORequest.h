#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface PasswordResetDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *email;

@end
