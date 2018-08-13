#import "CookieService.h"

@implementation CookieService

static NSString *const ApplicationCookieKey = @"ApplicationCookies";

- (void) loadSavedCookies {
    NSData *cookieData = [[NSUserDefaults standardUserDefaults] objectForKey:ApplicationCookieKey];
    NSLog(@"starting load cookies...");
    if ([cookieData length] > 0) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookieData];
        for (NSHTTPCookie *cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
            NSLog(@"load cookie ...%@", cookie);
        }
    }
    NSLog(@"end");
}

- (void) deleteAllCookies {
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    unsigned long size = [storage.cookies count];
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    NSLog(@"Cookies were deleted: %li", size);
}

- (void) saveAllCookies:(NSHTTPCookieStorage*)storage {
    NSData *cookieData = [NSKeyedArchiver archivedDataWithRootObject:storage.cookies];
    [[NSUserDefaults standardUserDefaults] setObject:cookieData forKey:ApplicationCookieKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Cookie saved: %li", [storage.cookies count]);
}

@end

