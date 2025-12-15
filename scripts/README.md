# UCAR_Dialy scripts

このフォルダは、`UCAR_DIALY` リポジトリ運用で使う PowerShell スクリプト群を格納する場所です。  
原典（source）やアーカイブ（archive）の入れ替えなど、手作業ミスを減らす目的で使用します。

---

## acasic_import.ps1 仕様書

### 目的
`Acasic_Record.zip` を展開し、以下に反映することで **Acasic_Record の原典更新を自動化**する。

- `Acasic_Record/_archive/source_threads_v1/`（原典 .md の保管場所）
- `Acasic_Record/_archive/source_threads_v1/raw/`（生素材 .txt の保管場所）

加えて、更新前の内容をバックアップとして退避する（復旧用）。

---

### 反映ルール（重要）
- **.md**：`source_threads_v1/` 直下へコピー（同名があれば上書き、無ければ追加）
- **.txt**：`raw/` へコピー（同名があれば上書き、無ければ追加）
- **削除はしない**
  - zipに無いファイルを自動で消すことはしない（事故防止）

---

### バックアップ
更新前に、以下へ退避する：

- `Acasic_Record/_archive/source_threads_v1/_backup_YYYYMMDD_HHMMSS/`

※ `_backup_*` は `.gitignore` で除外する運用を推奨（ローカル保険として残す）。

---

### 前提（推奨）
- 実行場所：`C:\Python\UCAR_Dialy`（リポジトリ直下）
- 対象ブランチ：`main`
- 文字化け防止：.md は **UTF-8** で保存する（VSCode/Cursor推奨）
- zip配置：基本は repo直下に置く（自動探索はするが直下が確実）

---

### 使い方（基本）
1. 原典更新したいファイルを zip にまとめる
   - 例：`Hunter_Life.md` など（zip直下に入れるのが安全）
   - 例：`.txt` も同梱OK（raw に入る）
2. repo直下で実行：
   ```powershell
   cd C:\Python\UCAR_Dialy
   powershell -ExecutionPolicy Bypass -File .\scripts\acasic_import.ps1
