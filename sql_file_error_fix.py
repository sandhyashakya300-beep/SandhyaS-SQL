input_file = r"E:\STORAGE PATH\zepto_v2.csv"
output_file = r"E:\STORAGE PATH\zepto_v2_fixed.csv"

with open(input_file, "rb") as f:
    data = f.read()

result = bytearray()
i = 0

while i < len(data):
    byte = data[i]

    # Normal ASCII
    if byte < 128:
        result.append(byte)
        i += 1

    # Try to preserve valid UTF-8 sequences
    elif byte in range(0xC2, 0xF5):
        found = False

        for length in (4, 3, 2):
            if i + length <= len(data):
                chunk = data[i:i + length]
                try:
                    chunk.decode("utf-8")
                    result.extend(chunk)
                    i += length
                    found = True
                    break
                except UnicodeDecodeError:
                    pass

        if not found:
            # Decode problematic byte as Windows-1252
            char = bytes([byte]).decode("cp1252", errors="replace")
            result.extend(char.encode("utf-8"))
            i += 1

    # Windows-1252 special characters
    else:
        char = bytes([byte]).decode("cp1252", errors="replace")
        result.extend(char.encode("utf-8"))
        i += 1

with open(output_file, "wb") as f:
    f.write(result)

print("✅ CSV converted to clean UTF-8")
print("📁 Output:", output_file)