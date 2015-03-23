#import "ConnectionController.h"
#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>

int main(int argc, char const *argv[])
{
	@autoreleasepool
	{
		if(argc < 2){
			fprintf(stderr, "%s\n", "[⛔️ ]Too few args! Use: short <url>");
			return 0;
		}

		ConnectionController* newConn = [[ConnectionController alloc] init];
		newConn.auth_code = @"f2e49795deed18c2e2b679966e24a999cdeaa633";
		NSString* shortedUrl = [newConn getShortedURL:[NSString stringWithUTF8String:argv[1]]];
		NSPasteboard* pBoard = [NSPasteboard generalPasteboard];
		NSArray* urlArr = [NSArray arrayWithObject:shortedUrl];
		[pBoard clearContents];
		[pBoard writeObjects:urlArr];
		puts("[✅ ]Shrinked url copied to pasteboard.\n");
	}

	return 0;
}
