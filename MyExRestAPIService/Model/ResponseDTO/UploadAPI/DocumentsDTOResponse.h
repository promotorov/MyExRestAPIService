#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface DocumentsDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray<NSString*> *data;

@end
