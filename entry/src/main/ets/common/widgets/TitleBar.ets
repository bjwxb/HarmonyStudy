import router from '@ohos.router';
import { FULL_HEIGHT } from '../constants/CommonConstant';


/**
 * Created on 2023/8/23
 * Auth: wuxiaobo
 */
@Component
export struct TitleBar {

  //是否显示返回按钮
  private showBack:boolean = true
  //返回按钮事件回调
  private backCallback:() => void

  //标题
  private title:string = ""

  //右侧按钮
  private showRightIcon:boolean = false
  //右侧按钮回调
  private rightCallback:() => void

  //titleBar背景颜色
  private bgColor: ResourceColor = $r('app.color.main_color')

  build() {
    Row() {
      Row(){
        if(this.showBack){
          Image($r("app.media.ic_left_white"))
            .objectFit(ImageFit.Contain)
            .size({width: 25, height: 25})
        }
      }
      .width(60)
      .height(FULL_HEIGHT)
      .justifyContent(FlexAlign.Center)
      .onClick(()=>{
        if(this.showBack){
          router.back()
        }
      })

      Text(`${this.title}`)
        .fontSize($r('app.float.fp_18'))
        .fontColor(Color.White)
        .layoutWeight(1)
        .height("100%")
        .maxLines(1).textOverflow({overflow: TextOverflow.Ellipsis})
        .textAlign(TextAlign.Center)

      Row(){
        if(this.showRightIcon){
          Image($r("app.media.ic_right_more"))
            .height('100%')
            .objectFit(ImageFit.Contain)
            .padding({left: 10, right: 10})
            .onClick(this.rightCallback)
        }
      }
      .width(60)
      .height(FULL_HEIGHT)
      .justifyContent(FlexAlign.Center)
      .onClick(()=>{
        if(this.showRightIcon){
          router.back()
        }
      })
    }
    .width('100%')
    .height($r("app.float.title_height"))
    .backgroundColor(this.bgColor)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}