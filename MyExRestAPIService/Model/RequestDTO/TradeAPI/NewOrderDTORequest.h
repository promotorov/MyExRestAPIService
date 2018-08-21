#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface NewOrderDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *instrument;
@property (nonatomic) NSString *type;
@property (nonatomic) int amount;
@property (nonatomic) int price;
@property (nonatomic) int activationPrice;
@property (nonatomic) NSString *isLimit;
@property (nonatomic) NSString *isStop;

@end
