#import <Foundation/Foundation.h>

@interface ConnectionController : NSObject{
	
}
@property (assign) NSString* auth_code;

-(NSData *)getJsonFromAPIWithUrl:(NSString *)url;
-(NSString*)getShortedURL:(NSString*)longURL;
@end
