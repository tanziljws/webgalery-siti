#!/bin/bash

# Script untuk upload DJI_0148.JPG ke Railway

echo "📸 Upload DJI_0148.JPG ke Railway"
echo "=========================="
echo ""

# Cek apakah file ada
if [ ! -f "public/images/DJI_0148.JPG" ]; then
    echo "❌ File public/images/DJI_0148.JPG tidak ditemukan!"
    exit 1
fi

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

# Buat folder images jika belum ada
echo "📂 Membuat folder public/images..."
railway run -- mkdir -p public/images

# Upload file
echo "⬆️  Upload DJI_0148.JPG (8MB)..."
echo "   Ini mungkin butuh waktu beberapa detik..."

if railway run -- bash -c "cat > public/images/DJI_0148.JPG" < public/images/DJI_0148.JPG 2>&1; then
    echo "✅ Upload berhasil!"
    
    # Buat juga versi lowercase untuk kompatibilitas
    echo "📝 Membuat symlink lowercase..."
    railway run -- bash -c "ln -sf DJI_0148.JPG public/images/DJI_0148.jpg" 2>&1 || \
    railway run -- bash -c "cp public/images/DJI_0148.JPG public/images/DJI_0148.jpg" 2>&1
    
    echo ""
    echo "✅ Selesai!"
    echo ""
    echo "💡 File sekarang tersedia di:"
    echo "   - /images/DJI_0148.JPG"
    echo "   - /images/DJI_0148.jpg (symlink/copy)"
else
    echo "❌ Upload gagal!"
    echo ""
    echo "💡 Coba upload manual via Railway Dashboard:"
    echo "   1. Buka Railway Dashboard → Your Service → Files"
    echo "   2. Navigate ke public/images/"
    echo "   3. Upload file DJI_0148.JPG"
    exit 1
fi

