from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from .forms import UsuarioForm
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.views.decorators.http import require_POST

# @csrf_exempt
def register_view(request):
    if request.method == 'POST':
        form = UsuarioForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Registro exitoso!')
            return redirect('/')
        else:
            messages.error(request, 'Error en el registro. Por favor verifica los datos.')
    else:
        form = UsuarioForm()
    return render(request, 'cuenta_app/register.html', {'form': form})



# @csrf_exempt
def login_view(request):
    # If already authenticated, send user to their profile instead of the login form
    if request.user.is_authenticated:
        return redirect('cuenta:perfil')
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'cuenta_app/login.html')


@login_required
def profile_view(request):
    """Show the current user's profile / details. Requires login."""
    # request.user is an instance of cuenta_app.Usuario
    return render(request, 'cuenta_app/detail.html', {'usuario': request.user})


@login_required
@require_POST
def logout_view(request):
    """Log the user out and redirect to home with a message (POST-only)."""
    logout(request)
    messages.success(request, 'Has cerrado sesión correctamente.')
    return redirect('/')