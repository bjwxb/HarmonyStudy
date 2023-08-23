/**
 * Created on 2023/8/22
 * Auth: wuxiaobo
 */
import App from '@system.app'
import toast from '../../common/utils/Toast'
import { TitleBar } from '../../common/widgets/TitleBar'

@Entry
@Component
struct Main{
  build(){
    Column(){
      TitleBar({
        showBack: true,
        title: "main page",
        showRightIcon: true,
        rightCallback: () => {
          toast.show("click right icon")
        },
        bgColor:Color.Brown
      })
      Text('Hello World!').fontSize("20fp").fontColor(Color.Red)
    }.width('100%')
    .height('100%')
  }
}
