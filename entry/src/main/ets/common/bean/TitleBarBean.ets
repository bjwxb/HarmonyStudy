/**
 * Created on 2023/8/23
 * Auth: wuxiaobo
 */
export class TitleBarBean {
  public showBack:boolean = true
  public backCallback:() => void

  public title:string = ""

  public showRightIcon:boolean = false
  public rightCallback:() => void
}
