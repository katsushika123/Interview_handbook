import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { Logger } from '../common/utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    Logger.debug('EntryAbility_Print', 'Ability onCreate')
  }

  onDestroy(): void {
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    Logger.info('EntryAbility_Print', 'Ability onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    Logger.info('EntryAbility_Print', 'Ability onWindowStageCreate')

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        // hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        Logger.error(JSON.stringify(err) ?? '')
        return;
      }
      // hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
      Logger.info('Succeeded in loading the content.')
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    Logger.info('EntryAbility_Print', 'Ability onWindowStageDestroy')
  }

  onForeground(): void {
    // Ability has brought to foreground
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    Logger.info('EntryAbility_Print', 'Ability onForeground')
  }

  onBackground(): void {
    // Ability has back to background
    // hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    Logger.info('EntryAbility_Print', 'Ability onBackground')
  }
}
