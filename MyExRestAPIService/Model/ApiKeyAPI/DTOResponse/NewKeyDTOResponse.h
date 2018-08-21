#import <Foundation/Foundation.h>
#import "DTOResponse.h"
#import "KeyDTOResponse.h"

@interface NewKeyDTOResponse : NSObject<DTOResponse>

@property (nonatomic) KeyDTOResponse *key;

@end
