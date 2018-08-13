#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface ConfirmEmailDTORequest : NSObject<DTORequest>

@property(nonatomic) NSString *token;
@property(nonatomic) NSString *email;

@end
