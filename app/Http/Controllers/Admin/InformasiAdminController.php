<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Informasi;
use Illuminate\Http\Request;

class InformasiAdminController extends Controller
{
    public function index()
    {
        $informasiItems = Informasi::orderBy('order')->orderByDesc('date')->paginate(10);
        return view('admin.informasi-items.index', compact('informasiItems'));
    }

    public function create()
    {
        return view('admin.informasi-items.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'icon' => 'nullable|string|max:255',
            'date' => 'required|date',
            'status' => 'required|in:aktif,nonaktif',
            'order' => 'nullable|integer|min:0',
        ]);

        Informasi::create($validated);

        return redirect()->route('admin.informasi-items.index')
            ->with('success', 'Informasi berhasil ditambahkan.');
    }

    public function edit(Informasi $informasi_item)
    {
        return view('admin.informasi-items.edit', ['informasi' => $informasi_item]);
    }

    public function update(Request $request, Informasi $informasi_item)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'icon' => 'nullable|string|max:255',
            'date' => 'required|date',
            'status' => 'required|in:aktif,nonaktif',
            'order' => 'nullable|integer|min:0',
        ]);

        $informasi_item->update($validated);

        return redirect()->route('admin.informasi-items.index')
            ->with('success', 'Informasi berhasil diperbarui.');
    }

    public function destroy(Informasi $informasi_item)
    {
        $informasi_item->delete();

        return redirect()->route('admin.informasi-items.index')
            ->with('success', 'Informasi berhasil dihapus.');
    }
}
