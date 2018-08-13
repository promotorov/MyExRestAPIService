#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface LoginDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *email;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *provider;
@property (nonatomic) NSString *verificationCode;

@end

