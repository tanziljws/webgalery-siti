<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ExportDatabaseSeeder extends Command
{
    protected $signature = 'db:export-seeder {--table=* : Specific tables to export}';
    protected $description = 'Export database data to seeder files';

    public function handle()
    {
        $tables = $this->option('table');
        
        // Jika tidak ada table yang di-specify, export semua table yang ada data
        if (empty($tables)) {
            $tables = $this->getTablesWithData();
        }

        $this->info("Exporting data from " . count($tables) . " tables...");

        $seederContent = "<?php\n\n";
        $seederContent .= "namespace Database\Seeders;\n\n";
        $seederContent .= "use Illuminate\Database\Seeder;\n";
        $seederContent .= "use Illuminate\Support\Facades\DB;\n\n";
        $seederContent .= "class DatabaseDataSeeder extends Seeder\n";
        $seederContent .= "{\n";
        $seederContent .= "    public function run(): void\n";
        $seederContent .= "    {\n";
        $seederContent .= "        // Disable foreign key checks\n";
        $seederContent .= "        DB::statement('SET FOREIGN_KEY_CHECKS=0;');\n\n";

        foreach ($tables as $table) {
            $this->info("Exporting table: {$table}");
            $data = DB::table($table)->get();
            
            if ($data->isEmpty()) {
                $this->warn("  Table {$table} is empty, skipping...");
                continue;
            }

            $seederContent .= $this->generateTableSeeder($table, $data);
        }

        $seederContent .= "        // Enable foreign key checks\n";
        $seederContent .= "        DB::statement('SET FOREIGN_KEY_CHECKS=1;');\n";
        $seederContent .= "    }\n";
        $seederContent .= "}\n";

        $seederPath = database_path('seeders/DatabaseDataSeeder.php');
        File::put($seederPath, $seederContent);

        $this->info("\n✅ Seeder file created: {$seederPath}");
        $this->info("Run: php artisan db:seed --class=DatabaseDataSeeder");
    }

    private function getTablesWithData(): array
    {
        $tables = [
            'kategori',
            'petugas',
            'users',
            'posts',
            'galery',
            'foto',
            'agenda',
            'informasi',
            'site_settings',
            'user_likes',
            'user_dislikes',
            'gallery_like_logs',
        ];

        $tablesWithData = [];
        foreach ($tables as $table) {
            try {
                $count = DB::table($table)->count();
                if ($count > 0) {
                    $tablesWithData[] = $table;
                    $this->info("  Found {$count} rows in {$table}");
                }
            } catch (\Exception $e) {
                // Table doesn't exist, skip
            }
        }

        return $tablesWithData;
    }

    private function generateTableSeeder(string $table, $data): string
    {
        $content = "\n        // Seeding table: {$table}\n";
        $content .= "        DB::table('{$table}')->truncate();\n";
        $content .= "        \$data = [\n";

        foreach ($data as $row) {
            $rowArray = (array) $row;
            $content .= "            [\n";
            foreach ($rowArray as $key => $value) {
                if ($value === null) {
                    $content .= "                '{$key}' => null,\n";
                } elseif (is_numeric($value)) {
                    $content .= "                '{$key}' => {$value},\n";
                } elseif (is_bool($value)) {
                    $content .= "                '{$key}' => " . ($value ? 'true' : 'false') . ",\n";
                } else {
                    $escaped = addslashes($value);
                    $content .= "                '{$key}' => '{$escaped}',\n";
                }
            }
            $content .= "            ],\n";
        }

        $content .= "        ];\n";
        $content .= "        DB::table('{$table}')->insert(\$data);\n\n";

        return $content;
    }
}

