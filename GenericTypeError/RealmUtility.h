//
//  RealmUtility.h
//  GenericTypeError
//
//  Created by Kristopher Woodall on 4/10/20.
//  Copyright © 2020 Remind. All rights reserved.
//

@import Foundation;
#import <Realm/Realm.h>
#import <Realm/RLMCollection.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSNumber<RLMInt> *RealmInt;

@interface RealmUtility : NSObject

@property (nonatomic, strong, nonnull) RLMRealm *realm;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
