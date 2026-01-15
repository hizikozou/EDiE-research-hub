📄 Sheet: README / MANUAL（JP）
IWR Measurement Workbook

Iterative Why Robustness (IWR) – Manual Measurement Template

1. このExcelの目的

このワークブックは、
IWR（Iterative Why Robustness） を用いて
LLM / AIシステムの
「なぜ？」に対する意味的・因果的耐性を
手動で再現性高く測定するための実験テンプレートです。

本テンプレは以下を目的とします：

初期IWR実測（自動化前）

モデル間の比較

破綻パターンの収集

後続の自動ベンチマーク設計への橋渡し

2. 基本思想（重要）

1行 = 1ステップ

「Why → Answer → 次のWhy」を逐次記録

数値スコアよりも
破綻の仕方・傾向の観察を重視

IWRは「正解率」ではありません。
意味がどこまで保たれるかを測る指標です。

3. シート構成
■ Overview

実験メタ情報（日時、実験者、条件）

最大深さ K

使用言語

WHYテンプレ

■ Models

実験対象のAIモデル一覧

Model_ID を主キーとして使用

■ PO_JA / PO_EN

種問（P0）一覧

ドメイン分散を意識して選定

■ IWR Measurement Log (Main)

このシートが実験の本体です

主な列：

Model_Name / Model_ID

Seed ID

k（ステップ番号）

Why（質問）

Answer（回答）

New causal factors [Y/N]

contradiction / deviation / bankruptcy [Y/N]

Bankruptcy type（プルダウン）

Notes（自由記述）

■ Bankruptcy type definition

破綻タイプの定義表

評価のブレ防止用

4. 実験手順（手動）

Model を選択

Seed Question（P0）を選択

k=0 から開始

回答を記録

前提→因果→結論を狙って次の Why を生成

破綻が起きたら停止

その時点の k を IWR値とする

5. 破綻判定の考え方

以下のいずれかが明確に現れたら「破綻」とする：

回避（Evasion）

矛盾（Inconsistency）

循環（Circular）

話題逸脱（Deviation）

ポリシー拒否の増殖（Rejection）

表現のみ変化（Stagnation）

※ 迷ったら Notes に理由を書く
　後で分析対象になります。

6. 注意事項

完璧を目指さない

最初は 10問 × 数モデルで十分

手動の「しんどさ」こそ設計知見になる

7. ライセンス・利用

本テンプレは
Evolutionary Discovery Engineering (EDiE)
の研究用途として公開されています。

改変・再配布・派生研究歓迎。
出典表記を推奨します。
