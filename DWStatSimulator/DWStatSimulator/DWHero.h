//
//  DWHero.h
//  DWStatSimulator
//
//  Created by Guest User on 11/5/56 BE.
//  Copyright (c) 2556 TOATE. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int MAX_STAT_POINT = 19;

@interface DWHero : NSObject

@property (strong,nonatomic) NSNumber *pow,*agi,*vit,
*basePow,*baseAgi,*baseVit,
*bonusPow,*bonusAgi,*bonusVit,//stat +

*hp,*def,*att,*spd,*flee,*cri,
*baseHp,*baseDef,*baseAtt,*baseSpd,*baseFlee,*baseCri,
*upgradeHp,*upgradeDef,*upgradeAtt,*upgradeSpd,*upgradeFlee,*upgradeCri;//static upgrade value

@property (strong,nonatomic) NSString *heroName;

- (id)initWithDic:(NSDictionary*)data name:(NSString*)name;
- (void)updateStat;


@end
