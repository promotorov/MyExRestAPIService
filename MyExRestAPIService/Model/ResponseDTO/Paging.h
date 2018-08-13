#import <Foundation/Foundation.h>
#import "DTOResponse.h"

@interface Paging : NSObject<DTOResponse>

@property (nonatomic) NSString *page;
@property (nonatomic) NSString *per_page;
@property (nonatomic) NSString *total;

@end
