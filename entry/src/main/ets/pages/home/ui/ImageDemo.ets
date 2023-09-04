/**
 * Created on 2023/8/26
 * Auth: wuxiaobo
 */
import { FULL_HEIGHT, FULL_WIDTH } from '../../../common/constants/CommonConstant'
import toast from '../../../common/utils/Toast'
import { TitleBar } from '../../../common/widgets/TitleBar'

@Entry
@Component
struct ImageDemo{
  build(){
    Column(){
      TitleBar({title: 'image demo'})

      Image($r("app.media.test"))
        .width(100)
        .height(100)
        .margin({top: 10})
        .onClick(()=>{
          toast.show("click image")
        })

      Image($r("app.media.test"))
        .width(100)
        .height(100)
        .margin({top: 10})
        .objectFit(ImageFit.Contain)
        .renderMode(ImageRenderMode.Template)

      Image($r("app.media.test"))
        .width(100)
        .height(50)
        .margin({top: 10})
        .objectFit(ImageFit.Cover)
        .backgroundColor(Color.Gray)

      Image($r("app.media.test"))
        .width(100)
        .height(50)
        .margin({top: 10})
        .objectFit(ImageFit.Fill)
        .backgroundColor(Color.Gray)

      Image($r("app.media.test"))
        .width(100)
        .height(50)
        .margin({top: 10})
        .objectFit(ImageFit.Auto)

    }
    .width(FULL_WIDTH)
    .height(FULL_HEIGHT)
  }
}