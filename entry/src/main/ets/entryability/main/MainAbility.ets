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

    // let windowClass = null;
    // windowStage.getMainWindow((err, data) => {
    //   if (err.code) {
    //     console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
    //     return;
    //   }
    //   windowClass = data;
    //   console.info('Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
    //
    //   // 实现沉浸式效果，设置应用主窗口为全屏显示。
    //   let isFullScreen = true;
    //   windowClass.setFullScreen(isFullScreen, (err) => {
    //     if (err) {
    //       console.error('Failed to enable the full-screen mode. Cause:' + JSON.stringify(err));
    //       return;
    //     }
    //     console.info('Succeeded in enabling the full-screen mode.');
    //   });
    //
    // })
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
