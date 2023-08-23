import promptAction from '@ohos.promptAction';


/**
 * Created on 2023/8/22
 * Auth: wuxiaobo
 */
class Toast{

  show(message:string){
    promptAction.showToast({message: message})
  }
}

let toast = new Toast();

export default toast;
