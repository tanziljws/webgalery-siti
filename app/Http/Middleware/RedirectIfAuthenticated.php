<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  ...$guards
     * @return mixed
     */
    public function handle(Request $request, Closure $next, ...$guards)
    {
        $guards = empty($guards) ? [null, 'petugas'] : $guards;

        // Cek guard petugas dulu (prioritas lebih tinggi)
        if (Auth::guard('petugas')->check()) {
            return redirect('/dashboard');
        }

        // Cek guard web (user biasa)
        if (Auth::guard('web')->check()) {
            return redirect()->route('user.dashboard');
        }

        // Cek guard lain yang mungkin di-pass sebagai parameter
        foreach ($guards as $guard) {
            if ($guard !== null && $guard !== 'petugas' && $guard !== 'web') {
                if (Auth::guard($guard)->check()) {
                    return redirect('/dashboard');
                }
            }
        }

        return $next($request);
    }
}
