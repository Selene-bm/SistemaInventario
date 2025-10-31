from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import Usuario

class UsuarioForm(UserCreationForm):
    # Sobreescribir los campos para personalizar
    username = forms.CharField(widget=forms.TextInput(attrs={
        # 'class': 'form-control',
        'placeholder': 'Nombre de usuario'
    }))
    email = forms.EmailField(widget=forms.EmailInput(attrs={
        # 'class': 'form-control',
        'placeholder': 'correo@ejemplo.com'
    }))
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={
        # 'class': 'form-control',
        'placeholder': 'Contraseña'
    }))
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={
        # 'class': 'form-control',
        'placeholder': 'Confirmar contraseña'
    }))

    class Meta:
        model = Usuario
        fields = ['username', 'nombre', 'apellido', 'email', 'rol', 'password1', 'password2']
        widgets = {
            'nombre': forms.TextInput(attrs={
                # 'class': 'form-control',
                'placeholder': 'Tu nombre'
            }),
            'apellido': forms.TextInput(attrs={
                # 'class': 'form-control',
                'placeholder': 'Tu apellido'
            }),
            'rol': forms.Select(attrs={
                # 'class': 'form-control form-select',
            })
        }