#import <Foundation/Foundation.h>

@interface CookieService : NSObject

- (void) deleteAllCookies;
- (void) saveAllCookies:(NSHTTPCookieStorage*)storage;
- (void) loadSavedCookies;

@end
