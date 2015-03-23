#import "ConnectionController.h"

@implementation ConnectionController

-(NSData *)getJsonFromAPIWithUrl:(NSString *)url
{
	NSURL* validURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api-ssl.bitly.com/v3/shorten?access_token=%@&longUrl=%@",self.auth_code,
			[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]]]];

	if(validURL != nil){
		NSMutableURLRequest *APIRequest = [[NSMutableURLRequest alloc] init];
		[APIRequest setHTTPMethod:@"GET"];
		[APIRequest setURL:validURL];

		NSHTTPURLResponse *responseCode;

		NSData *jsonResponse = [NSURLConnection sendSynchronousRequest:APIRequest returningResponse:&responseCode error:nil];


		if([responseCode statusCode] != 200){
		    fprintf(stderr, "%s\n", "[⛔️ ]Error in connecting.\n");
		    return nil;
		}

		return jsonResponse;
	}else{
		fprintf(stderr, "%s\n","[⛔️ ]URL not valid!\n");
		exit(-1);
	}
}


-(NSString*)getShortedURL:(NSString*)longURL
{
	NSData *JSON = [self getJsonFromAPIWithUrl:longURL];
    NSDictionary* JSONDict = [NSJSONSerialization
                      JSONObjectWithData:JSON
                      options:0
                      error:nil];
    if([[JSONDict objectForKey:@"data"] respondsToSelector:@selector(objectForKey:)]){
    return [[JSONDict objectForKey:@"data"] objectForKey:@"url"];
	}
	else{
		fprintf(stderr, "%s\n", "[⛔️ ]Cannot shrink URL. Is it a valid one?\n");
		exit(-1);
	}
   
}
@end