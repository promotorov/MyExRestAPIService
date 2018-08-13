#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface WalletDepositDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *assetId;
@property (nonatomic) NSString *paymentSystem;
@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *fiatPaymentMethod;

@end

