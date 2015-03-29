//
//  Realm.h
//  Navigation
//
//  Created by Patricia Machado de Abreu on 20/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Pagina : RLMObject

@property (nonatomic, strong) NSString *letter;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *text;
@property (nonatomic) int number;


@end
