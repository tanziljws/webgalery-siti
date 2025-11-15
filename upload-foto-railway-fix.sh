#!/bin/bash

# Script untuk upload foto ke Railway dengan benar (fix 0 bytes issue)

echo "📸 Upload Foto ke Railway (Fix 0 Bytes)"
echo "=========================="
echo ""

# Cek Railway CLI
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI tidak ditemukan!"
    echo "Install dengan: npm i -g @railway/cli"
    exit 1
fi

# Cek apakah sudah login
railway status > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "⚠️  Belum login ke Railway. Login dulu..."
    railway login
fi

# Cek folder uploads
if [ ! -d "public/uploads/galeri" ]; then
    echo "❌ Folder public/uploads/galeri tidak ditemukan!"
    exit 1
fi

# Hitung file
FILE_COUNT=$(find public/uploads/galeri -type f -size +0 | wc -l | tr -d ' ')
echo "📁 Ditemukan $FILE_COUNT file foto (non-zero size)"
echo ""

# Buat folder di Railway
echo "📂 Membuat folder di Railway..."
railway run -- mkdir -p public/uploads/galeri

# Upload setiap file dengan base64 encoding (lebih reliable)
echo "⬆️  Upload foto (menggunakan base64 untuk menghindari 0 bytes)..."
UPLOADED=0
FAILED=0

for file in public/uploads/galeri/*; do
    if [ -f "$file" ] && [ -s "$file" ]; then  # Hanya file yang tidak kosong
        filename=$(basename "$file")
        filesize=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
        
        echo -n "  Uploading $filename ($(numfmt --to=iec-i --suffix=B $filesize 2>/dev/null || echo "${filesize}B"))... "
        
        # Upload menggunakan base64 encoding
        if railway run -- bash -c "base64 -d > public/uploads/galeri/$filename" < <(base64 "$file") 2>/dev/null; then
            echo "✅"
            ((UPLOADED++))
        else
            # Fallback: coba dengan cat langsung
            if railway run -- bash -c "cat > public/uploads/galeri/$filename" < "$file" 2>/dev/null; then
                echo "✅ (fallback)"
                ((UPLOADED++))
            else
                echo "❌"
                ((FAILED++))
            fi
        fi
    fi
done

echo ""
echo "=========================="
echo "✅ Upload selesai!"
echo "   Berhasil: $UPLOADED"
echo "   Gagal: $FAILED"
echo ""
echo "💡 Verifikasi:"
echo "   railway run -- ls -lh public/uploads/galeri/ | head -10"

