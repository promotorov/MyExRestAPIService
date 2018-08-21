#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface KeyDTOResponse : NSObject<DTOResponse>

@property (nonatomic) NSString *publicKey;
@property (nonatomic) NSString *privateKey;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *isInfo;
@property (nonatomic) NSString *isTrade;
@property (nonatomic) NSString *isWithdraw;
@property (nonatomic) NSMutableArray<NSString*> *ipWhiteList;

@end
