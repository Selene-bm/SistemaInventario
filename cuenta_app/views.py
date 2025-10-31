from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from .forms import UsuarioForm
from django.contrib import messages

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
    return render(request, 'register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            messages.error(request, 'Usuario o contraseña incorrectos')
    return render(request, 'login.html')