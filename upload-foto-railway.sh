#!/bin/bash

# Script untuk upload foto ke Railway
# Pastikan Railway CLI sudah terinstall: npm i -g @railway/cli

echo "🚀 Upload Foto ke Railway"
echo "=========================="
echo ""

# Cek apakah Railway CLI terinstall
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI tidak ditemukan!"
    echo "Install dengan: npm i -g @railway/cli"
    exit 1
fi

# Cek apakah folder uploads ada
if [ ! -d "public/uploads/galeri" ]; then
    echo "❌ Folder public/uploads/galeri tidak ditemukan!"
    exit 1
fi

# Hitung jumlah file
FILE_COUNT=$(find public/uploads/galeri -type f | wc -l | tr -d ' ')
echo "📁 Ditemukan $FILE_COUNT file foto"
echo ""

# Konfirmasi
read -p "Apakah Anda sudah login ke Railway? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Login dulu dengan: railway login"
    exit 1
fi

# Buat folder di Railway
echo "📂 Membuat folder di Railway..."
railway run -- mkdir -p public/uploads/galeri

# Upload setiap file
echo "⬆️  Upload foto..."
UPLOADED=0
FAILED=0

for file in public/uploads/galeri/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo -n "  Uploading $filename... "
        
        # Upload file menggunakan railway run dengan base64 encoding
        if railway run -- bash -c "cat > public/uploads/galeri/$filename" < "$file" 2>/dev/null; then
            echo "✅"
            ((UPLOADED++))
        else
            echo "❌"
            ((FAILED++))
        fi
    fi
done

echo ""
echo "=========================="
echo "✅ Upload selesai!"
echo "   Berhasil: $UPLOADED"
echo "   Gagal: $FAILED"
echo ""
echo "💡 Tips: Jika upload gagal, gunakan Railway Dashboard → Files untuk upload manual"

