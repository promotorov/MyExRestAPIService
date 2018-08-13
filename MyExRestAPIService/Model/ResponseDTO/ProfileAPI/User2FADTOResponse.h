#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface User2FADTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *secret;
@property (nonatomic) NSString *otpUrl;
@property (nonatomic) NSString *enabled;
@property (nonatomic) NSString *provider;

@end
