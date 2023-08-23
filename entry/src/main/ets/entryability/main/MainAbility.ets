import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import logService from '../../common/utils/LogService';


/**
 * Created on 2023/8/22
 * Auth: wuxiaobo
 */
export default class MainAbility extends UIAbility{

  onCreate(){
    logService.e(">> main onCreate <<")
  }

  onDestroy(){
    logService.e(">>> main onDestroy <<<")
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    logService.e(">>> onWindowStageCreate <<<")
    windowStage.loadContent('pages/main/Main', (err, data) => {
      if (err.code) {
        logService.e(JSON.stringify(err) ?? '')
        return;
      }
      logService.e(JSON.stringify(data) ?? '')
    });
  }

  onWindowStageDestroy(){
    logService.e(">>> destroy onWindowStageDestroy <<<")
  }

  onForeground(){
    logService.e(">>> onForeground <<<")
  }

  onBackground(){
    logService.e(">>>>> onBackground <<<")
  }
}
