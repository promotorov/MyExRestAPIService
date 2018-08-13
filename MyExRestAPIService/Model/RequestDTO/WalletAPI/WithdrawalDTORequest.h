#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface WithdrawalDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *transferId;
@property (nonatomic) NSString *assetId;
@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *code;

@end
