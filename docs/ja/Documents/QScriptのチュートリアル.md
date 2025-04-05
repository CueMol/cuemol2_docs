[Documents](../../Documents)

## QScriptを使用して論文用の図を作ろう

ここでは主に，CueMol 1.0 (build 42以降を想定) を使用した, QScriptによる分子の表示方法を説明します．

QScript関連の仕様はWindows版とUNIX版でほぼ同じですが，GUIが関わる部分（スクリプトの実行方法など）で，異なる部分がありますのでご注意ください．

### スクリプトファイルの実行方法
Windows版
:   メニュー"File"->"Execute QScript..."を選択する．→実行するスクリプトファイル（拡張子はqsが標準）を選ぶ．→実行される<br />

あるいは，ツールバーの![execscr](../../assets/images/Documents/QScriptのチュートリアル/execscr.png)ボタンをクリックする．





### 前バージョン"Que"からの変更点について
前バージョン"Que"と比べて，基本的な概念やおおまかな仕様には変更はありません．しかし，特に**レンダラーのプロパティ名が一部変更されている**ため，残念ながらQue用のスクリプトの大部分はCueMolでは動かないと思われます．各ステップに「**Queからの変更点**」という項目を設けましたので，その部分を参考にスクリプトを一部修正すればCueMolでも使用できると思います．
### メニュー

- 基本

    - [Step1 Ball&StickモデルとCPKモデル](../../Documents/QScriptのチュートリアル/Step1)

    - [Step2 Tubeモデル](../../Documents/QScriptのチュートリアル/Step2)

    - [Step3 Ribbonモデル](../../Documents/QScriptのチュートリアル/Step3)

    - [Step4 相互作用の表示](../../Documents/QScriptのチュートリアル/Step4)

    - [Step5 画像ファイルへの書出し](../../Documents/QScriptのチュートリアル/Step5)

    - [Step6 POV-Rayを使う](../../Documents/QScriptのチュートリアル/Step6)

    - [Step7 エラーが出たときは](../../Documents/QScriptのチュートリアル/Step7)


- さらに進んだトピック 

    - [StepA1 リボンモデルによる核酸(DNA, RNA)の表示](../../Documents/QScriptのチュートリアル/StepA1)

    - [StepA2 電子密度(electron density)の表示](../../Documents/QScriptのチュートリアル/StepA2)

    - [StepA3 ジスルフィド結合，N-, O-結合型糖鎖など（disulphide bonds, sugar, etc）の表示](../../Documents/QScriptのチュートリアル/StepA3)

    - [StepA4 分子表面(surface model)の表示](../../Documents/QScriptのチュートリアル/StepA4)

    - [StepA5 表面電荷(electrostatic potential)の表示](../../Documents/QScriptのチュートリアル/StepA5)
