#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface OrderDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *orderId;
@property (nonatomic) NSString *createdAt;
@property (nonatomic) NSString *instrument;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *isLimit;
@property (nonatomic) NSString *isPending;
@property (nonatomic) NSString *total;
@property (nonatomic) NSString *orderType;
@property (nonatomic) NSString *commission;
@property (nonatomic) NSString *unitsFilled;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *price;

@end
