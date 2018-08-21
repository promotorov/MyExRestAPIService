#import <Foundation/Foundation.h>
#import "OrderDTOResponse.h"
#import "DTOResponse.h"

@interface UserOrdersDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray<OrderDTOResponse*> *orders;

@end
