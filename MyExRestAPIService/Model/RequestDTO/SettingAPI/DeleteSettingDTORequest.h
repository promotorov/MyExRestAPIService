#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface DeleteSettingDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *value;

@end

