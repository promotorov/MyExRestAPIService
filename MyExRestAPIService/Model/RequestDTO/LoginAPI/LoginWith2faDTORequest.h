#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface LoginWith2faDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *provider;
@property (nonatomic) NSString *verificationCode;

@end

