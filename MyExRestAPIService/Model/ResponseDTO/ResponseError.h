#import <Foundation/Foundation.h>
#import "OrderDTOResponse.h"

@interface ResponseError : NSObject

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *statusCode;
@property (nonatomic) NSString *messageCode;

-(instancetype) initWithMessage:(NSString*)message
                 withStatusCode:(NSString*)statusCode
                withMessageCode:(NSString*)messageCode;

@end
