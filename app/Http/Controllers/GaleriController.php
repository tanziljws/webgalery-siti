<?php

namespace App\Http\Controllers;

use App\Models\galery;
use App\Models\Kategori;
use Illuminate\Http\Request;

class GaleriController extends Controller
{
    public function index(Request $request)
    {
        $galeri = galery::with(['post.kategori', 'fotos'])->get();

        if ($request->ajax()) {
            return response()->json($galeri);
        }

        return view('galeri.index', compact('galeri'));
    }

    public function create()
    {
        $kategori = Kategori::all();
        return view('galeri.create', compact('kategori'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'deskripsi' => 'nullable|string',
            'kategori_id' => 'required|exists:kategori,id',
            'fotos' => 'required|array|min:1',
            'fotos.*' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:10240'
        ]);

        // Buat folder upload jika belum ada
        if (!file_exists(public_path('uploads/galeri'))) {
            mkdir(public_path('uploads/galeri'), 0755, true);
        }

        // 1. Buat post dulu
        $post = \App\Models\posts::create([
            'judul' => $request->judul,
            'kategori_id' => $request->kategori_id,
            'petugas_id' => 1, // Use default petugas ID 1 (always exists)
            'isi' => $request->deskripsi ?? '',
            'status' => 'published'
        ]);

        // 2. Buat galeri yang terkait dengan post
        $galeri = galery::create([
            'post_id' => $post->id,
            'position' => null,
            'status' => 'aktif'
        ]);

        // 3. Upload dan simpan multiple files
        $uploadedFiles = [];
        if ($request->hasFile('fotos')) {
            foreach ($request->file('fotos') as $index => $foto) {
                $namaFoto = time() . '_' . $index . '.' . $foto->getClientOriginalExtension();
                $foto->move(public_path('uploads/galeri'), $namaFoto);
                
                // Simpan ke tabel foto
                \App\Models\foto::create([
                    'galery_id' => $galeri->id,
                    'file' => $namaFoto
                ]);
                
                $uploadedFiles[] = $namaFoto;
            }
        }

        if ($request->ajax()) {
            return response()->json([
                'success' => true, 
                'data' => $galeri,
                'uploaded_files' => $uploadedFiles,
                'message' => count($uploadedFiles) . ' foto berhasil diupload!'
            ]);
        }

        return redirect()->route('galeri.index')->with('success', count($uploadedFiles) . ' foto berhasil ditambahkan ke galeri!');
    }

    public function show(galery $galeri)
    {
        $galeri->load(['post.kategori', 'fotos']);
        
        if (request()->ajax()) {
            return response()->json($galeri);
        }
        
        return view('galeri.show', compact('galeri'));
    }

    public function edit(galery $galeri)
    {
        $kategori = Kategori::all();
        $galeri->load(['post.kategori', 'fotos']);

        // Jika AJAX, kembalikan data JSON untuk modal edit
        if (request()->ajax()) {
            return response()->json($galeri);
        }

        return view('galeri.edit', compact('galeri', 'kategori'));
    }

    public function update(Request $request, galery $galeri)
    {
        $request->validate([
            'judul' => 'required|string|max:255',
            'deskripsi' => 'nullable|string',
            'kategori_id' => 'required|exists:kategori,id',
            'status' => 'required|in:aktif,nonaktif',
            'fotos' => 'nullable|array',
            'fotos.*' => 'image|mimes:jpeg,png,jpg,gif,webp|max:10240'
        ]);

        // Update galeri status
        $galeri->update([
            'status' => $request->status
        ]);

        // Update post data
        if ($galeri->post) {
            $galeri->post->update([
                'judul' => $request->judul,
                'isi' => $request->deskripsi,
                'kategori_id' => $request->kategori_id,
            ]);
        }

        // Handle new photo uploads
        if ($request->hasFile('fotos')) {
            foreach ($request->file('fotos') as $foto) {
                $namaFoto = time() . '_' . uniqid() . '.' . $foto->getClientOriginalExtension();
                $foto->move(public_path('uploads/galeri'), $namaFoto);
                
                // Create foto record
                $galeri->fotos()->create([
                    'file' => $namaFoto,
                    'galeri_id' => $galeri->id
                ]);
            }
        }

        if ($request->ajax()) {
            return response()->json(['success' => true, 'data' => $galeri->load(['post.kategori', 'fotos'])]);
        }

        return redirect()->route('galeri.index')->with('success', 'Galeri berhasil diupdate!');
    }

    public function destroy(galery $galeri)
    {
        if ($galeri->foto && file_exists(public_path('uploads/galeri/' . $galeri->foto))) {
            unlink(public_path('uploads/galeri/' . $galeri->foto));
        }

        $galeri->delete();

        if (request()->ajax()) {
            return response()->json(['success' => true]);
        }

        return redirect()->route('galeri.index')->with('success', 'Foto berhasil dihapus!');
    }

    // Tambahan: toggle status (aktif/nonaktif atau verified/pending)
    public function toggleStatus(galery $galeri)
    {
        $galeri->status = $galeri->status === 'aktif' ? 'nonaktif' : 'aktif';
        $galeri->save();

        return response()->json(['success' => true, 'status' => $galeri->status]);
    }
}
