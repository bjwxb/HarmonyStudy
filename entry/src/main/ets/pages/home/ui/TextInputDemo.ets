/**
 * Created on 2023/9/4
 * Auth: wuxiaobo
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct TextInputDemo {
  @State accumulateTime: number = 0
  // 导入对象
  controller: TextClockController = new TextClockController()

  private select: number = 1
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4']

  build() {
    Column() {
      TitleBar({ title: "TextInput Demo" })

      Row() {
        Text('用户：')
        TextInput({ placeholder: "请输入用户名" })
          .layoutWeight(1)
          .height(50)
          .caretColor(Color.Red) //指针颜色
          .type(InputType.Number) //键盘类型
          .maxLength(11)// 最大输入长度
          .borderRadius(5) //圆角
          .placeholderColor(Color.Red)
          .placeholderFont({
            size: 14,
            weight: FontWeight.Normal,
            style: FontStyle.Italic
          })
          .fontColor(Color.Blue)
          .fontSize(18)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Bold)
          .onChange((s)=>{
            logService.d(`>>>>>> s = ${s}`)
          })
      }
      .padding({ left: 20, right: 20 })
      .margin({ top: 10 })

      Row() {
        Text('密码：')
        TextInput({ placeholder: "请输入密码" })
          .layoutWeight(1)
          .height(50)
          .maxLength(16)
          .borderWidth(2)
          .borderColor(Color.Orange)
          .borderStyle(BorderStyle.Solid)
          .borderRadius(8)
          .type(InputType.Password) //键盘类型
          .showPasswordIcon(true) //是否显示眼睛icon
          .placeholderFont({
            size: 14,
            weight: FontWeight.Normal,
            style: FontStyle.Italic
          })
          .fontColor(Color.Blue)
          .fontStyle(FontStyle.Normal)
      }
      .padding({ left: 20, right: 20 })
      .margin({ top: 10, bottom: 30})

      TextArea({placeholder: "请输入多行内容"})
        .height(100)
        .placeholderColor(Color.Red)
        .placeholderFont({
          size: 14,
          weight: FontWeight.Normal,
          style: FontStyle.Italic
        })
        .borderRadius(0)
        .fontColor(Color.Blue)
        .fontSize(14)
        .fontStyle(FontStyle.Normal)
        .fontWeight(FontWeight.Bold)
        .margin({left: 20, right: 20})

      TextPicker({ range: this.fruits, selected: this.select })
        .onChange((value: string, index: number) => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index)
        })

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text('Current milliseconds is ' + this.accumulateTime)
          .fontSize(20)

        TextClock({ timeZoneOffset: -8, controller: this.controller })
          //HH-24小时进制， hh-12小时
          //yyyyMMdd - 2023/09/13
          //yyyyMMMMd - 2023年9月13日
          .format('yyyyMMddHms')
          .fontSize($r('app.float.fp_24'))
          .fontColor(Color.Red)
          .onDateChange((value: number) => {
            this.accumulateTime = value
          })
          .margin(20)

        Button("start TextClock")
          .margin({ bottom: 10 })
          .onClick(() => {
            // 启动文本时钟
            this.controller.start()
          })
        Button("stop TextClock")
          .onClick(() => {
            // 停止文本时钟
            this.controller.stop()
          })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}