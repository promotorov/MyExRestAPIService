#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface EmailConfirmationDTORequest : NSObject<DTORequest>

@property(nonatomic) NSString *token;
@property(nonatomic) NSString *email;

@end
