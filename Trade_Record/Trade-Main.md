# Trade-Main

## GM 2025-11_to_12 (Archive)
- Archive: Trade_Record/_archive/source_threads_v1/acv-gm-2025-11_to_12.md
- Raw: Trade_Record/_archive/source_threads_v1/raw/
- Note: day-to-day ops are tracked via STATUS.md and weekly logs.

## Purpose (Σ:UCAR-Trade / GM)
- 週次の相場環境・判断更新点を distilled として時系列ストックし、
  将来UCARが経年データから必要要素を抽出してGM分析の材料にする（トレード効率化）。

## How to Navigate (3-layer map)
- Current location: Trade_Record/STATUS.md
- Weekly index (yearly): Trade_Record/logs/gm/weekly/YYYY/_index.md
- Weekly folder (yearly): Trade_Record/logs/gm/weekly/YYYY/YYYY-MM-DD_wkNN/
  - note.md: background / narrative (long OK)
  - meta.yaml: tags / events (machine-readable)
  - review.md: Weekly Review (result + next plan)
- distilled: Trade_Record/versions/distilled/YYYY/

## Workflow (weekly loop)
- Week start / midweek:
  - Append "Weekly Brief" to STATUS.md (short)
- Week end (Fri close):
  - Write "Weekly Review" into weekly folder (review.md)
  - Add 1-line link to yearly _index.md
  - (Optional) extract distilled items for versions/distilled/

## Monday AM（12/22）ラベル付け（※行動トリガー禁止）
- 月曜朝は薄商いで“狩り”混入率が高いので、**A/B/Cの寄り推定**だけ行う（売買判断はしない）。
- 実際の行動は **終値ゲート**で決定（Tokyo close / NY close）。
- テンプレは note.md 冒頭「Monday AM Check」欄を使用（コピペ運用）。
- logging:
  - 月曜朝ラベル → note.md
  - 終値結果（Tokyo/NY）→ note.md Facts欄
  - 週末まとめ → review.md


  # Trade-Main.md | GM Playbook (Week Start)
updated: 2025-12-22 09:40 JST

目的：
- BOJ後のリスクオン回帰局面で「押し目買い先着」を狙う。
- ただし薄商い×ヘッドライン×オプション要因での“行って来い/急落”を想定し、
  終値ゲートで事故を避ける。

運用原則（固定）：
1) 判定は終値優先（暫定＝東京引け / 最終＝NY引け）
2) 追いかけ買い禁止（指値先着）
3) リスクオフ判定は「3点灯（同日）」を最重視
4) 2243/2638はベータが高いので、分割＋弾（現金）を常に確保

今週の主テーマ：
- クリスマスラリー継続の“本物/偽物”を見分ける週。
- USDJPYが高値圏のため、急伸→急落（介入警戒の形）にも備える。

ゲート（最重要）：
- NY引け：
  - USDJPY: 156.59（割れ＝円高再点火） / 157.703（上抜け維持＝上伸び余地）
  - SPX: 6,667（終値割れ＝リスクオフ濃厚）
  - BTC: 84k（終値割れ＝リスクオフ加速の合図になりやすい）
- 東京引け：
  - JP225: 48,657 → 47,377（終値割れ＝リスクオフ点灯）
  - 2243: 2,514 / 2,387
  - 2638: 2,320 / 2,268

3シナリオ即応：
A) 円高急落（リスクオフ連鎖）
- 条件：USDJPY NY終値で156.59割れ（ヒゲではなく終値）
- 行動：追加買い停止、弾温存。サポ割れ終値連続なら拾い直しモードへ。

B) 行って来い（狩り→終値レンジ回帰）
- 条件：重要ライン割れがヒゲで終わり、終値で回帰
- 行動：指値のみ。成行禁止。買い戻しは終値確認後に限定。

C) 事実買い上抜け（リスクオン継続）
- 条件：USDJPY 157.703上抜け維持＋米株の引け確認＋ETF終値確認（2243=2692/2638=2458）
- 行動：追いかけず、浅押し（4H21MA）or 深押し（サポ帯）で再構築。

ヘッジ利確（小さく・ルール化）：
- 目的：押し目弾を増やす（コアは崩さない）
- 目安：2243/2638 各10〜20口
- トリガー：確認ライン近辺で失速 / 米株が確認してこない / USDJPYが加速し過ぎて形が崩れる


# Trade-Main.md — GM Playbook / Operating Manual
updated: 2026-01-03 (JST)

> NOTE: Key gates/levels are “snapshot”. Source of truth is STATUS.md.

## GM 2025-11_to_12 (Archive)
- Archive: Trade_Record/_archive/source_threads_v1/acv-gm-2025-11_to_12.md
- Raw: Trade_Record/_archive/source_threads_v1/raw/
- Note: day-to-day ops are tracked via STATUS.md and weekly logs.

## Purpose (Σ:UCAR-Trade / GM)
- 週次の相場環境・判断更新点を distilled として時系列ストックし、
  将来UCARが経年データから必要要素を抽出してGM分析の材料にする（トレード効率化）。

## How to Navigate (3-layer map)
- Current location: Trade_Record/STATUS.md
- Weekly index (yearly): Trade_Record/logs/gm/weekly/YYYY/_index.md
- Weekly folder: Trade_Record/logs/gm/weekly/YYYY/<week_id>/
  - note.md: rolling note（facts-first）
  - meta.yaml: tags / regime / levels（machine-readable）
  - review.md: week summary + next plan
  - charts.md + charts/: chart snapshots + level-change reasons
- distilled (monthly): Trade_Record/versions/distilled/YYYY/distilled-gm-YYYY-M.md

## Workflow (weekly loop)
- Week start (Mon):
  - Create weekly folder + templates (note/review/meta/charts + charts/)
  - Set gates/levels for the week (carryover OK; update when new charts arrive)
- Midweek (daily):
  - Append closes/headlines (facts only) to note.md
  - Update fixed signals in meta.yaml (us10y_accel / hy_oas_widening / vix_spike / wti_shock / eps_revision_chain)
  - If a strategy changes: write 1-line decision + evidence (close / official)
- Week end:
  - review.md（what mattered / regime / next plan）
  - Append 1 line into yearly _index.md
  - Append distilled items into monthly distilled file

## Current Playbook (Week Start)
- Current week is tracked in: Trade_Record/STATUS.md
- Week-specific gates/levels/live stance are maintained there (close-based).

### Operating Principles（固定）
1) 判断は終値（暫定＝Tokyo close / 最終＝NY close）
2) 追いかけ買い禁止（先着＝指値、ブレイクは押し待ち）
3) リスク増減はゲートで機械化（主観は補助）
4) ベータ（2243/2638）は“円高/指数失速”で先に崩れやすい → 弾（現金）を確保

### Key gates（最重要）
- Add risk ONLY if:
  - US100 が 25,670 を日足で上抜けし、21MAがサポとして機能（押しても割れにくい）
- Reduce / pause adds if:
  - US100 D1 close < 23,692
  - USDJPY breakdown < 154.7（D/Wいずれも警戒）
- Caution boosters:
  - JP225 Tokyo close < 48,108
  - BTC NY close < 84,023

### Key levels（as of 2026-01-03）
- US100: R 25,670.8 / S 23,692.0 → 22,430.8
- JP225: S 48,108
- USDJPY: R zone 156.8–157.0 / S zone 154.7–154.3
- XAUUSD: S 4,375.48 / 4,328.43
- BTCUSD: S 84,023.10 / R 93,587.47 → 99,750.61
- 201A: triangle endgame（break+hold 確認後のみ追加）

※2243/2638（暫定：wk52から据え置き。次回スクショで更新）
- 2243: S 2,514 → 2,387 / Bull confirm close 2,692
- 2638: S 2,320 → 2,268 / Bull confirm close 2,458

### 3-scenario response（週の骨格）
A) Risk-on confirmation（上抜け“本物”）
- 条件：US100 > 25,670 を終値で確認 → 押しで21MAが支える
- 行動：追わずに押し待ちで分割追加（AIベータも同様）

B) Whipsaw / itte-koi（狩り→回帰）
- 条件：重要ライン割れがヒゲで終わり、終値で回帰
- 行動：指値のみ。投げない。買い戻し/追加は終値確認後

C) Risk-off re-ignition（失速）
- 条件：US100 D1 close < 23,692 または USDJPY < 154.7
- 行動：追加停止。現金+ゴールド寄りへ。日本ベータから先に軽くする選択を検討

### Monday AM label（行動トリガー禁止）
- 月曜朝は薄商いで“狩り”が混入しやすい。
- A/B/C の寄り推定だけを note.md 冒頭に記録し、行動は終値ゲートで決める。
