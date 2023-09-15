import router from '@ohos.router'
import { ImageKnifeOption } from '@ohos/imageknife/src/main/ets/components/imageknife/ImageKnifeOption'
import { AppPage } from '../../common/constants/AppPage'
import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'
import logService from '../../common/utils/LogService'
import toast from '../../common/utils/Toast'

@Entry
@Component
struct SplashPage{

  private intervalId: number;
  private totalDuration:number = 2000
  @State second: number = 3;
  @State currentDuration:number = 0

  @State option: ImageKnifeOption = {
    loadSrc: $r('app.media.img_splash')
  }

  build() {
    Stack({alignContent: Alignment.TopEnd}) {
      Image($r('app.media.img_splash')).width(FULL_WIDTH).height(FULL_HEIGHT)

      Stack({alignContent: Alignment.Center}){
        Text(`${this.second.toFixed(0)}`)
          .fontColor(Color.White)
          .fontSize(20)
          .margin({top: 30, right: 30})

        Progress({value: this.currentDuration, total: this.totalDuration, type: ProgressType.Ring})
          .width(44)
          .height(44)
          .color(Color.Red)
          .margin({top: 30, right: 30})
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor("#aabbcc")
    .onClick(()=>{
      this.jump2main();
    })
  }

  aboutToAppear(){
    this.intervalId = setInterval(() => {
      this.currentDuration++
      this.second = (this.totalDuration - this.currentDuration)/1000 + 1
      if (this.second <= 1) {
        this.jump2main();
      }
    }, 1)
  }

  jump2main(){
    clearInterval(this.intervalId);
    router.replaceUrl({url: AppPage.pageMain})
  }

  aboutToDisappear(){
    clearInterval(this.intervalId)
  }
}