#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface OrderDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *instrument;
@property (nonatomic) NSString *type;
@property (nonatomic) int amount;
@property (nonatomic) int price;
@property (nonatomic) int activationPrice;
@property (nonatomic) NSString *isLimit;
@property (nonatomic) NSString *isStop;

@end


@interface MakeOrderDTORequest : NSObject<DTORequest>

@property (nonatomic) OrderDTORequest *order;

- (instancetype) initWithOrder:(OrderDTORequest*)order;

@end
