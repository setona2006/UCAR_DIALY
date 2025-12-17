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

## Workflow (weekly loop)
- Week start / midweek:
  - Append "Weekly Brief" to STATUS.md (short)
- Week end (Fri close):
  - Write "Weekly Review" into weekly folder (review.md)
  - Add 1-line link to yearly _index.md
  - (Optional) extract distilled items for versions/distilled/
