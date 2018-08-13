#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface ResetPasswordDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *email;

@end
