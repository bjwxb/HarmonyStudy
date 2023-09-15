import { FULL_HEIGHT, FULL_WIDTH } from '../../common/constants/CommonConstant'

/**
 * Created on 2023/9/14
 * Auth: wuxiaobo
 */
@Preview
@Component
export struct HomeComponent2{
  @Consume isFirst:boolean

  build(){
    Text("home page" + this.isFirst)
      .textAlign(TextAlign.Center)
      .width(FULL_WIDTH)
      .height(FULL_HEIGHT)
      .onClick(()=>{
        this.isFirst = !this.isFirst
      })
  }
}