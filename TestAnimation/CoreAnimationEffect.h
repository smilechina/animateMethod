//
//  CoreAnimationEffect.h
//  TestAnimation
//
//  Created by apple  on 13-8-6.
//  Copyright (c) 2013年 apple . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@interface CoreAnimationEffect : NSObject
{
    
}
/**
 *  显示动画
 *
 *  @param type           动画过渡类型
 *  @param subType        动画过渡方向(子类型)
 *  @param duration       动画持续时间
 *  @param timingFunction 动画定时函数属性
 *  @param theView        需要添加动画的view.
 */
+ (void)showAnimationType:(NSString *)type
             withSubType:(NSString *)subType
                duration:(CFTimeInterval)duration
          timingFunction:(NSString *)timingFunction
                    view:(UIView *)theView;

/**
 *  左翻转
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationFlipFromLeft:(UIView *)view
                     duration:(CFTimeInterval)duration;

/**
 *  右翻转
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationFlipFromRigh:(UIView *)view
                     duration:(CFTimeInterval)duration;
                             
/**
 *  上翻页
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationCurlUp:(UIView *)view
              duration:(CFTimeInterval)duration;

/**
 *  下翻页
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationCurlDown:(UIView *)view
                 duration:(CFTimeInterval)duration;

/**
 *  通过transfrom实现动画
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationByTransform:(UIView *)view
                    duration:(CFTimeInterval)duration;


/**
 *  通过Transform3D实现动画
 *
 *  @param view     view
 *  @param duration 动画时间
 */
+ (void)animationByTransform3D:(UIView *)view
                      duration:(CFTimeInterval)duration;

/**
 *  CAAnimationGroup动画组，组合动画
 *  这只是一个用例，因为这种组合实在是太多了，卓要讲解一下，用法。
 *  @param view 动画view
 */
+ (void)animationRotateAndScaleDownUp:(UIView *)view;


@end
