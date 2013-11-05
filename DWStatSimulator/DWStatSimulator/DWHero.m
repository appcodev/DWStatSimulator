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
    self.hp = @([self.baseHp integerValue]+[self.upgradeHp integerValue]*[self.vit integerValue]);
    self.def = @([self.baseDef integerValue]+[self.upgradeDef integerValue]*[self.vit integerValue]);
    self.att = @([self.baseAtt integerValue]+[self.upgradeAtt integerValue]*[self.pow integerValue]);
    self.spd = @([self.baseSpd integerValue]+[self.upgradeSpd integerValue]*[self.agi integerValue]);
    self.flee = @([self.baseFlee integerValue]+[self.upgradeFlee integerValue]*[self.agi integerValue]);
    self.cri = @([self.baseCri integerValue]+[self.upgradeCri integerValue]*[self.agi integerValue]);
    
}

@end
