/**
 * Text 组件学习
 * Created on 2023/8/26
 * Auth: wuxiaobo
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct TextDemo {
  @State startMarquee: boolean = false

  build() {
    Column() {
      TitleBar({ title: 'Text demo' })

      Text('普通默认文字').lineHeight(30)
      Text('加粗文字').fontWeight(FontWeight.Bold).lineHeight(30)
      Text('倾斜文字').fontStyle(FontStyle.Italic).lineHeight(30)
      Text('文字背景颜色')
        .fontColor(Color.White)
        .backgroundColor(Color.Blue)
        .textAlign(TextAlign.Center)
        .margin({ top: 10 })

      //todo 为什么不生效
      Marquee({
        start: this.startMarquee,
        step: 50,
        fromStart: true,
        loop: Infinity,
        src: "Hello World!"
      }).width("60%")
        .height(30)
        .backgroundColor(Color.Pink)
        .margin({ top: 10 })
        .onStart(() => {
          logService.d('Marquee animation complete onStart')
        })
        .onBounce(() => {
          logService.d('Marquee animation complete onBounce')
        })
        .onFinish(() => {
          logService.d('Marquee animation complete onFinish')
        })

      Button('Marquee Start')
        .onClick(() => {
          this.startMarquee = true; //!this.startMarquee
        })
        .height(40)
        .fontSize(16)
        .margin({ top: 10 })
        .backgroundColor('#007DFF')

      Text('文字圆角背景')
        .height(40)
        .padding({ left: 10, right: 10 })
        .border({ width: 1, color: Color.Red, radius: 8 })
        .margin({ top: 10 })

      Text('')
        .width(20)
        .height(20)
        .borderRadius(20)
        .margin({top: 10})
        .backgroundColor(Color.Red)

      Text('圆')
        .backgroundColor(Color.Red)
        .width(40)
        .height(40)
        .fontColor(Color.White)
        .border({radius: 40})
        .margin({top: 10})
        .fontSize(16)
        .textAlign(TextAlign.Center)

      Text('下划线文字')
        .decoration({type: TextDecorationType.Underline, color: Color.Red})
        .height(40)

      Text('删除线文字')
        .decoration({type: TextDecorationType.LineThrough, color: Color.Blue})
        .height(30)
        .fontColor(Color.Red)

      Text('文字内容过多一行显示 省略号 文字内容过多一行显示文字内容过多一行显示')
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
        .maxLines(1)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .width('80%')

      Text('文字内容过多一行显示 截取 文字内容过多一行显示文字内容过多一行显示')
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .maxLines(1)
        .margin({top: 10})
        .textOverflow({overflow: TextOverflow.Clip})
        .width('80%')

      Text('文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示文字内容过多换行显示')
        .margin({top: 10})
        .width('80%')
        .fontSize(16)
        .lineHeight(24)
        .fontColor(Color.Red)
        .backgroundColor(Color.Gray)


    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
    .justifyContent(FlexAlign.Start)
  }
}