#import <Foundation/Foundation.h>
#import "OrderDTOResponse.h"
#import "DTOResponse.h"

@interface OrderHistoryDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSMutableArray<OrderDTOResponse*> *orders;

@end
