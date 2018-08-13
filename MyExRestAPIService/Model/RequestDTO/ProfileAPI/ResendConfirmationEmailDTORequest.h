#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface ResendConfirmationEmailDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *email;

@end
