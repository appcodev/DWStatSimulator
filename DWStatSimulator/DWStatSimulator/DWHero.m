//
//  DWHero.m
//  DWStatSimulator
//
//  Created by Guest User on 11/5/56 BE.
//  Copyright (c) 2556 TOATE. All rights reserved.
//

#import "DWHero.h"

@implementation DWHero

- (id)initWithDic:(NSDictionary*)data name:(NSString *)name{
    
    self = [super init];
    
    if (self) {
        self.heroName = name;
        
        self.basePow = data[@"base_pow"];
        self.baseAgi = data[@"base_agi"];
        self.baseVit = data[@"base_vit"];
        self.baseHp = data[@"base_hp"];
        self.baseDef = data[@"base_def"];
        self.baseAtt = data[@"base_att"];
        self.baseSpd = data[@"base_spd"];
        self.baseFlee = data[@"base_flee"];
        self.baseCri = data[@"base_cri"];
        self.upgradeHp = data[@"upgrade_hp"];
        self.upgradeDef = data[@"upgrade_def"];
        self.upgradeAtt = data[@"upgrade_att"];
        self.upgradeSpd = data[@"upgrade_spd"];
        self.upgradeFlee = data[@"upgrade_flee"];
        self.upgradeCri = data[@"upgrade_cri"];
        
        [self updateStat];
    }
    
    return self;
}

- (void)updateStat{
    //stat
    self.pow = @([self.basePow integerValue]+[self.bonusPow integerValue]);
    self.agi = @([self.baseAgi integerValue]+[self.bonusAgi integerValue]);
    self.vit = @([self.baseVit integerValue]+[self.bonusVit integerValue]);
    
    //second stat
    self.hp = @([self.baseHp floatValue]+[self.upgradeHp floatValue]*[self.bonusVit integerValue]);
    self.def = @([self.baseDef floatValue]+[self.upgradeDef floatValue]*[self.bonusVit integerValue]);
    self.att = @([self.baseAtt floatValue]+[self.upgradeAtt floatValue]*[self.bonusPow integerValue]);
    self.spd = @([self.baseSpd floatValue]+[self.upgradeSpd floatValue]*[self.bonusAgi integerValue]);
    self.flee = @([self.baseFlee floatValue]+[self.upgradeFlee floatValue]*[self.bonusAgi integerValue]);
    self.cri = @([self.baseCri floatValue]+[self.upgradeCri floatValue]*[self.bonusAgi integerValue]);
    
}

@end
