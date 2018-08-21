#import <Foundation/Foundation.h>
#import "DTOResponse.h"
#import "KeyDTOResponse.h"

@interface AllKeysDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray<KeyDTOResponse*> *keys;

@end
