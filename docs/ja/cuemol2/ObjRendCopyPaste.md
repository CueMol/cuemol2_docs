[Documents](../../Documents)

## Object・Rendererなどのコピー・ペースト機能
CueMol2 2.0.1.145以降では，Object，Renderer，Cameraを同一SceneあるいはSceneをまたいでコピー・ペーストできます．

### Rendererのコピペ
Rendererをクリップボードにコピーし，Objectにペーストする機能です．
同じ設定のRendererを複数のobject等で使用したい場合などに使用すると便利です．

まず，SceneパネルでRendererの項目を右クリックすると，Rendererのコンテキスト・メニューが表示されますが，
その中からCopyを選ぶと，対象とするRendererがクリップボードにコピーされます．


![copypaste_renderer1](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer1.png)


上図の例では，分子Object 1CRN.pdbのリボン表示Renderer ribbon1をコピーした場合です．

そして次に，貼り付ける先のObjectの項目を右クリックしてObjectのコンテキスト・メニューを表示させ，
その中からPaste Rendererを選ぶと，対象とするObjectにRendererがクリップボードからペーストされます．


![copypaste_renderer2](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer2.png)


上図の例では，Object 1QRA.pdbに先ほどのリボン表示Renderer ribbon1をペーストしようとしています．


> ![copypaste_renderer3](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer3.png) ![copypaste_renderer4](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_renderer4.png)

ペーストすると，上図のようにコピーしたribbon1が追加されます．分子ビューの方にもリボンモデルが表示されます．

貼り付ける先のObjectは，同じシーンでも別のシーンのものに対しても可能です．

ただし，無効なObjectにペーストした場合，エラーになりペーストは行われません．
例えば，電子密度のRenderer (contour)を分子(MolCoord型のObject)にペーストしようとしても，
エラーになります．

Rendererの名前は，重複する名前のものがない場合はコピー時と同じになりますが，
既に同じ名前のものがある場合は，「copy1_」などの文字が付くようになります．

### Objectのコピペ
同様に，Scene中のObject (分子MolCoord，電子密度DensityMapなど）をクリップボードにコピーし，
同じあるいは異なるSceneに対してペーストする機能です．
同一Scene中で同じObjectを複数使用したい場合や，別のSceneからObjectを複製してきたい場合などに使用すると便利です．

まず，SceneパネルでObjectの項目を右クリックすると，Objectのコンテキスト・メニューが表示されますが，
その中からCopy Objectを選ぶと，対象とするObjectがクリップボードにコピーされます．

![copypaste_obj1](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_obj1.png)


そして次に，貼り付ける先のSceneの項目を右クリックしてSceneのコンテキスト・メニューを表示させ，
その中からPasteを選ぶと，対象とするSceneにObjectがクリップボードからペーストされます．

![copypaste_obj2](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_obj2.png)


以下は，新規作成したSceneに分子Object 1CRN.pdbをペーストした例です．
ObjectがRendererを有する場合は（下図の例ではribbon1）それらも含めてコピー・ペーストされます．


![copypaste_obj3](../../assets/images/cuemol2/ObjRendCopyPaste/copypaste_obj3.png)


Objectの名前は，重複する名前のものがない場合はコピー時と同じになりますが，
既に同じ名前のものがある場合は，「copy1_」などの文字が付くようになります．

### Cameraのコピペ
同様に，
Cameraをクリップボードにコピー・ペーストする機能です．
同じ設定のCameraを複数のScene等で使用したい場合などに使用すると便利です．
