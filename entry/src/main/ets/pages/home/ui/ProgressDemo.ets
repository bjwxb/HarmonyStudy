/**
 * Created on 2023/9/4
 * Auth: wuxiaobo
 */
import { TitleBar } from '../../../common/widgets/TitleBar';
@Entry
@Component
struct ProgressDemo{
  @State value: number = 0;

  private intervalID: number = -1;

  build() {
    Column({space: 10}) {
      TitleBar({title: "Progress Demo"})
      Progress({
        value: this.value,           // 设置当前进度
        total: 60,
        type: ProgressType.ScaleRing // 设置进度条的样式为环境样式
      }).style({
          scaleCount: 30,              // 设置环形进度条刻度数量
          scaleWidth: 30               // 设置环形进度条刻度粗细
        })
        .color(Color.Red)
        .size({width: 80, height: 80})

      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Capsule
      }).size({width: 120, height: 50})

      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Eclipse
      }).color(Color.Red)
        .size({width: 80, height: 80})

      //线形
      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Linear
      }).style({strokeWidth: 10})      // 设置进度条线宽
        .size({width: '100%', height: 40})

      //环形
      Progress({
        value: this.value,           // 设置当前进度
        total: 100,                  // 设置进度总量
        type: ProgressType.Ring
      }).style({strokeWidth: 10})
        .color(Color.Pink)
        .size({width: 100, height: 100})


      LoadingProgress()
        .width(120)
        .height(40)
        .color(Color.Pink) // 设置进度条的前景色

      LoadingProgress()
        .width(50)
        .height(50)
        .color(Color.Blue) // 设置进度条的前景色
    }
    .width('100%')
    .height('100%')
  }


  aboutToAppear() {
    this.intervalID = setInterval(() => {
      this.value += 1
      if (this.value > 100) {
        clearInterval(this.intervalID);
      }
      console.log("update: " + this.value)
    }, 100);
  }
}