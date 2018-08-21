#import <Foundation/Foundation.h>
#import "DTORequest.h"

@interface NewKeyDTORequest : NSObject<DTORequest>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *isInfo;
@property (nonatomic) NSString *isWithdraw;
@property (nonatomic) NSString *isTrade;
@property (nonatomic) NSMutableArray<NSString*> *ipWhiteList;

@end

