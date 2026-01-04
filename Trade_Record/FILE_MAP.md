# FILE_MAP — Trade_Record 全体の用途・役割テンプレ
updated: 2025-12-21 (JST)
scope: Trade_Record/ 配下の「何がどこにあり、何のために存在するか」を1枚で固定する

---

## 0) 最短ナビ（迷子防止）
1. 現在地：`Trade_Record/STATUS.md`
2. 運用ルール：`Trade_Record/Trade-Main.md` → `Trade_Record/HANDOFF.md`
3. 週次一覧：`Trade_Record/logs/gm/weekly/YYYY/_index.md`
4. 該当週：`Trade_Record/logs/gm/weekly/YYYY/YYYY-MM-DD_wkNN/`
5. 月次 distilled：`Trade_Record/versions/distilled/YYYY/distilled-gm-YYYY-MM.md`

---

## 1) ルート直下（正本の“入口”）

### `Trade_Record/STATUS.md`
- 役割：**現在地（Latest Brief / 直近の方針）**
- 更新タイミング：週前半〜週中の“短い更新”、次週に持ち越すゲート等
- 書き方：短文・箇条書き中心（結論→根拠→次の行動）

### `Trade_Record/Trade-Main.md`
- 役割：**運用の憲法（目的・導線・手順・禁止事項）**
- 含むべき内容：
  - 目的（GM週次レビュー → distilled熟成）
  - 3層ナビ（STATUS → _index → weekly）
  - 週次ループ（平日/週末）
  - Monday AMラベル運用（行動トリガー禁止）
- 更新タイミング：運用ルールを変えたときだけ（頻繁にいじらない）

### `Trade_Record/HANDOFF.md`
- 役割：**スレッド移行・別環境移行の引継ぎ手順**
- 更新タイミング：運用フロー/フォルダ規約/入力パッケージが変わったとき

### `Trade_Record/BRANCH_MAP.md`
- 役割：**Git運用ルール（正本・枝を切る条件・命名・マージ規約）**
- 更新タイミング：ブランチ運用を変えたときだけ

---

## 2) 週次ログ（GMの“現場”）

### `Trade_Record/logs/gm/weekly/YYYY/_index.md`
- 役割：**年単位の週次一覧（導線の地図）**
- 更新タイミング：週末（Fri close〜Sat）に「1行追記」
- 置く情報：
  - 週フォルダへのリンク
  - 週のテーマ（短く）
  - 主要ゲート（超短く）

### `Trade_Record/logs/gm/weekly/YYYY/YYYY-MM-DD_wkNN/`
- 役割：**その週の“完結パッケージ”**
- 原則：週が終わったら“積む”運用（過去週の大改変は極力しない）

#### `.../note.md`
- 役割：**週内メモ（facts / decisions のローリング）＋ 月曜朝ラベル欄**
- 更新タイミング：平日（随時）
- ルール：
  - facts（事実）中心
  - decision（方針変更）が起きたら1行で追記
  - URL直貼りは避け、チャートは `./charts.md` に集約

#### `.../review.md`
- 役割：**週末確定レビュー（終値ベースで総括→来週へ接続）**
- 更新タイミング：Fri close後
- 中身の型：
  - Week Summary（週の要点）
  - Decisions / Actions（何を変えた）
  - Key Levels（close-based）
  - Week-ahead（来週の即応分岐）

#### `.../meta.yaml`
- 役割：**機械拾い用（タグ・イベント・水準・ゲート）**
- 更新タイミング：週末（UCAR整形前提でラフでもOK）
- 使い道：
  - 将来の検索・抽出・自動要約の高速化
  - “regime/trigger/decision/evidence” を機械が拾える形にする

#### `.../charts.md`
- 役割：**チャート共有リンクの正本（GoogleDrive等）**
- 更新タイミング：週末にまとめて更新
- ルール：
  - 週足＋日足を1枚にまとめたスクショを基本
  - note/review からは直URLを貼らず `./charts.md` を参照

#### `.../charts/`（任意）
- 役割：ローカル保存用（スクショ置き場）
- 注意：Gitに入れる/入れないは運用次第（容量と相談）

---

## 3) distilled（熟成する“核”）

### `Trade_Record/versions/distilled/YYYY/distilled-gm-YYYY-MM.md`
- 役割：**月次 distilled の正本（週ごとの判断更新点を追記で蓄積）**
- 更新タイミング：週末（review作成と同時に追記するのが理想）
- 中身の型（1ユニット）：
  - What changed (facts)
  - What changed (decisions)
  - Gates / Levels
  - tags

---

## 4) アーカイブ（一次資料置き場）

### `Trade_Record/_archive/source_threads_v1/`
- 役割：**過去スレッド原文・抽出元（一次資料）**
- 位置づけ：参照用。運用の“正本”ではない（正本は logs/ と versions/）

#### `.../acv-gm-YYYY-MM_to_YY.md`
- 役割：過去スレッドの統合アーカイブ（読み物/証拠）
- 更新タイミング：たまに（まとめ直し時だけ）

#### `.../raw/`
- 役割：原文/素材の保管庫（加工前）

---

## 5) 命名規約（最低限）
- 週フォルダ：`YYYY-MM-DD_wkNN`
- distilled（月次）：`distilled-gm-YYYY-MM.md`
- 週次index：`logs/gm/weekly/YYYY/_index.md`

---

## 6) “どれを触る？”早見表（作業別）
- 今日の方針を短く更新 → `STATUS.md`
- 週内の事実を追記 → 該当週 `note.md`
- チャートリンクをまとめる → 該当週 `charts.md`
- 週末に総括して来週へ繋ぐ → 該当週 `review.md` + `meta.yaml` + 年次 `_index.md` 1行追記
- 判断更新点を熟成させる → `versions/distilled/YYYY/distilled-gm-YYYY-MM.md` に追記
- 運用ルール変更 → `Trade-Main.md` / `HANDOFF.md` / `BRANCH_MAP.md`

---
