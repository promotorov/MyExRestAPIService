#import <Foundation/Foundation.h>
#import "OrderDTOResponse.h"
#import "DTOResponse.h"

@interface MakeOrderDTOResponse : NSObject<DTOResponse>

@property (nonatomic) OrderDTOResponse *order;

@end
