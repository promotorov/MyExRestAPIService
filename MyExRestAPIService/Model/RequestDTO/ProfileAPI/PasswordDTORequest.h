#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface PasswordAccountInfo : NSObject<DTORequest>

@property(nonatomic) NSString *password;
@property(nonatomic) NSString *email;

@end


@interface PasswordDTORequest : NSObject<DTORequest>

@property(nonatomic) NSString *resetPasswordtoken;
@property(nonatomic) PasswordAccountInfo *account;

@end
