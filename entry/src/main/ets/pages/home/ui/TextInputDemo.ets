/**
 * Created on 2023/9/4
 * Auth: wuxiaobo
 */
import { FULL_WIDTH } from '../../../common/constants/CommonConstant'
import logService from '../../../common/utils/LogService'
import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct TextInputDemo {
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
          .type(InputType.Password) //键盘类型
          .showPasswordIcon(false) //是否显示眼睛icon
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



     Column(){
       TextArea({placeholder: "请输入多行内容"})
         .width(FULL_WIDTH)
         .backgroundColor(Color.Gray)
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
     }
     .padding({left: 20, right: 20})
     .justifyContent(FlexAlign.Start)
     .backgroundColor(Color.Brown)

    }
  }
}