#import <Foundation/Foundation.h>
#import "DTOResponse.h"
#import "KeyDTOResponse.h"

@interface ApiKeysDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray<KeyDTOResponse*> *keys;

@end
