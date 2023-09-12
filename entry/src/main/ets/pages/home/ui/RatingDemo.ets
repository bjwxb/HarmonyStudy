import { TitleBar } from '../../../common/widgets/TitleBar'
@Entry
@Component
struct RatingDemo {
  @State rating: number = 0


  build() {
    Column() {
      TitleBar({title: " Rating Demo"})

      Text(`current ratint = ${this.rating}`)

      Rating({rating: 3, indicator: true})
        .width(150)
        .height(40)
        .stars(5)
        .margin({top: 30})

      Rating({rating: 3, indicator: false})
        .width(150)
        .height(40)
        .stars(5)
        .margin({top: 30})

      Rating({rating: 3})
        .stars(5)
        .stepSize(0.5)
        // .starStyle({
        //   backgroundUri:`${$r('app.media.tab_mine_normal')}`,
        //   foregroundUri:`${$r('app.media.ic_star_selected')}`
        // })
        .margin({top: 30})
        .onChange((value) => {
          this.rating = value;
        })

      Rating({rating: 3})
        .stars(5)
        .stepSize(0.1)
        .margin({top: 30})
        .onChange((value) => {
          this.rating = value;
        })
    }
    .width('100%')
    .height('100%')
  }
}