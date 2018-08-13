#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface AddSettingDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *value;

@end
