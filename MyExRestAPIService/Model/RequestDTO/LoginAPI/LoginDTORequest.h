#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface LoginDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *email;
@property (nonatomic) NSString *password;

@end

