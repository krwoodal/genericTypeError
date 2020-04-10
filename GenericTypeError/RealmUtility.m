//
//  RealmUtility.m
//  GenericTypeError
//
//  Created by Kristopher Woodall on 4/10/20.
//  Copyright © 2020 Remind. All rights reserved.
//

#import "RealmUtility.h"

@implementation RealmUtility

+ (instancetype)sharedInstance {
    static RealmUtility *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _realm = [RLMRealm realmWithConfiguration:[RLMRealmConfiguration defaultConfiguration] error:NULL];
    }
    return self;
}

@end
