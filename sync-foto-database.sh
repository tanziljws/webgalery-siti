#!/bin/bash

# Script untuk sync file foto dengan database

echo "🔄 Sync File Foto dengan Database"
echo "=========================="
echo ""

# 1. Cek file di folder
echo "1. Cek file di folder..."
FILES_IN_FOLDER=$(railway run -- ls -1 public/uploads/galeri/ 2>/dev/null | sort)
FOLDER_COUNT=$(echo "$FILES_IN_FOLDER" | wc -l | tr -d ' ')
echo "   ✅ File di folder: $FOLDER_COUNT"

# 2. Cek file di database
echo ""
echo "2. Cek file di database..."
DB_FILES=$(railway run -- php artisan tinker --execute="
\$files = \App\Models\Foto::pluck('file')->toArray();
echo implode(PHP_EOL, \$files);
" 2>&1 | tail -n +2)
DB_COUNT=$(echo "$DB_FILES" | grep -v "^$" | wc -l | tr -d ' ')
echo "   ✅ File di database: $DB_COUNT"

# 3. Cari file yang ada di folder tapi tidak di database
echo ""
echo "3. Cari file yang ada di folder tapi tidak di database..."
MISSING_IN_DB=$(comm -23 <(echo "$FILES_IN_FOLDER" | sort) <(echo "$DB_FILES" | sort | grep -v "^$"))
MISSING_COUNT=$(echo "$MISSING_IN_DB" | grep -v "^$" | wc -l | tr -d ' ')

if [ "$MISSING_COUNT" -gt "0" ]; then
    echo "   ⚠️  Ada $MISSING_COUNT file di folder yang tidak ada di database"
    echo "   Sample file yang missing:"
    echo "$MISSING_IN_DB" | head -5 | while read file; do
        echo "     - $file"
    done
else
    echo "   ✅ Semua file di folder sudah ada di database"
fi

# 4. Cari file yang ada di database tapi tidak di folder
echo ""
echo "4. Cari file yang ada di database tapi tidak di folder..."
MISSING_IN_FOLDER=$(comm -13 <(echo "$FILES_IN_FOLDER" | sort) <(echo "$DB_FILES" | sort | grep -v "^$"))
MISSING_FOLDER_COUNT=$(echo "$MISSING_IN_FOLDER" | grep -v "^$" | wc -l | tr -d ' ')

if [ "$MISSING_FOLDER_COUNT" -gt "0" ]; then
    echo "   ❌ Ada $MISSING_FOLDER_COUNT file di database yang tidak ada di folder"
    echo "   File yang missing:"
    echo "$MISSING_IN_FOLDER" | head -10 | while read file; do
        echo "     - $file"
    done
    echo ""
    echo "   💡 File-file ini perlu di-upload ke Railway"
else
    echo "   ✅ Semua file di database sudah ada di folder"
fi

# 5. Re-seed database dengan data yang sesuai
echo ""
echo "5. Re-seed database dengan data terbaru..."
read -p "   Apakah Anda ingin re-seed database? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "   Seeding database..."
    railway run -- php artisan db:seed --class=DatabaseDataSeeder --force 2>&1 | tail -5
    echo "   ✅ Database di-seed ulang"
else
    echo "   ⏭️  Skip re-seed"
fi

# 6. Clear cache
echo ""
echo "6. Clear cache..."
railway run -- php artisan view:clear 2>&1 | tail -1
railway run -- php artisan cache:clear 2>&1 | tail -1

echo ""
echo "=========================="
echo "✅ Sync selesai!"
echo ""
echo "💡 Next steps:"
echo "   1. Jika ada file missing di folder, upload dengan: ./upload-foto-railway.sh"
echo "   2. Jika ada file missing di database, re-seed database"
echo "   3. Refresh browser dengan hard refresh (Ctrl+Shift+R)"

