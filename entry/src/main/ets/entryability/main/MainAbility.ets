import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import logService from '../../common/utils/LogService';


/**
 * Created on 2023/8/22
 * Auth: wuxiaobo
 */
export default class MainAbility extends UIAbility{

  onCreate(){
    logService.e(">> main onCreate <<", 'ahah')
    // let windowClass = null;
    // let config = {name: "alertWindow", windowType: window.WindowType.TYPE_SYSTEM_ALERT, ctx: this.context};
    // try {
    //   window.createWindow(config, (err, data) => {
    //     if (err.code) {
    //       console.error('Failed to create the window. Cause: ' + JSON.stringify(err));
    //       return;
    //     }
    //     windowClass = data;
    //     console.info('Succeeded in creating the window. Data: ' + JSON.stringify(data));
    //     windowClass.resetSize(500, 1000);
    //   });
    // } catch (exception) {
    //   console.error('Failed to create the window. Cause: ' + JSON.stringify(exception));
    // }
;  }

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
