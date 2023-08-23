import router from '@ohos.router';
import { TitleBarBean } from '../bean/TitleBarBean'


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
      if(this.showBack){
        Image($r("app.media.ic_back"))
          .height('100%')
          .objectFit(ImageFit.Contain)
          .padding({left: 15, right: 5})
          .onClick(() => {
            router.back()
          })
      }

      Text(`${this.title}`)
        .fontSize($r('app.float.fp_18'))
        .fontColor(Color.Black)
        .layoutWeight(1)
        .height("100%")
        .textAlign(TextAlign.Center)

      if(this.showRightIcon){
        Image($r("app.media.ic_right_more"))
          .height('100%')
          .objectFit(ImageFit.Contain)
          .padding({left: 10, right: 10})
          .onClick(this.rightCallback)
      }
    }
    .width('100%')
    .height($r("app.float.title_height"))
    .backgroundColor(this.bgColor)
  }
}