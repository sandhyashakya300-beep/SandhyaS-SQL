# CSV Encoding Error Fixer

A Python utility for cleaning and converting CSV files that contain **invalid, mixed, or problematic character encodings**.

The script reads a CSV file as raw binary data, checks individual byte sequences, preserves valid UTF-8 characters, and converts problematic bytes using **Windows-1252 (CP1252)** before writing the result as clean UTF-8.

## 📌 Project Overview

CSV files downloaded from different systems or sources can sometimes contain inconsistent character encodings. This may result in errors when importing the file into:

* SQL databases
* Excel
* Python/Pandas
* Data analysis tools
* ETL pipelines

This project provides a lightweight Python-based approach for handling such encoding problems.

The script works directly with the file's binary content rather than relying on a single text encoding declaration.

## ✨ Features

* Reads CSV data in binary mode
* Preserves normal ASCII characters
* Detects potential UTF-8 byte sequences
* Validates UTF-8 sequences before preserving them
* Handles invalid UTF-8 bytes
* Uses Windows-1252 as a fallback encoding
* Converts fallback characters into UTF-8
* Creates a separate cleaned CSV file
* Prints the output file location after processing

## 🛠️ Technologies Used

* **Python 3**
* Python `open()` file handling
* `bytearray`
* UTF-8 encoding/decoding
* Windows-1252 / CP1252 encoding

No external Python libraries are required.

## 📂 Project Structure

```text
csv-encoding-fixer/
│
├── sql_file_error_fix.py
├── zepto_v2.csv
├── zepto_v2_fixed.csv
└── README.md
```

> The input and output paths in the current script are Windows-specific and point to `E:\STORAGE PATH\`.

## 🔄 How It Works

The script follows these main steps:

```text
CSV File
   │
   ▼
Read as Binary Data
   │
   ▼
Process Bytes
   │
   ├── ASCII → Preserve
   │
   ├── Valid UTF-8 → Preserve
   │
   └── Invalid/Other Bytes → Decode as CP1252
   │
   ▼
Convert Result to UTF-8
   │
   ▼
Write Clean CSV
```

## 1. Define Input and Output Files

The script specifies an input CSV and a separate output CSV:

```python
input_file = r"E:\STORAGE PATH\zepto_v2.csv"
output_file = r"E:\STORAGE PATH\zepto_v2_fixed.csv"
```

The output is intentionally written to a separate file so the original dataset is not overwritten.

## 2. Read the CSV as Binary Data

The file is opened using binary mode:

```python
with open(input_file, "rb") as f:
    data = f.read()
```

This allows the program to work directly with individual bytes rather than attempting to decode the entire file immediately.

## 3. Process Individual Bytes

A `bytearray` is used to construct the cleaned result:

```python
result = bytearray()
i = 0
```

The program then iterates through the binary data byte by byte.

## 4. Preserve ASCII Characters

ASCII bytes are preserved directly:

```python
if byte < 128:
    result.append(byte)
    i += 1
```

This allows standard English letters, numbers, punctuation, and other ASCII characters to pass through unchanged.

## 5. Detect Valid UTF-8 Sequences

For bytes that may represent UTF-8 characters, the program tests possible sequence lengths:

```python
for length in (4, 3, 2):
```

Each candidate byte sequence is decoded using UTF-8. If decoding succeeds, the original sequence is preserved.

Conceptually:

```text
Potential UTF-8 sequence
        │
        ▼
Try 4 bytes
        │
        ├── Valid → Preserve
        │
        ▼
Try 3 bytes
        │
        ├── Valid → Preserve
        │
        ▼
Try 2 bytes
        │
        └── Valid → Preserve
```

## 6. Handle Invalid Bytes

If a byte sequence cannot be interpreted as valid UTF-8, the program falls back to Windows-1252:

```python
char = bytes([byte]).decode("cp1252", errors="replace")
result.extend(char.encode("utf-8"))
```

This converts the problematic byte into a character and then encodes that character as UTF-8.

## 7. Handle Other Byte Values

Bytes that do not fall into the earlier conditions are also processed using CP1252:

```python
char = bytes([byte]).decode("cp1252", errors="replace")
result.extend(char.encode("utf-8"))
```

## 8. Write the Cleaned File

After processing all bytes, the resulting data is written to the output CSV:

```python
with open(output_file, "wb") as f:
    f.write(result)
```

The program then prints a success message and the output location.

## 🚀 How to Run

### Prerequisites

Install Python 3.

Verify the installation:

```bash
python --version
```

### Configure the File Paths

Open:

```text
sql_file_error_fix.py
```

Update:

```python
input_file = r"E:\STORAGE PATH\zepto_v2.csv"
output_file = r"E:\STORAGE PATH\zepto_v2_fixed.csv"
```

For example:

```python
input_file = r"C:\Users\YourName\Documents\zepto_v2.csv"
output_file = r"C:\Users\YourName\Documents\zepto_v2_fixed.csv"
```

### Execute the Script

```bash
python sql_file_error_fix.py
```

Expected output:

```text
✅ CSV converted to clean UTF-8
📁 Output: E:\STORAGE PATH\zepto_v2_fixed.csv
```

## 💡 Why Binary Processing?

Reading the file directly as text assumes that the entire file follows one encoding.

For example:

```python
open("file.csv", "r", encoding="utf-8")
```

can fail when a file contains unexpected or mixed byte sequences.

This project instead reads:

```python
open("file.csv", "rb")
```

and performs controlled byte-level processing.

This approach is useful when working with CSV files whose encoding is unknown or inconsistent.

## ⚠️ Important Considerations

This script is designed specifically around the encoding-handling strategy implemented in the uploaded code.

The fallback behavior uses:

```text
Windows-1252 → UTF-8
```

Therefore, the resulting characters depend on how the original bytes were actually encoded.

The script also uses:

```python
errors="replace"
```

when decoding CP1252. This means a byte that cannot be represented correctly can be replaced rather than causing the program to stop.

## 🔒 Data Safety

The script writes the cleaned data to a **new output file** instead of modifying the original input file.

```text
Original:
zepto_v2.csv

Cleaned:
zepto_v2_fixed.csv
```

This makes it possible to retain the original dataset for comparison or backup.

## 📚 Learning Objectives

This project demonstrates:

* Binary file handling in Python
* Reading files using `"rb"`
* Writing files using `"wb"`
* Working with `bytes`
* Working with `bytearray`
* UTF-8 encoding
* CP1252 encoding
* Encoding validation
* Exception handling with `UnicodeDecodeError`
* Iterating through raw binary data
* Data-cleaning techniques

## 🔮 Future Improvements

Possible improvements include:

1. Accept input and output paths through command-line arguments.
2. Automatically detect the source encoding.
3. Add a graphical file-selection interface.
4. Generate a report showing the number of converted bytes.
5. Add logging for problematic byte positions.
6. Add validation to confirm the resulting file is valid UTF-8.
7. Support additional fallback encodings.
8. Add error handling for missing input files.
9. Add unit tests for different encoding scenarios.
10. Integrate the utility into a larger CSV/SQL data-import pipeline.

## 👩‍💻 Author

**Sandhya Shakya**

## 📝 Conclusion

**CSV Encoding Error Fixer** is a practical Python utility for handling CSV files with problematic character encodings.

It demonstrates how binary-level processing can be used to preserve valid UTF-8 sequences while converting problematic bytes into UTF-8-compatible data. The resulting cleaned CSV can then be used for downstream data processing or database-import workflows.
