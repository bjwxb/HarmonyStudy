/**
 * Created on 2023/8/26
 * Auth: wuxiaobo
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import toast from '../../../common/utils/Toast'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct ButtonDemo{
  build(){
    Column(){
      TitleBar({title: "Button Demo"})

      Button("默认按钮").margin({top: 10})

      Button("正常样式按钮")
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .margin({top: 10})

      Button("圆角矩形按钮")
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .borderRadius(5)
        .margin({top: 10})

      Button("带边框按钮")
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .border({width: 2, color: Color.Blue, style: BorderStyle.Solid})
        .borderRadius(4)
        .margin({top: 10})

      Button("登录", {type: ButtonType.Circle})
        .fontSize(16)
        .width(80)
        .height(80)
        .backgroundColor(Color.Red)
        .margin({top: 10})

      Button("点击事件,默认开启点击效果")
        .margin({top: 10})
        .onClick(() => {
          toast.show("click button")
        })

      Button("点击事件,关闭点击效果", {stateEffect: false})
        .margin({top: 10})
        .onClick(() => {
          toast.show("click button")
        })

      Button("点击事件，自定义点击效果")
        .margin({top: 10})
        .stateStyles({
          normal: {
            .backgroundColor(Color.Red)
          },
          pressed: {
            .backgroundColor(Color.Orange)
          }
        })
        .onClick(() => {
          toast.show("click button")
        })

      Button({type: ButtonType.Normal}){
        Row(){
          Image($r("app.media.app_icon")).width(25).height(25)
          Text('button包含复杂组件').margin({left: 8}).fontColor(Color.Red)
        }
      }.padding({left: 10, right: 10})
      .margin({top: 10})
      .onClick(() => {
        toast.show("click button")
      })

    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}